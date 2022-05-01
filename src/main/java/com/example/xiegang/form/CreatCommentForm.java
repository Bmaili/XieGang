package com.example.xiegang.form;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import org.jetbrains.annotations.NotNull;

@Data
public class CreatCommentForm {

    @ApiModelProperty("文章Id")
    @NotNull( "文章Id不能为空")
    private Long articleId;

    @ApiModelProperty("评论内容")
    @NotNull( "评论内容不能为空")
    private String context;

    @ApiModelProperty("被回复人，若为首级评论则为0")
    private Long replyUserId = 0L;

    @ApiModelProperty("父级评论Id 若为首级评论则为0")
    private Long pid = 0L;

}
