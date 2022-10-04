package com.bit.sams.controller.validator;

import com.bit.sams.entity.Enums;
import com.bit.sams.entity.course.Branch;
import com.bit.sams.entity.students.Student;
import com.bit.sams.entity.subject.Subject;
import com.bit.sams.entity.teachers.Teacher;
import org.apache.commons.lang3.EnumUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

import static com.bit.sams.entity.util.AppUtil.*;

@Component
public class Validate extends ValidateHelper {

    public List<String> validateStudent(Student student) {
        List<String> validateMessage = new ArrayList<>();
        if (!validateValueByRegex(student.getFirstName(), STRING_PATTERN)) {
            validateMessage.add("First Name is not correct.");
        }
        if (!validateValueByRegex(student.getLastName(), STRING_PATTERN)) {
            validateMessage.add("Last Name is not correct.");
        }
        if (!validateValueByRegex(student.getRollNumber(), NUMBER_PATTERN)) {
            validateMessage.add("Please provide correct roll number.");
        }
        if (!validateValueByRegex(student.getStudentEmail(), EMAIL_PATTERN)) {
            validateMessage.add("Email-id is not correct.");
        }
        if (student.getCourseId() == 0) {
            validateMessage.add("Please select main course.");
        }
        if (student.getSubCourseId() == 0) {
            validateMessage.add("Please select current semester.");
        }
        return validateMessage;
    }

    public List<String> validateSubject(Subject subject) {
        List<String> validateMessage = new ArrayList<>();

        if (!EnumUtils.isValidEnum(Enums.DEPARTMENT.class, subject.getDepartment())) {
            validateMessage.add("Please select department");
        }
        if (subject.getCourseId() == 0) {
            validateMessage.add("Please select main course.");
        }
        if (subject.getSubCourseId() == 0) {
            validateMessage.add("Please select current semester.");
        }
        if (!validateValueByRegex(subject.getSubjectCode(), SUBJECT_CODE)) {
            validateMessage.add("Subject code contains only either-3 , or-5 digits.");
        }
        int len = subject.getSubjectName().length();
        if (len > 50 || len < 4) {
            validateMessage.add("Subject Name contains 4-50 characters.");
        }
        return validateMessage;
    }

    public List<String> validateTeacher(Teacher teacher) {
        List<String> validateMessage = new ArrayList<>();
        if (!EnumUtils.isValidEnum(Enums.DEPARTMENT.class, teacher.getDepartment())) {
            validateMessage.add("Please select department");
        }
        if (!EnumUtils.isValidEnum(Enums.TEACHERS_ROLE.class, teacher.getTeacherRole())) {
            validateMessage.add("Please select your designation");
        }
        if (!validateValueByRegex(teacher.getFirstName(), STRING_PATTERN)) {
            validateMessage.add("First Name is not correct.");
        }
        if (!validateValueByRegex(teacher.getLastName(), STRING_PATTERN)) {
            validateMessage.add("Last Name is not correct.");
        }
        if (!validateValueByRegex(teacher.getMobileNumber(), NUMBER_PATTERN)) {
            validateMessage.add("Please provide correct mobile number.");
        }
        if (!EnumUtils.isValidEnum(Enums.HIGHEST_DEGREE.class, teacher.getHighestQualification())) {
            validateMessage.add("Please select your highest qualification");
        }
        if (!validateValueByRegex(teacher.getTeacherEmail(), EMAIL_PATTERN)) {
            validateMessage.add("Email-id is not correct.");
        }

        return validateMessage;
    }

    public List<String> validateBranch(Branch branch) {
        List<String> validateMessage = new ArrayList<>();
        if (branch.getCourseId() == 0) {
            validateMessage.add("Please select main course.");
        }
        if (!validateValueByRegex(branch.getBranchCode(), SUBJECT_CODE)) {
            validateMessage.add("Branch code contains only either-3 or-5 digits.");
        }
        int len = branch.getBranchName().length();
        if (len > 50 || len < 4) {
            validateMessage.add("Branch Name contains 4-50 characters.");
        }


        return validateMessage;
    }
}
