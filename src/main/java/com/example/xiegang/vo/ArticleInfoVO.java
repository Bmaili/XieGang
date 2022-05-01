package com.example.xiegang.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ArticleInfoVO {
    private Long id;

    private Long authorId;//作者Id

    private Long reading = 0L;

    private Long comments = 0L;

    private Long likes = 0L; //收藏

    private boolean isLike;

    private Long typeId;

    private String typeName;

    private Date createTime;

    private String[] picPath; //图片数组url路径

    private String context;  //文章内容

    private List<CommentVO> commentList; //评论内容
}
