package com.bit.sams.service;

import com.bit.sams.entity.course.Course;

import java.util.List;

public interface CourseService {

    void newCourse(Course course);

    List<Course>  allCourses();

    Course courseById(Integer courseId);
}
