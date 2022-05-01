package com.example.xiegang.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class ArticleInfo implements Serializable {
    private Long id;

    private Long authorId;//作者Id

    private String digest;//文章摘要，可以截取文章内容前50字

    private Long reading = 0L;

    private Long comments = 0L;

    private Long likes = 0L; //收藏

    private Long typeId;

    private String typeName;

    private Date createTime;

    private String picture; //图片数组url路径

    private String context;  //文章内容
}
