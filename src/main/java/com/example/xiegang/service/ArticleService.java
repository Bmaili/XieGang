package com.example.xiegang.service;

import com.example.xiegang.form.GiveLikeForm;
import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.form.CreatArticleForm;
import org.springframework.web.multipart.MultipartFile;

// import com.example.xiegang.vo.ArticleInfoVO;
public interface ArticleService {

    // ArticleListVO selectArticleLimit(int pageNum, int pageSize);

    // SELECT a.*, art_type.`name`,art_info.context
    // FROM `article` a , art_type ,art_info
    // where a.id = 38 and a.type = art_type.id and art_info.article_id = a.id;
    ResponseResult getArticleDetail(Long artId, Long userId);

    ResponseResult getArtList(Long start, Long typeId);

    ResponseResult upArticle(CreatArticleForm form,Long userId);

    ResponseResult upArcPic(MultipartFile upload);

    ResponseResult likeArticle(GiveLikeForm form,Long userId);

    ResponseResult getType();

}
