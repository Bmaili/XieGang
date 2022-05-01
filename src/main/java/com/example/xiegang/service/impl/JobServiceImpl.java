package com.example.xiegang.service.impl;

import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.entity.Job;
import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.mapper.JobMapper;
import com.example.xiegang.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {
    @Autowired
    JobMapper jobMapper;

    @Override
    public ResponseResult getById(Long jobId) {
        Job job = jobMapper.getById(jobId);
        return new ResponseResult(ResultEnum.SUCCESS_GET, job);
    }

    @Override
    public ResponseResult getJobsByJobType(String jobType) {
        List<Job> jobs = jobMapper.getJobsByJobType(jobType);
        return new ResponseResult(ResultEnum.SUCCESS_GET, jobs);
    }

    @Override
    public ResponseResult getJobsByJobName(String jobNmae) {
        List<Job> jobs = jobMapper.getJobsByJobName(jobNmae);
        return new ResponseResult(ResultEnum.SUCCESS_GET, jobs);
    }

    @Override
    public ResponseResult getAllJobs() {
        List<Job> jobs = jobMapper.getAllJobs();
        return new ResponseResult(ResultEnum.SUCCESS_GET, jobs);
    }
}
