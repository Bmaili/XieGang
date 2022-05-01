package com.example.xiegang.entity;

import lombok.Data;

@Data
public class Comment {
    private Long commentId = 0L;

    private Long userId = 0L;

    private Long articleId = 0l;

    private Long replyUserId = 0L;

    private Long pid = 0L;

    private String context;

    private String createTime;
}
