package com.example.xiegang.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {
    private Long userId;
    private String phone;
    private String userName;
    private String sex;//(0男,2女,3未知）
    private String avatar;//头像路径
    private String userType;//用户类型（0管理员，1普通用户）
    private Date createTime; //创建时间
}
