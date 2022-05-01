package com.example.xiegang.form;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.jetbrains.annotations.NotNull;


@Data
public class getCommentForm {
    @ApiModelProperty("文章Id")
    @NotNull("文章Id不能为空")
    private Long artId;

    @ApiModelProperty("加载的根评论的定位，意味着请求从它开始的5条根评论（非必要参数）")
    private Long index = 0L;
}
