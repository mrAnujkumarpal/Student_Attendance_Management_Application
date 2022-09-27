package com.bit.sams.controller;

import com.bit.sams.service.BranchService;
import com.bit.sams.service.TeacherService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Locale;

@Controller
@RequestMapping
public class DefaultController {

    @Autowired
    BranchService branchService;

    @Autowired
    TeacherService teacherService;


    @GetMapping(value = {"/",""})
    public String defaultPage() {
        return "redirect:/login";
    }

    @GetMapping(value = "/login")
    public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error) {
        System.out.println("comes here ");
        String errorMessge = null;
        if (error != null) {
            errorMessge = "Invalid Username or Password !!";
        }
        ModelAndView mv = new ModelAndView("common/login");
        mv.addObject("errorMessge", errorMessge);
        mv.addObject("success", false);
        return mv;
    }
    @GetMapping(value = "/wrongAccess")
    public ModelAndView wrongAccess() {
        System.out.println("Inside wrong access. ");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("errors/505");
       // modelAndView.addObject("employeeRoleId", loggedInEmployee().getEmpRole().getId());
        return modelAndView;
    }

    @GetMapping(value = "/access-denied")
    public ModelAndView accessDenied() {
        System.out.println("Inside accsss denied method. ");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("errors/500");
       // modelAndView.addObject("employeeRoleId", loggedInEmployee().getEmpRole().getId());
        return modelAndView;
    }

    @GetMapping(value = "/404")
    public ModelAndView error404() {
        ModelAndView mv = new ModelAndView("errors/404");
        //mv.addObject("employeeRoleId", loggedInEmployee().getEmpRole().getId());
        return mv;
    }

    @GetMapping(value = "/500")
    public ModelAndView error500() {
        ModelAndView mv = new ModelAndView("errors/500");
        //mv.addObject("employeeRoleId", loggedInEmployee().getEmpRole().getId());
        return mv;
    }
    @ResponseBody
    @RequestMapping(value = "findBranchesByCourseId/{id}", method = RequestMethod.GET)
    public String loadStatesByCountry(@PathVariable("id") int courseId) {
        Gson gson = new Gson();
        return gson.toJson(branchService.branchListByCourseId(courseId));
    }

    @ResponseBody
    @RequestMapping(value = "loadTeachersDeptWise/{dept}", method = RequestMethod.GET)
    public String loadTeachersDeptWise(@PathVariable("dept") String department) {
        
        System.out.println("Here to load teachers based on departmennt " + department);
        Gson gson = new Gson();
        return gson.toJson(teacherService.loadDepartmentTeachers(department.toUpperCase()));
    }
}
