package com.example.xiegang.entity;

import lombok.Data;

@Data
public class Job {
    //以下是接口字段
    private Long jobId;
    private String jobName;
    private String jobType;  //工作类型，如 “移动互联网” ，只有一个
    private String jobAddress;
    private Long companyId;  //公司ID
    private String companyName;
    private String eduBackground;
    private String workExperence;
    private String reward;  //工资
    private String label;  //工作自定义标签 列表，如 前端/html/本科
    private String coverPath;
}
