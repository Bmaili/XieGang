package com.example.xiegang.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.xiegang.entity.ArticleList;
import com.example.xiegang.entity.LoginUser;
import com.example.xiegang.entity.User;
import com.example.xiegang.entity.UserLike;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("select * from user_login where email=#{email}")
    LoginUser getLoginUser(String Email);

    @Select("select * from user_login where user_id=#{userId}")
    LoginUser getLoginUserById(Long userId);

    @Select("select * from user_info where user_id=#{userId}")
    User getUserInfoById(Long userId);

    @Insert("insert into user_login (user_id, email, password)values (#{userId},#{email},#{password})")
    int addLoginUser(Long userId, String email, String password);

    @Insert("INSERT INTO user_info (create_time) VALUES(now())")
    @Options(useGeneratedKeys = true, keyProperty = "userId", keyColumn = "user_id")
    int addUser(User user);

    @Select("select * from art_like where user_id=#{userId} and art_id=#{artId}")
    UserLike isUserLikeArt(Long userId, Long artId);

    @Update("update `user_login` set password= #{password} where user_id = #{userId}")
    int updatePw(Long userId, String password);

    @Update(" update `user_info`set phone=#{phone} ,user_name=#{userName},sex=#{sex} where user_id = #{userId}")
    int updateUser(User user);

    @Update("update `user_info` set avatar = #{path} where user_id = #{userId}")
    int updateAvatar(String path,Long userId);

    @Select("SELECT * FROM `article` WHERE author_id =#{userId}")
    List<ArticleList> getUserArts(Long userId);

    @Select("SELECT a.* FROM `article` a , art_like lk WHERE lk.user_id = #{userId} AND lk.art_id = a.id")
    List<ArticleList> getUserLikeArts(Long userId);
}
