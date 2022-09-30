package com.bit.sams.controller.validator;

import com.bit.sams.entity.students.Student;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

import static com.bit.sams.entity.util.SamsUtil.*;

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
        return validateMessage;
    }
}
