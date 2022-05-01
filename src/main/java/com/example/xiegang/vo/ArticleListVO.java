package com.example.xiegang.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ArticleListVO {
    private Long id;

    private String digest;//文章摘要，可以截取文章内容前50字

    private Long authorId;//作者Id

    private String userName;//作者昵称

    private String avatar;//作者头像

    private Long reading = 0L;

    private Long comments = 0L;

    private Long likes = 0L; //收藏

    private Long typeId;

    private String typeName;

    private Date createTime;

    private String[] picPath; //图片数组url路径
}
