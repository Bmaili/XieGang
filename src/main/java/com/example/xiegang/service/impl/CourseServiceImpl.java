package com.example.xiegang.service.impl;

import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.entity.Course;
import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.mapper.CourseMapper;
import com.example.xiegang.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseMapper courseMapper;

    @Override
    public ResponseResult getById(Long courseId) {
        Course course = courseMapper.getById(courseId);
        return new ResponseResult(ResultEnum.SUCCESS_GET,course);
    }

    @Override
    public ResponseResult getCoursesByCourseType(String courseType) {
        List<Course> courses = courseMapper.getCoursesByCourseType(courseType);
        return new ResponseResult(ResultEnum.SUCCESS_GET,courses);
    }

    @Override
    public ResponseResult getCoursesByCourseName(String courseNmae) {
        List<Course> courses = courseMapper.getCoursesByCourseName(courseNmae);
        return new ResponseResult(ResultEnum.SUCCESS_GET,courses);
    }

    @Override
    public ResponseResult getAllCourses() {
        List<Course> courses =  courseMapper.getAllCourses();
        return new ResponseResult(ResultEnum.SUCCESS_GET,courses);
    }
}
