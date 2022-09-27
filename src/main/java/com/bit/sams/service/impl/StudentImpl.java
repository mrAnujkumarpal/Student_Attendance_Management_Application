package com.bit.sams.service.impl;

import com.bit.sams.entity.students.Student;
import com.bit.sams.repository.StudentRepository;
import com.bit.sams.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

@Service
public class StudentImpl implements StudentService {

    @Autowired
    StudentRepository studentRepository;


    //private BCryptPasswordEncoder passwordEncoder;

    @Override
    public void addStudent(Student student) {

        generatePassword(student);
        studentRepository.save(student);
    }


    @Override
    public List<Student> allStudent() {
        return studentRepository.findAll();
    }

    @Override
    public Student getStudentById(Integer studentId) {
        return studentRepository.getById(studentId);
    }

    @Override
    public Boolean disableStudent(Integer studentId) {
        Student student = getStudentById(studentId);
        student.setEnable(false);
        Student disableStudent = studentRepository.save(student);
        return disableStudent.isEnable();
    }

    @Override
    public Student promoteStudent(Integer studentId, Integer courseId, Integer subCourseId) {
        Student student = getStudentById(studentId);
        student.setCourseId(courseId);
        student.setSubCourseId(subCourseId);

        return studentRepository.save(student);
    }

    private void generatePassword(Student student) {
        student.setFirstName(StringUtils.capitalize(student.getFirstName()));
        student.setLastName(StringUtils.capitalize(student.getLastName()));
        student.setPassword(student.getFirstName() + "@" + student.getLastName() + "123");
    }
}
