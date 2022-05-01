package com.example.xiegang.vo;

import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
public class CommentVO {
    private Long commentId;

    private Long userId;

    private Long articleId;

    private String userName;

    private String avatar;

    private String createTime;

    private String context;

    private String pid;

    private List<ReplyVO> replyVO;
}