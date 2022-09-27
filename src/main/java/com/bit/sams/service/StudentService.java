package com.bit.sams.service;

import com.bit.sams.entity.students.Student;

import java.util.List;

public interface StudentService {

    void addStudent(Student student);

    List<Student> allStudent();

    Student getStudentById(Integer studentId);

    Boolean disableStudent(Integer studentId);

    Student promoteStudent(Integer studentId,Integer courseId,Integer subCourseId);
}
