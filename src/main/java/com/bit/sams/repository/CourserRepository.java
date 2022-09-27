package com.bit.sams.repository;

import com.bit.sams.entity.course.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourserRepository extends JpaRepository<Course,Integer> {

    Course findByCourseCode(String courseCode);
}
