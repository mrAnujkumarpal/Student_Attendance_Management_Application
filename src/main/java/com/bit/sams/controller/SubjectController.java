package com.bit.sams.controller;

import com.bit.sams.controller.validator.Validate;
import com.bit.sams.entity.subject.Subject;
import com.bit.sams.service.BranchService;
import com.bit.sams.service.CourseService;
import com.bit.sams.service.SubjectService;
import com.bit.sams.service.UtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping
public class SubjectController {

    @Autowired
    SubjectService subjectService;

    @Autowired
    CourseService courseService;

    @Autowired
    BranchService branchService;

    @Autowired
    UtilService utilService;

    @Autowired
    Validate validate;

    @GetMapping("/newSubject")
    public ModelAndView addSubject(@RequestParam(value = "error", required = false) String error) {

        String errorMessage = null;
        if (error != null) {
            errorMessage = "Invalid Username or Password !!";
        }
        ModelAndView mv = new ModelAndView("subject/addSubject");
        mv.addObject("errorMessage", errorMessage);
        mv.addObject("success", false);
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        mv.addObject("departments", utilService.departments());
        mv.addObject("subject", new Subject());
        mv.addObject("mode", "Add New");
        return mv;
    }

    @PostMapping("newSubject")
    public ModelAndView addNewCourse(@ModelAttribute Subject subject) {
        ModelAndView mv = new ModelAndView("subject/addSubject");
        mv.addObject("mode", "Add New");
        mv.addObject("subject",subject);
        commonDataForView(mv);

        List<String> validationList = validate.validateSubject(subject);
        if (!validationList.isEmpty()) {
            mv.addObject("success", "false");
            mv.addObject("validationList", validationList);
        } else {
            subjectService.addSubject(subject);

            mv.addObject("message", "Subject successfully created.");
            mv.addObject("subject", new Subject());
            mv.addObject("success", true);

            mv.addObject("subject", new Subject());
        }
        return mv;
    }



    @GetMapping("/allSubjectList")
    public ModelAndView listOfCourses() {
        ModelAndView mv = new ModelAndView("subject/subjectList");


        mv.addObject("subjectList", subjectService.allSubject());
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        mv.addObject("departments", utilService.departments());
        mv.addObject("mode", "Add New");
        return mv;
    }


    private void commonDataForView(ModelAndView mv) {
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        mv.addObject("departments", utilService.departments());
    }
}
