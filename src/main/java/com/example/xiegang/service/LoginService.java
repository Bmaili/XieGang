package com.example.xiegang.service;


import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.form.LoginForm;


public interface LoginService {

    ResponseResult userLogin(LoginForm user);

    ResponseResult userLogout();

    ResponseResult userRegist(LoginForm user);

    ResponseResult getRegistCode(String email);
}
