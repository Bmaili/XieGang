package com.example.xiegang.controller;

import com.example.xiegang.form.UpPwForm;
import com.example.xiegang.form.UpdateUserForm;
import com.example.xiegang.security.SecurityConfig;
import com.example.xiegang.service.UserService;
import com.example.xiegang.vo.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
@Api(tags = "用户相关服务接口")
public class UserCtroller {

    @Autowired
    private UserService userService;

    @Autowired
    private HttpServletRequest httpServletRequest;

    @ApiOperation("用户修改密码")
    @PostMapping(name = "用户修改密码", value = "/updatePw")
    public ResponseResult updatePw(@RequestBody UpPwForm form) {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return userService.updatePw(form, userId);
    }

    @ApiOperation("用户修改密码前获取验证码")
    @GetMapping(name = "用户修改密码", value = "/updatePw")
    public ResponseResult getPwCode() {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return userService.getPwCode(userId);
    }

    @ApiOperation("用户查看个人信息")
    @GetMapping(name = "用户查看个人信息", value = "/getInfo")
    public ResponseResult getInfo() {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return userService.getUserInfo(userId);
    }

    @ApiOperation("修改个人信息")
    @PostMapping(name = "修改个人信息", value = "/upData")
    public ResponseResult upData(@RequestBody UpdateUserForm form) {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return userService.updateUser(form, userId);
    }

    @ApiOperation("用户发布的文章列表")
    @GetMapping(value = "/myArticle")
    public ResponseResult myArticle() {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return userService.myArticle(userId);
    }

    @ApiOperation("用户收藏的文章列表")
    @GetMapping(name = "用户收藏的文章列表", value = "/myLikeArt")
    public ResponseResult myLikeArt() {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return userService.myLikeArt(userId);
    }

    @ApiOperation("上传头像图片")
    @PostMapping(name = "上传头像图片", value = "/upAvatar")
    public ResponseResult upAvatar(@RequestParam(value = "file", required = true) MultipartFile file) {
        Long userId = Long.parseLong((String) httpServletRequest.getAttribute("userId"));
        return userService.upAvatar(file, userId);
    }

}
