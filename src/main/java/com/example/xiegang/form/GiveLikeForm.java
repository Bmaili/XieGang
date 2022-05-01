package com.example.xiegang.form;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.jetbrains.annotations.NotNull;

@Data
public class GiveLikeForm {
    @ApiModelProperty("文章id")
    @NotNull
    private Long articleId;

    @ApiModelProperty("是否点赞 false为取消")
    @NotNull
    private Boolean isLike;
}
