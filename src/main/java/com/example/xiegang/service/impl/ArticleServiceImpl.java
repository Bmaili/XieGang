package com.example.xiegang.service.impl;

import com.example.xiegang.entity.*;
import com.example.xiegang.error.MySQLException;
import com.example.xiegang.form.GiveLikeForm;
import com.example.xiegang.utils.AliYunOss;
import com.example.xiegang.service.CommentService;
import com.example.xiegang.vo.CommentVO;
import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.form.CreatArticleForm;
import com.example.xiegang.mapper.ArticleMapper;
import com.example.xiegang.mapper.UserMapper;
import com.example.xiegang.service.ArticleService;
import com.example.xiegang.vo.ArticleInfoVO;
import com.example.xiegang.vo.ArticleListVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CommentService commentService;

    @Autowired
    private AliYunOss aliYunOss;

    @Override
    public ResponseResult getArticleDetail(Long artId, Long userId) {
        ArticleInfo info = articleMapper.getArticleInfo(artId);
        if (info == null) {
            return new ResponseResult(ResultEnum.File_NOT_EXIST);
        }
        // 查看当前用户是否收藏了该文章
        UserLike like = userMapper.isUserLikeArt(userId, artId);
        boolean isLike = like != null ? true : false;

        ArticleInfoVO vo = new ArticleInfoVO();
        BeanUtils.copyProperties(info, vo);
        vo.setPicPath(info.getPicture().split("\\|\\|")); //用 || 分割网址，但是得加转义符
        vo.setLike(isLike);

        // 填装评论
        List<CommentVO> allCommentByArtId = commentService.getCommentListByArtId(artId, 0L);
        vo.setCommentList(allCommentByArtId);
        return new ResponseResult(ResultEnum.SUCCESS_GET, vo);
    }

    @Override
    public ResponseResult getArtList(Long start, Long typeId) {

        // start是起始文章id,如果start为0,则从最高id开始；typeId为0，则不按分类过滤文章
        List<ArticleList> artList = articleMapper.getArtList(start, typeId);

        // 将ArticleList 转换成 ArticleListVO
        List<ArticleListVO> voList = artListToVo(artList);

        return new ResponseResult(ResultEnum.SUCCESS_GET, voList);
    }

    @NotNull
    public static List<ArticleListVO> artListToVo(List<ArticleList> artList) {
        // 使用 || 分割网址
        List<ArticleListVO> voList = new ArrayList<>();
        for (int i = 0; i < artList.size(); i++) {
            ArticleListVO vo = new ArticleListVO();
            BeanUtils.copyProperties(artList.get(i), vo);
            vo.setPicPath(artList.get(i).getPicture().split("\\|\\|")); //用 || 分割网址，但是得加转义符
            voList.add(vo);
        }
        return voList;
    }

    @Override
    public ResponseResult upArticle(CreatArticleForm form, Long userId) {
        ArticleInfo info = new ArticleInfo();
        BeanUtils.copyProperties(form, info);

        // 将链接列表转换为以 || 分割的长字符串
        String[] sp = form.getPicPath();
        StringBuilder sb = new StringBuilder();
        for (String s : sp) {
            sb.append(s);
            if (s != sp[sp.length - 1])
                sb.append("||");
        }
        info.setPicture(sb.toString());

        // 设置文章作者ID
        info.setAuthorId(userId);

        // 设置文章摘要为全文前50字
        String context = info.getContext();
        info.setDigest(context.substring(0, context.length() < 50 ? context.length() : 50));

        // 先更新article表的文章大致内容
        if (articleMapper.insertArticle(info) == 0) {
            return new ResponseResult(ResultEnum.DB_ERROR);
        }
        // 再插入文章的具体内容到article_info表，这里应该使用事务进行回滚的，但是爷偷懒了
        if (articleMapper.insertArticleInfo(info.getId(), context) == 0) {
            return new ResponseResult(ResultEnum.DB_ERROR);
        }

        HashMap<Object, Object> map = new HashMap<>();
        map.put("artId", info.getId());
        return new ResponseResult(ResultEnum.SUCCESS_GET, map);
    }

    @Override
    public ResponseResult getType() {
        List<ArtType> type = articleMapper.getType();
        return new ResponseResult(ResultEnum.SUCCESS_GET, type);
    }

    @Transactional
    @Override
    public ResponseResult likeArticle(GiveLikeForm form, Long userId) {
        User user = userMapper.getUserInfoById(userId);
        if (user == null) {
            return new ResponseResult(ResultEnum.USER_NOT_EXIST);
        }
        Boolean isLike = form.getIsLike();
        long artId = form.getArticleId();
        if (isLike) {
            // 将用户-文章的收藏的多对多关系添加进表，然后文章的阅读数加1
            try {
                if (articleMapper.userLikeArt(artId, userId) != 0)
                    if (articleMapper.addArtLikes(artId) != 0)
                        return new ResponseResult(ResultEnum.SUCCESS_GET);
            } catch (RuntimeException e) {
                throw new MySQLException(e.toString(), new ResponseResult(ResultEnum.DB_ERROR));
            }
            return new ResponseResult(7, "已经收藏过了");
        } else {
            try {
                if (articleMapper.userNotLikeArt(artId, userId) != 0)
                    if (articleMapper.delArtLikes(artId) != 0)
                        return new ResponseResult(ResultEnum.SUCCESS_GET);
            } catch (RuntimeException e) {
                throw new MySQLException(e.toString(), new ResponseResult(ResultEnum.DB_ERROR));
            }
            return new ResponseResult(7, "已经取消收藏了");
        }
    }

    @Override
    public ResponseResult upArcPic(MultipartFile upload) {
        String fileName = upload.getOriginalFilename();
        // 获取文件后缀
        String prefix = fileName.substring(fileName.lastIndexOf("."));
        assert fileName != null;
        File file = null;

        // Thumbnails库进行图片压缩
        try {
            file = File.createTempFile(fileName, prefix);
            Thumbnails.of(upload.getInputStream()).scale(0.5f) //图片大小（长宽）压缩比例 从0-1，1表示原图
                    .outputQuality(0.2f) //图片质量压缩比例 从0-1，越接近1质量越好
                    .toFile(file);
            log.info("图片压缩成功！");
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 调用OSS服务上传图片
        String puth = aliYunOss.ossUpPic(file);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("picPuth", puth);
        return new ResponseResult(ResultEnum.SUCCESS_GET, map);
    }
}
