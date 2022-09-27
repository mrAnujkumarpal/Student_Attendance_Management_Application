package com.bit.sams.controller;


import com.bit.sams.entity.students.Student;
import com.bit.sams.entity.teachers.Teacher;
import com.bit.sams.service.TeacherService;
import com.bit.sams.service.UtilService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping
public class TeacherController {

    @Autowired
    TeacherService teacherService;

    @Autowired
    UtilService utilService;


    @GetMapping("/newTeacher")
    public ModelAndView addTeacher(@RequestParam(value = "error", required = false) String error) {

        String errorMessage = null;
        if (error != null) {
            errorMessage = "Invalid Username or Password !!";
        }
        ModelAndView mv = new ModelAndView("teacher/addTeacher");
        mv.addObject("mode", "Add New");
        mv.addObject("errorMessage", errorMessage);
        mv.addObject("teacher", new Teacher());
        mv.addObject("success", false);
        commonDataForModelAndView(mv);
        return mv;
    }

    @PostMapping("newTeacher")
    public ModelAndView addNewTeacher(@ModelAttribute Teacher teacher) {

        teacherService.newTeacher(teacher);

        ModelAndView mv = new ModelAndView("teacher/addTeacher");
        mv.addObject("mode", "Add New");
        mv.addObject("message", "Teacher successfully created.");
        mv.addObject("teacher", new Teacher());
        mv.addObject("success", true);
        commonDataForModelAndView(mv);
        return mv;
    }

    @GetMapping("/teachers")
    public ModelAndView listOfTeachers() {
        ModelAndView mv = new ModelAndView("teacher/teacherList");
        List<Teacher> teacherList = teacherService.allTeachers();
        commonDataForModelAndView(mv);

        mv.addObject("teacherList", teacherList);
        mv.addObject("mode", "Add New");
        return mv;
    }


    @GetMapping("/viewTeacher/{id}")
    public ModelAndView viewTeacher(@PathVariable("id") int teacherId) {

        ModelAndView mv = new ModelAndView("student/viewStudent");
        mv.addObject("teacher", teacherService.teacherById(teacherId));
        commonDataForModelAndView(mv);
        return mv;
    }

    @GetMapping("/editTeacher/{id}")
    public ModelAndView editTeacher(@PathVariable("id") int teacherId) {

        ModelAndView mv = new ModelAndView("teacher/addTeacher");
        mv.addObject("teacher", teacherService.teacherById(teacherId));
        mv.addObject("mode", "Edit");
        commonDataForModelAndView(mv);
        return mv;
    }

    @GetMapping("/deleteTeacher/{id}")
    public ModelAndView deleteTeacher(@PathVariable("id") int teacherId) {

        ModelAndView mv = new ModelAndView("student/viewStudent");
        mv.addObject("teacher", teacherService.teacherById(teacherId));
        commonDataForModelAndView(mv);
        return mv;
    }

    private void commonDataForModelAndView(ModelAndView mv) {
        mv.addObject("qualifications", utilService.qualification());
        mv.addObject("departments", utilService.departments());
        mv.addObject("roles", utilService.teacherRole());
    }
}
