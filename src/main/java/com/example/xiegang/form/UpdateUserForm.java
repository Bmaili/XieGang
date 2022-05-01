package com.example.xiegang.form;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
public class UpdateUserForm {

    @ApiModelProperty("用户手机号码")
    private String phone;

    @ApiModelProperty("用户昵称")
    private String userName;

    @ApiModelProperty("用户性别(0未知,1男,2女）")
    private String sex;//(0未知,1男,2女）

}
