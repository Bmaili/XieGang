package com.example.xiegang.entity;

import lombok.Data;

@Data
public class Course {
    //以下是接口字段
    private Long courseId;
    private String courseName;
    private Double price;   //课程价格
    private String timeLength; //课程时长
    private String courseGrade;  //课程等级
    private String courseType;  //课程类型，如简历，面试，职场，技能...
    private String coverPath;  //封面图片路径
    private Integer boughtNumber;  // 已购买人数
    private Integer likeNumber;  //  点赞人数
    private String teacherName;  //  导师名字
    private String teacherLabel;  //  导师标签
}
