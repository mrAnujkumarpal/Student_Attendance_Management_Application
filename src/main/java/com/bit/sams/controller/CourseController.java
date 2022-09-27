package com.bit.sams.controller;

import com.bit.sams.entity.course.Course;
import com.bit.sams.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class CourseController {

    @Autowired
    CourseService courseService;

    @GetMapping("/course")
    public ModelAndView addNewCourse(@RequestParam(value = "error", required = false) String error) {

        String errorMessage = null;
        if (error != null) {
            errorMessage = "Invalid Username or Password !!";
        }
       List<Course> courseList= courseService.allCourses();
        ModelAndView mv = new ModelAndView("course/courses");
        mv.addObject("errorMessage", errorMessage);
        mv.addObject("success", false);

        mv.addObject("courseList", courseList);
        return mv;
    }

    @PostMapping(value = "/course/add")
    @ResponseBody
    public Map<String, String> addNewExpenseStatus(ModelMap model, HttpServletRequest request) {
        System.out.println("comes here common Controller ");
        Map<String, String> resp = new HashMap<>();
        String courseCode = request.getParameter("courseCode").trim();
        System.out.println("comes here courseCode " + courseCode);
        String courseName = request.getParameter("courseName").trim();
        System.out.println("comes here courseName " + courseName);

        Course course = new Course();

        course.setEnable(true);
        course.setCourseName(courseName);
        course.setCourseCode(courseCode);
        courseService.newCourse(course);

        resp.put("success", "true");
        resp.put("message", courseName + " as new role added successfully.");
        return resp;
    }

    @GetMapping("/allCourses")
    public ModelAndView listOfCourses() {
        ModelAndView mv = new ModelAndView("course/addCourse");
        List<Course> courseList = courseService.allCourses();

        mv.addObject("courseList", courseList);
        return mv;
    }

}
