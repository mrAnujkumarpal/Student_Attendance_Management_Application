package com.bit.sams.service;

import com.bit.sams.entity.teachers.Teacher;

import java.util.List;

public interface TeacherService {
    
    void newTeacher(Teacher teacher);

    List<Teacher> allTeachers();

    Teacher teacherById(Integer teacherId);

    Boolean disableTeacher(Integer teacherId);

    List<Teacher> loadDepartmentTeachers(String dept);
}
