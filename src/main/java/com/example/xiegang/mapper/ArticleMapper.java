package com.example.xiegang.mapper;

import com.example.xiegang.entity.ArtType;
import com.example.xiegang.entity.ArticleInfo;
import com.example.xiegang.entity.ArticleList;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ArticleMapper {
    @Select("select * from article limit 100")
    List<ArticleList> getArticleList();

    @Select("SELECT a.*, art_type.*,art_info.context " +
            "FROM `article` a , art_type ,art_info " +
            "WHERE a.id = #{artId} AND a.type_id = art_type.type_id AND art_info.article_id = a.id")
    ArticleInfo getArticleInfo(Long artId);


    // SELECT a.*, art_type.*  FROM  `article` a, art_type WHERE a.id = id
    // AND a.id <= #{artId}  AND a.type_id = art_type.type_id ORDER AND a.type_id = #{typeId} BY id DESC LIMIT 5
    @Select("<script> SELECT a.*, art_type.* , user_info.* FROM `article` a, art_type ,user_info" +
            " <where> " +
            " a.id = id AND a.type_id = art_type.type_id AND a.author_id = user_info.user_id" +
            " <if test='artId != 0'> AND a.id &lt;= #{artId}</if> " +
            " <if test='typeId != 0'> AND a.type_id = #{typeId}</if> " +
            " </where> ORDER BY id DESC LIMIT 5 </script> ")
    List<ArticleList> getArtList(Long artId, Long typeId);

    @Insert("insert into article (digest, author_id,  picture,type_id,create_time )" +
            "values (#{digest},#{authorId},#{picture},#{typeId},now())")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    Integer insertArticle(ArticleInfo articleInfo);

    @Insert("INSERT INTO art_info VALUES(#{artId},#{context})")
    Integer insertArticleInfo(Long artId, String context);
    // @Insert()
    // int insertArticleInfo()

    @Update("UPDATE article SET comments=comments+1 WHERE id = #{artId}")
    Integer addArtComments(Long artId);

    @Insert("INSERT INTO art_like VALUES( #{userId},#{artId})")
    Integer userLikeArt(Long artId, Long userId);

    @Delete("DELETE FROM art_like WHERE user_id=#{userId} AND art_id = #{artId}")
    Integer userNotLikeArt(Long artId, Long userId);

    @Update("UPDATE article SET likes=likes+1 WHERE id = #{artId}")
    Integer addArtLikes(Long artId);

    @Update("UPDATE article SET likes=likes-1 WHERE id = #{artId}")
    Integer delArtLikes(Long artId);

    @Select("SELECT * FROM art_type;")
    List<ArtType> getType();
}


