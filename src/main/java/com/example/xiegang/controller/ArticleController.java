package com.example.xiegang.controller;

import com.example.xiegang.form.GiveLikeForm;
import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.form.CreatArticleForm;
import com.example.xiegang.form.getArtListForm;
import com.example.xiegang.service.ArticleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;



@RestController
@RequestMapping("/article")
@Api(tags = "文章相关接口")
public class ArticleController {

    @Autowired
    private ArticleService articleService;


    @Autowired
    private HttpServletRequest httpServletRequest;


    @ApiOperation("获取文章详情byId")
    @GetMapping(value = "/getInfo")
    public ResponseResult getDetail(@RequestParam(value = "artId") Long artId) {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return articleService.getArticleDetail(artId, userId);
    }


    @ApiOperation("上传文章")
    @PostMapping(value = "/upArticle")
    public ResponseResult insertArticle(@RequestBody CreatArticleForm form) {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return articleService.upArticle(form, userId);
    }

    @ApiOperation("上传文章图片")
    @PostMapping(value = "/upArcPic")
    public ResponseResult uploadFile(@RequestParam(value = "file", required = true) MultipartFile upload) {
        return articleService.upArcPic(upload);
    }
    //
    // @RoleControl(role = RoleEnum.ADMIN)
    // @ApiOperation("删除文章")
    // @GetMapping(name = "删除文章", value = "/deleteArticle")
    // public ResponseResult deleteArticle(Long blogId) {
    //     return articleService.deleteArticle(blogId);
    // }
    //

    @ApiOperation("获取10篇文章列表，按分类过滤（可选）")
    @GetMapping(value = "/artList")
    public ResponseResult getArtList(@Valid getArtListForm form) {
        Long start = form.getStartId();
        Long typeId = form.getTypeId();
        return articleService.getArtList(start, typeId);
    }

    @ApiOperation("点赞或取消点赞文章")
    @GetMapping(name = "点赞或取消点赞文章",value = "/giveLike")
    public ResponseResult giveLike(@Valid GiveLikeForm form){
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return articleService.likeArticle(form,userId);
    }

    @ApiOperation("获取文章板块分类")
    @GetMapping(name = "获取文章板块分类",value = "/getType")
    public ResponseResult getType(){
        return articleService.getType();
    }

}
