package com.example.xiegang.form;

import lombok.Data;
import io.swagger.annotations.ApiModelProperty;

import org.jetbrains.annotations.NotNull;


@Data
public class LoginForm {
    @ApiModelProperty("登陆电子邮箱")
    @NotNull("邮箱不能为空")
    private String email;

    @ApiModelProperty("登陆密码")
    @NotNull("密码不能为空")
    private String password;

    @ApiModelProperty("邮箱注册验证码")
    @NotNull("验证码不能为空")
    private String code;
}
