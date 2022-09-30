package com.bit.sams.controller;

import com.bit.sams.controller.validator.Validate;
import com.bit.sams.entity.students.Student;
import com.bit.sams.service.BranchService;
import com.bit.sams.service.CourseService;
import com.bit.sams.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;


@Controller
@RequestMapping
public class StudentController {

    @Autowired
    StudentService studentService;

    @Autowired
    CourseService courseService;

    @Autowired
    BranchService branchService;

    @Autowired
    Validate validate;

    @GetMapping("/addStudent")
    public ModelAndView addNewStudent(@RequestParam(value = "error", required = false) String error) {

        String errorMessage = null;
        if (error != null) {
            errorMessage = "Invalid Username or Password !!";
        }
        System.out.println("get mapping to load the blank form");
        ModelAndView mv = new ModelAndView("student/addStudent");

        mv.addObject("student", new Student());
        mv.addObject("mode", "Add New");
        mv.addObject("courseList", courseService.allCourses());
       //mv.addObject("branchList", branchService.allBranches());
        return mv;
    }

    @PostMapping("addStudent")
    public ModelAndView addNewStudent(@ModelAttribute Student student) {
        ModelAndView mv = new ModelAndView("student/addStudent");
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        mv.addObject("mode", "Add New");
        mv.addObject("student", student);

        List<String> validationList = validate.validateStudent(student);
        if (!validationList.isEmpty()) {
            mv.addObject("success", "false");
            mv.addObject("validationList", validationList);
        } else {

            studentService.addStudent(student);


            System.out.println("Post mapping to create the student form");


            mv.addObject("message", "Student successfully added.");
            mv.addObject("student", new Student());
            mv.addObject("success", true);

        }
        return mv;
    }




    @GetMapping("/students")
    public ModelAndView listOfStudent() {
        ModelAndView mv = new ModelAndView("student/studentList");
        mv.addObject("studentList", studentService.allStudent());
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        mv.addObject("mode", "Add New");
        return mv;
    }

    @GetMapping("/viewStudent/{id}")
    public ModelAndView viewStudentById(@PathVariable("id") int studentId) {

        ModelAndView mv = new ModelAndView("student/viewStudent");
        mv.addObject("viewStudent", studentService.getStudentById(studentId));
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        return mv;
    }

    @GetMapping("/editStudent/{id}")
    public ModelAndView editStudent(@PathVariable("id") int studentId) {

        ModelAndView mv = new ModelAndView("student/addStudent");
        mv.addObject("mode", "Edit");
        Student student = studentService.getStudentById(studentId);
        mv.addObject("student", student);
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.branchListByCourseId(student.getCourseId()));
        return mv;
    }

    @GetMapping("/deleteStudent/{id}")
    public ModelAndView deleteStudent(@PathVariable("id") int studentId) {

        ModelAndView mv = new ModelAndView("student/viewStudent");
        mv.addObject("viewStudent", studentService.getStudentById(studentId));
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        return mv;
    }
}
