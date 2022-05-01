package com.example.xiegang.security;

import com.example.xiegang.entity.LoginUser;
import com.example.xiegang.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class JwtUserDetailServiceImpl implements UserDetailsService {
    @Autowired
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // 通过电子邮箱登陆用户
        LoginUser user = userMapper.getLoginUser(email);
        if (Objects.isNull(user)) {
            throw new RuntimeException("此用户不存在！");
        }
        // return new JwtUser(user.getEmail(),user.getPassword(),"");
        return new JwtUser(user.getEmail(), user.getPassword());
    }
}
