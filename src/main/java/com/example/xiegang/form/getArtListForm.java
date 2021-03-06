package com.example.xiegang.form;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.jetbrains.annotations.NotNull;

@Data
public class getArtListForm {
    @ApiModelProperty("起始行数的文章Id，意味着请求从它开始的10条记录（非必要参数）")
    private Long startId = 0L;

    @ApiModelProperty("文章分类Id，（非必要参数）")
    private Long typeId = 0L;
}
