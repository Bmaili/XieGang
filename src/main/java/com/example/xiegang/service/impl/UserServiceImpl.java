package com.example.xiegang.service.impl;

import com.example.xiegang.entity.ArticleList;
import com.example.xiegang.entity.LoginUser;
import com.example.xiegang.form.UpPwForm;
import com.example.xiegang.utils.AliYunOss;
import com.example.xiegang.entity.User;
import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.form.UpdateUserForm;
import com.example.xiegang.mapper.UserMapper;
import com.example.xiegang.service.UserService;
import com.example.xiegang.utils.EmailUtils;
import com.example.xiegang.utils.RedisCache;
import com.example.xiegang.vo.ArticleListVO;
import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.vo.UserVO;
import io.netty.util.internal.StringUtil;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private AliYunOss aliYunOss;

    @Override
    public ResponseResult getUserInfo(Long userId) {
        User u = userMapper.getUserInfoById(userId);
        if (u == null) {
            return new ResponseResult(ResultEnum.USER_NOT_EXIST);
        }
        UserVO vo = new UserVO();
        BeanUtils.copyProperties(u, vo);
        return new ResponseResult(ResultEnum.SUCCESS_GET, vo);
    }

    @Override
    public User selectUserById(Long id) {
        return userMapper.getUserInfoById(id);
    }

    @Override
    public ResponseResult updatePw(UpPwForm form, Long userId) {
        String password = form.getPassword();

        // ??????????????????
        if (StringUtil.isNullOrEmpty(password) || !(password.matches("^[0-9a-zA-Z]{6,15}$"))) {
            return new ResponseResult(HttpStatus.UNAUTHORIZED.value(), "????????????????????????");
        }

        // ???????????????
        String redisKey = "changePW:" + userId;
        String code = (String) redisCache.getCacheObject(redisKey);
        if (StringUtil.isNullOrEmpty(form.getCode()) || (!form.getCode().equals(code))) {
            return new ResponseResult(HttpStatus.UNAUTHORIZED.value(), "?????????????????????");
        }

        // ?????????????????????????????????
        String BCPassword = new BCryptPasswordEncoder().encode(password);
        if (userMapper.updatePw(userId, BCPassword) == 0) {
            return new ResponseResult(ResultEnum.DB_ERROR);
        }
        return new ResponseResult(ResultEnum.SUCCESS_GET);
    }

    @Override
    public ResponseResult updateUser(UpdateUserForm form, Long userId) {
        User user = userMapper.getUserInfoById(userId);

        boolean isChange = false;
        HashMap<Object, Object> map = new HashMap<>();
        // ????????????
        if (!StringUtil.isNullOrEmpty(form.getPhone()) && (form.getPhone().matches("^1(3[0-9]|4[579]|5[0-35-9]|7[0-9]|8[0-9])\\d{8}$"))) {
            user.setPhone(form.getPhone());
            isChange = true;
            map.put("phone", form.getPhone());
        }
        if (!StringUtil.isNullOrEmpty(form.getSex()) && (form.getSex().matches("^[0-2]{1}$"))) {
            user.setSex(form.getSex());
            isChange = true;
            map.put("sex", form.getSex());
        }
        if (!StringUtil.isNullOrEmpty(form.getUserName()) && (form.getUserName().matches("^[\\u4e00-\\u9fa5_a-zA-Z0-9]{2,12}$"))) {
            user.setUserName(form.getUserName());
            isChange = true;
            map.put("userName", form.getUserName());
        }
        if (!isChange)
            return new ResponseResult(6, "??????????????????????????????????????????");
        if (userMapper.updateUser(user) == 0)
            return new ResponseResult(ResultEnum.DB_ERROR);
        return new ResponseResult(ResultEnum.SUCCESS_GET, map);
    }

    @Override
    public ResponseResult myArticle(Long userId) {
        List<ArticleList> arts = userMapper.getUserArts(userId);
        List<ArticleListVO> vo = ArticleServiceImpl.artListToVo(arts);
        return new ResponseResult(ResultEnum.SUCCESS_GET, vo);
    }

    @Override
    public ResponseResult myLikeArt(Long userId) {
        List<ArticleList> arts = userMapper.getUserLikeArts(userId);
        List<ArticleListVO> vo = ArticleServiceImpl.artListToVo(arts);
        return new ResponseResult(ResultEnum.SUCCESS_GET, vo);
    }

    @Override
    public ResponseResult getPwCode(Long userId) {
        LoginUser user = userMapper.getLoginUserById(userId);

        // ????????????????????????
        Random random = new Random();
        String result = "";
        for (int i = 0; i < 6; i++) {
            result += random.nextInt(10);
        }

        // redis ????????????????????????????????? 180?????????
        redisCache.setCacheObject("changePW:" + userId, result, 180, TimeUnit.SECONDS);

        // ????????????
        EmailUtils.sendEmail(user.getEmail(), result);
        return new ResponseResult(200, "???????????????????????????????????????");
    }

    @Override
    public ResponseResult upAvatar(MultipartFile upload, Long userId) {
        String fileName = upload.getOriginalFilename();
        // ??????????????????
        String prefix = fileName.substring(fileName.lastIndexOf("."));
        assert fileName != null;
        File file = null;

        // Thumbnails?????????????????????
        try {
            file = File.createTempFile(fileName, prefix);
            Thumbnails.of(upload.getInputStream()).scale(0.4f) //???????????????????????????????????? ???0-1???1????????????
                    .outputQuality(0.5f) //???????????????????????? ???0-1????????????1????????????
                    .toFile(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // ??????OSS??????????????????
        String puth = aliYunOss.ossUpPic(file);

        // ???????????????
        if (userMapper.updateAvatar(puth, userId) == 0) {
            return new ResponseResult(ResultEnum.DB_ERROR);
        }
        HashMap<Object, Object> map = new HashMap<>();
        map.put("avatar", puth);
        return new ResponseResult(ResultEnum.SUCCESS_GET, map);
    }
}
