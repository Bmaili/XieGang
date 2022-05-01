package com.example.xiegang.vo;

import lombok.Data;

import java.util.Date;

@Data
public class UserVO {
    private Long userId;
    private String phone;
    private String userName;
    private String sex;//(0男,2女,3未知）
    private String avatar;//头像路径
}
