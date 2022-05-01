package com.example.xiegang.service.impl;

import com.example.xiegang.entity.Comment;
import com.example.xiegang.entity.User;
import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.form.CreatCommentForm;
import com.example.xiegang.mapper.ArticleMapper;
import com.example.xiegang.mapper.CommentMapper;
import com.example.xiegang.mapper.UserMapper;
import com.example.xiegang.service.CommentService;
import com.example.xiegang.service.UserService;
import com.example.xiegang.vo.CommentVO;
import com.example.xiegang.vo.ReplyVO;
import com.example.xiegang.vo.ResponseResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public ResponseResult creatComment(CreatCommentForm form, Long userId) {
        Comment comment = new Comment();
        BeanUtils.copyProperties(form, comment);

        User user = userMapper.getUserInfoById(userId);


        if (user == null) {
            return new ResponseResult(405, "未查询到该用户");
        }
        comment.setUserId(userId);
        comment.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));


        if (commentMapper.addComment(comment) != 0) {
            // 评论数目加1
            if (articleMapper.addArtComments(comment.getArticleId()) != 0) {

                // 将评论数据返回
                ReplyVO vo = new ReplyVO();
                BeanUtils.copyProperties(comment, vo);
                vo.setAvatar(user.getAvatar());
                vo.setUserName(user.getUserName());

                if (form.getReplyUserId() != 0L) {
                    User replyUser = userMapper.getUserInfoById(form.getReplyUserId());
                    if (replyUser == null) {
                        return new ResponseResult(405, "未查询到该用户");
                    }
                    vo.setReplyUserId(replyUser.getUserId());
                    vo.setReplyAvatar(replyUser.getAvatar());
                    vo.setReplyUserName(replyUser.getUserName());
                }

                return new ResponseResult(ResultEnum.SUCCESS_GET, vo);
            }
        }
        return new ResponseResult(ResultEnum.DB_ERROR);
    }


    @Override
    public List<CommentVO> getCommentListByArtId(Long artId, Long startNum) {
        List<CommentVO> result = new ArrayList<>();
        // 查找文章下前5条的父级评论
        List<Comment> rootRommentList = commentMapper.getRootCommentList(artId, startNum);
        if (rootRommentList == null) {
            return null;
        }
        for (Comment rootComment : rootRommentList) {
            // 设置父级评论的相关信息
            CommentVO commentVO = new CommentVO();
            BeanUtils.copyProperties(rootComment, commentVO);
            User rootUser = userMapper.getUserInfoById(commentVO.getUserId());
            commentVO.setAvatar(rootUser.getAvatar());
            commentVO.setUserName(rootUser.getUserName());

            //查找所有父级评论下的子评论
            List<Comment> replys = commentMapper.getReplyList(rootComment.getCommentId());
            List<ReplyVO> replysVO = new ArrayList<>();
            for (Comment comment : replys) {
                ReplyVO vo = new ReplyVO();
                BeanUtils.copyProperties(comment, vo);
                User user = userMapper.getUserInfoById(vo.getUserId());
                User replyUser = userMapper.getUserInfoById(vo.getReplyUserId());
                vo.setAvatar(user.getAvatar());
                vo.setUserName(user.getUserName());
                if (replyUser != null) {
                    vo.setReplyUserId(replyUser.getUserId());
                    vo.setReplyAvatar(replyUser.getAvatar());
                    vo.setReplyUserName(replyUser.getUserName());
                }
                replysVO.add(vo);
            }
            // 将子评论列表设置进父评论
            commentVO.setReplyVO(replysVO);

            result.add(commentVO);
        }
        return result;
    }

}
