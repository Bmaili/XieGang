package com.example.xiegang.service;

import com.example.xiegang.vo.ResponseResult;

public interface CourseService {
    ResponseResult getById(Long courseId);

    ResponseResult getCoursesByCourseType(String courseType);

    ResponseResult getCoursesByCourseName(String courseNmae);

    ResponseResult getAllCourses();
}
