package com.bit.sams.controller;

import com.bit.sams.controller.validator.Validate;
import com.bit.sams.entity.course.Course;
import com.bit.sams.entity.course.Branch;
import com.bit.sams.entity.students.Student;
import com.bit.sams.entity.teachers.Teacher;
import com.bit.sams.entity.util.AppUtil;
import com.bit.sams.service.CourseService;
import com.bit.sams.service.BranchService;
import com.bit.sams.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class BranchController {

    private static String MESSAGE = "";
    @Autowired
    BranchService branchService;

    @Autowired
    CourseService courseService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    Validate validate;

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
    public ModelAndView addNewCourse(@ModelAttribute Branch branch, ModelMap model) throws Exception {

        ModelAndView mv = new ModelAndView("course/branch");
        mv.addObject("courses", courseService.allCourses());
        mv.addObject("branch", branch);
        mv.addObject("mode", "Add New");

        List<String> validationList = validate.validateBranch(branch);
        if (!validationList.isEmpty()) {
            mv.addObject("success", "false");
            mv.addObject("validationList", validationList);

        } else {

            MESSAGE = (0 == branch.getId()) ? "Branch successfully created."
                    : "Branch successfully updated.";

            branchService.newBranch(branch);

            mv.addObject("branch", new Branch());
            mv.addObject("success", "true");
            mv.addObject("message", MESSAGE);
        }
        return mv;
    }

    @GetMapping("/allBranch")
    public ModelAndView listOfCourses() {
        ModelAndView mv = new ModelAndView("course/branchList");
        mv.addObject("courseList", courseService.allCourses());
        mv.addObject("branchList", branchService.allBranches());
        return mv;
    }

    @GetMapping("/viewBranch/{id}")
    public ModelAndView viewBranch(@PathVariable("id") int branchId) {

        ModelAndView mv = new ModelAndView("course/viewBranch");
        Branch branch= branchService.branchById(branchId);
        mv.addObject("viewBranch",branch);
        mv.addObject("courses", courseService.allCourses());
        Teacher teacher=teacherService.teacherById(branch.getClassCoordinatorId());
        mv.addObject("classCoordinator", (null!=teacher?teacher:new Teacher()));
        return mv;
    }

    @GetMapping("/editBranch/{id}")
    public ModelAndView editBranch(@PathVariable("id") int branchId) {

        ModelAndView mv = new ModelAndView("course/branch");
        mv.addObject("mode", "Edit");
        Branch branch = branchService.branchById(branchId);
        mv.addObject("branch", branch);
        mv.addObject("courses", courseService.allCourses());
        return mv;
    }

    @GetMapping(value = "/deleteBranch/{branchId}")
    @ResponseBody
    public Map<String, String> deleteBranch(ModelMap model, @PathVariable int branchId) {
        Map<String, String> resp = new HashMap<>();
        Branch branch = branchService.branchById(branchId);
        if (branch.isEnable()) {
            branchService.disableBranch(branch);
            resp.put("success", "true");
            resp.put("message", "Branch has been deleted successfully !!!");
        } else {
            resp.put("success", "false");
            resp.put("message", "This branch/semester is already de-activated. Please contact your administrator.");
        }
        return resp;
    }

}
