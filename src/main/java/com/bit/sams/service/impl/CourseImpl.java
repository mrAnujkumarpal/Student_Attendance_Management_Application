package com.bit.sams.service.impl;

import com.bit.sams.entity.course.Course;
import com.bit.sams.repository.CourserRepository;
import com.bit.sams.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseImpl implements CourseService {

    @Autowired
    CourserRepository courserRepository;


    @Override
    public void newCourse(Course course) {
        courserRepository.save(course);
    }

    @Override
    public List<Course> allCourses() {
        return courserRepository.findAll();
    }

    @Override
    public List<Course> allActiveCourses() {
        return courserRepository.findAllByEnable(true);
    }

    @Override
    public Course courseById(Integer courseId) {
        return courserRepository.getById(courseId);
    }

    @Override
    public void disableCourse(Course course) {

        course.setEnable(false);
        courserRepository.save(course);
    }

}
