package com.bit.sams.controller;

import com.bit.sams.entity.course.Course;
import com.bit.sams.entity.course.Branch;
import com.bit.sams.service.CourseService;
import com.bit.sams.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping
public class BranchController {

    @Autowired
    BranchService branchService;

    @Autowired
    CourseService courseService;

    @GetMapping("/addBranch")
    public ModelAndView addSubCourse(@RequestParam(value = "error", required = false) String error) {

        String errorMessage = null;
        if (error != null) {
            errorMessage = "Invalid Username or Password !!";
        }

        ModelAndView mv = new ModelAndView("course/branch");
        mv.addObject("errorMessage", errorMessage);
        mv.addObject("success", false);
        mv.addObject("mode", "Add New");
        mv.addObject("branch", new Branch());
        mv.addObject("courses", courseService.allCourses());
        System.out.println("moving to sub-course");
        return mv;
    }

    @PostMapping("/addBranch")
    public ModelAndView addNewCourse(@ModelAttribute Branch branch, ModelMap model) {

        System.out.println("Description ::: " + branch.getDescription());
        branchService.newBranch(branch);

        ModelAndView mv = new ModelAndView("course/branch");
        mv.addObject("mode", "Add New");
        mv.addObject("success", "true");
        mv.addObject("message", "Branch successfully created.");
        mv.addObject("courses", courseService.allCourses());
        mv.addObject("branch", new Branch());
        mv.addObject("success", true);
        return mv;
    }

    @GetMapping("/allBranch")
    public ModelAndView listOfCourses() {

        ModelAndView mv = new ModelAndView("course/branchList");

        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        return mv;
    }


}
