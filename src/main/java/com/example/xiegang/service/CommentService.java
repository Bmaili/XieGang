package com.example.xiegang.service;

import com.example.xiegang.form.CreatCommentForm;
import com.example.xiegang.vo.CommentVO;
import com.example.xiegang.vo.ResponseResult;

import java.util.List;

public interface CommentService {
    ResponseResult creatComment(CreatCommentForm form, Long userId);

    List<CommentVO> getCommentListByArtId(Long artId,Long startNum);
}
