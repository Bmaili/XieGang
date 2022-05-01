package com.example.xiegang.form;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import org.jetbrains.annotations.NotNull;


@Data
public class CreatArticleForm {

    @ApiModelProperty("标签id数组")
    @NotNull("标签id不能为空")
    private Long typeId;

    @ApiModelProperty("图片url数组")
    @NotNull("PicPath为必须参数")
    private String[] picPath;

    @ApiModelProperty("文章内容")
    @NotNull("文章内容不能为空")
    private String context;
}
