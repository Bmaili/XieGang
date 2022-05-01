package com.example.xiegang.controller;

import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.form.CreatCommentForm;
import com.example.xiegang.form.getCommentForm;
import com.example.xiegang.service.CommentService;
import com.example.xiegang.vo.CommentVO;
import com.example.xiegang.vo.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/comment")
@Api(tags = "评论相关接口")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private HttpServletRequest httpServletRequest;


    @ApiOperation("评论文章")
    @PostMapping(value = "/insert")
    public ResponseResult creatComment(@RequestBody CreatCommentForm form) {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return commentService.creatComment(form, userId);
    }

    @ApiOperation("获得某篇文章5条评论")
    @GetMapping(value = "/get")
    public ResponseResult getComments(@Valid getCommentForm form) {
        List<CommentVO> commentListByArtId = commentService.getCommentListByArtId(form.getArtId(), form.getIndex());
        return new ResponseResult(ResultEnum.SUCCESS_GET, commentListByArtId);

    }
}
