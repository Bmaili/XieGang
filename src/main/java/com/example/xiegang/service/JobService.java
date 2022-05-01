package com.example.xiegang.service;


import com.example.xiegang.vo.ResponseResult;

public interface JobService {
    ResponseResult getById(Long jobId);

    ResponseResult getJobsByJobType(String jobType);

    ResponseResult getJobsByJobName(String jobNmae);

    ResponseResult getAllJobs();
}
