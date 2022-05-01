package com.example.xiegang.mapper;

import com.example.xiegang.entity.Job;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface JobMapper {

    @Select("select * from tb_all_job where job_id=#{job_id}")
    Job getById(Long job_id);

    @Select("select * from tb_all_job where job_type like CONCAT('%',#{job_type},'%')")
    List<Job> getJobsByJobType(String job_type);

    @Select("select * from tb_all_job where job_name like CONCAT('%',#{job_name},'%')")
    List<Job> getJobsByJobName(String job_name);

    @Select("select * from tb_all_job")
    List<Job> getAllJobs();
}
