package com.example.xiegang.form;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.jetbrains.annotations.NotNull;

@Data
public class UpPwForm {

    @ApiModelProperty("新设置的密码")
    @NotNull
    private String password;

    @ApiModelProperty("邮箱验证码")
    @NotNull
    private String code;
}
