package com.example.xiegang.controller;


import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.form.LoginForm;
import com.example.xiegang.service.LoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
@Api(tags = "用户登陆登出注销接口")
public class LoginController {

    @Autowired
    LoginService loginService;

    @ApiOperation("用户登录")
    @PostMapping("/login")
    public ResponseResult userLogin(@RequestBody LoginForm user) {
        return loginService.userLogin(user);
    }

    @ApiOperation("用户登出")
    @GetMapping("/logout")
    public ResponseResult userLogout() {
        return loginService.userLogout();
    }

    @ApiOperation("用户注册")
    @PostMapping("/regist")
    public ResponseResult userRegist(@RequestBody LoginForm user) {
        return loginService.userRegist(user);
    }

    @ApiOperation("获得用户注册账号验证码")
    @GetMapping("/getRegistCode")
    public ResponseResult getRegistCode(@RequestParam(value = "email") String email) {
        return loginService.getRegistCode(email);
    }
}
