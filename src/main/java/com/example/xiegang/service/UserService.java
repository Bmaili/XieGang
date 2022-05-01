package com.example.xiegang.service;

import com.example.xiegang.entity.User;
import com.example.xiegang.form.UpPwForm;
import com.example.xiegang.form.UpdateUserForm;
import com.example.xiegang.vo.ResponseResult;
import org.springframework.web.multipart.MultipartFile;

public interface UserService {
    User selectUserById(Long id);


    ResponseResult getUserInfo(Long userId);

    ResponseResult updatePw(UpPwForm form,Long userId);

    ResponseResult updateUser(UpdateUserForm form,Long userId);

    ResponseResult upAvatar(MultipartFile file,Long userId);

    ResponseResult getPwCode(Long userId);


    ResponseResult myArticle(Long userId);

    ResponseResult myLikeArt(Long userId);
}
