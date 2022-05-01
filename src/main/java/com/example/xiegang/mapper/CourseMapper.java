package com.example.xiegang.mapper;

import com.example.xiegang.entity.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CourseMapper {
    @Select("select * from tb_all_course where course_id=#{course_id}")
    Course getById(Long course_id);

    @Select("select * from tb_all_course where course_type like CONCAT('%',#{course_type},'%')")
    List<Course> getCoursesByCourseType(String course_type);

    @Select("select * from tb_all_course where course_name like CONCAT('%',#{course_name},'%')")
    List<Course> getCoursesByCourseName(String course_name);

    @Select("select * from tb_all_course")
    List<Course> getAllCourses();
}
