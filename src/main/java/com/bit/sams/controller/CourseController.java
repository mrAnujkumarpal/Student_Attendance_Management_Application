package com.bit.sams.controller;

import com.bit.sams.entity.course.Course;
import com.bit.sams.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import static com.bit.sams.entity.util.AppUtil.*;
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

@GetMapping("/allCourses")
public ModelAndView listOfCourses() {
    ModelAndView mv = new ModelAndView("course/addCourse");
    List<Course> courseList = courseService.allCourses();
    mv.addObject("courseList", courseList);
    return mv;
}

    @GetMapping(value = "/editCourse/{courseId}")
    @ResponseBody
    public Map<String, Object> editCourse(ModelMap model, @PathVariable int courseId) {

        Map<String, Object> resp = new HashMap<>();
        Course course = courseService.courseById(courseId);
        resp.put("success", "true");
        resp.put("id", course.getId());
        resp.put("courseName", course.getCourseName());
        resp.put("courseCode", course.getCourseCode());
        return resp;
    }

    @PostMapping(value = "/clickEventOnCourseModel/add")
    @ResponseBody
    public Map<String, String> locationEventAdd(ModelMap model, HttpServletRequest request) {
        System.out.println("comes here common Controller ");
        Map<String, String> resp = new HashMap<>();

        String courseCode = request.getParameter("courseCode").trim();
        String courseName = request.getParameter("courseName").trim();

        Course course = new Course();
        course.setCourseCode(courseCode);
        course.setCourseName(courseName);
        course.setCreatedBy(00001);
        courseService.newCourse(course);
        resp.put("success", "true");
        resp.put("message", " ' "+courseName+" ' " +" as new course successfully added.");
        return resp;
    }

    @PostMapping(value = "/clickEventOnCourseModel/update")
    @ResponseBody
    public Map<String, String> locationEventUpdate(ModelMap model, HttpServletRequest request) {

        Map<String, String> resp = new HashMap<>();
        String courseId = request.getParameter("courseId").trim();
        String courseCode = request.getParameter("courseCode").trim();
        String courseName = request.getParameter("courseName").trim();

        Course course = courseService.courseById(Integer.parseInt(courseId));
        if(course.isEnable()){
            course.setCourseCode(courseCode);
            course.setCourseName(courseName);
            course.setModifiedBy(9999);
            course.setModifiedOn(currentTime());
            courseService.newCourse(course);
            resp.put("success", "true");
            resp.put("message", "Course successfully updated.");
        }else{
            resp.put("success", "false");
            resp.put("message", "This course is de-activated. Please contact your administrator.");
        }


        return resp;
    }

    @GetMapping(value = "/deleteCourse/{courseId}")
    @ResponseBody
    public Map<String, String> deleteCourse(ModelMap model, @PathVariable int courseId) {
        Map<String, String> resp = new HashMap<>();
        System.out.println("comes here common Controller ");
        Course course = courseService.courseById(courseId);
        if(course.isEnable()) {
            courseService.disableCourse(course);
            resp.put("success", "true");
            resp.put("message",course.getCourseName() +" has been deleted successfully !!!");
        }else{
            resp.put("success", "false");
            resp.put("message", "This course is already de-activated. Please contact your administrator.");
        }
        return resp;
    }

}
