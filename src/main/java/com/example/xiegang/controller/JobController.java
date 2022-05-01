package com.example.xiegang.controller;

import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.service.JobService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/job")
@Api(tags = "工作相关接口")
public class JobController {

    @Autowired
    JobService jobService;

    @ApiOperation("获取工作详情byId")
    @GetMapping("/getInfo")
    public ResponseResult getJobById(@RequestParam("jobId") Long jobId) {
        return jobService.getById(jobId);

    }

    @ApiOperation("通过名字或分类查找工作")
    @GetMapping("/search")
    public ResponseResult getJobsByNameOrType(@RequestParam(value = "jobName", required = false) String jobName,
                                              @RequestParam(value = "jobType", required = false) String jobType
    ) {
        if (StringUtils.hasText(jobType)) {
            return jobService.getJobsByJobType(jobType);
        }
        if (StringUtils.hasText(jobName)) {
            return jobService.getJobsByJobName(jobName);
        }
        return new ResponseResult(ResultEnum.BAD_REQUEST);
    }

    @ApiOperation("个人推荐工作")
    @GetMapping("/recommend")
    public ResponseResult getRecommendJobs() {
        return jobService.getAllJobs();
    }
}
