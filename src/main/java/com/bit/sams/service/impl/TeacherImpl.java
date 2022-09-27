package com.bit.sams.service.impl;

import com.bit.sams.entity.students.Student;
import com.bit.sams.entity.teachers.Teacher;
import com.bit.sams.repository.TeacherRepository;
import com.bit.sams.service.TeacherService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherImpl implements TeacherService {

    @Autowired
    TeacherRepository teacherRepository;

    private void capitalize(Teacher teacher) {
        teacher.setFirstName(StringUtils.capitalize(teacher.getFirstName()));
        teacher.setLastName(StringUtils.capitalize(teacher.getLastName()));

    }

    @Override
    public void newTeacher(Teacher teacher) {
        capitalize(teacher);
        teacherRepository.save(teacher);
    }

    @Override
    public List<Teacher> allTeachers() {
        return teacherRepository.findAll();
    }

    @Override
    public Teacher teacherById(Integer teacherId) {
        return teacherRepository.getById(teacherId);
    }

    @Override
    public Boolean disableTeacher(Integer teacherId) {
        Teacher teacher = teacherById(teacherId);
        teacher.setEnable(false);
        Teacher disableTeacher = teacherRepository.save(teacher);
        return disableTeacher.isEnable();
    }

    @Override
    public List<Teacher> loadDepartmentTeachers(String dept) {
        return teacherRepository.findByDepartmentAndEnable(dept,true);
    }
}
