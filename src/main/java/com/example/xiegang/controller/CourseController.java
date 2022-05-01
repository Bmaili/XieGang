package com.example.xiegang.controller;

import com.example.xiegang.vo.ResponseResult;
import com.example.xiegang.entity.Course;
import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.service.CourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/course")
@Api(tags = "课程相关接口")
public class CourseController {
    @Autowired
    CourseService courseService;

    @ApiOperation("获取课程详情byId")
    @GetMapping("/getInfo")
    public ResponseResult getCourseById(@RequestParam("id") Long courseId) {
        return courseService.getById(courseId);
    }

    @ApiOperation("通过名字或分类查找课程")
    @GetMapping("/search")
    public ResponseResult getCoursesByNameOrType(@RequestParam(value = "name", required = false) String courseName,
                                                 @RequestParam(value = "type", required = false) String courseType
    ) {
        List<Course> courses = null;
        if (StringUtils.hasText(courseType)) {
            return courseService.getCoursesByCourseType(courseType);
        }
        if (StringUtils.hasText(courseName)) {
            return courseService.getCoursesByCourseName(courseName);
        }
        return new ResponseResult(ResultEnum.BAD_REQUEST);
    }

    @ApiOperation("个人推荐课程")
    @GetMapping("/recommend")
    public ResponseResult getRecommendCourses() {
        return courseService.getAllCourses();
    }

}
