package com.example.xiegang.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReplyVO {
    private Long commentId;

    private Long userId;

    private Long articleId;

    private String userName;

    private String avatar;

    private Long replyUserId;

    private String replyUserName;

    private String replyAvatar;

    private Long pid;

    private String createTime;

    private String context;
}
