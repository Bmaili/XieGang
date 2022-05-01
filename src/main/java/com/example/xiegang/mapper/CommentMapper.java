package com.example.xiegang.mapper;

import com.example.xiegang.entity.Comment;
import com.example.xiegang.vo.ReplyVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommentMapper {

    @Insert("INSERT INTO `comment`(user_id,article_id,reply_user_id,pid,context,create_time) " +
            "VALUES(#{userId},#{articleId},#{replyUserId},#{pid},#{context},now())")
    @Options(useGeneratedKeys = true, keyProperty = "commentId", keyColumn = "comment_id")
    int addComment(Comment comment);

    @Select("SELECT * FROM `comment` WHERE article_id = #{artId} AND pid = 0 LIMIT #{startNum},5")
    List<Comment> getRootCommentList(Long artId, Long startNum);

    @Select("SELECT * FROM `comment` WHERE pid = #{pid}")
    List<Comment> getReplyList(Long pid);
}
