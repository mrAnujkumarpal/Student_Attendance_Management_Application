package com.bit.sams.entity.students;

import com.bit.sams.entity.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

@Entity
@Data
public class Student extends BaseEntity {

    private String firstName;
    private String lastName;
    private String rollNumber;
    private String password;
    private String studentEmail;
    private String description;
    private int courseId;
    private int subCourseId;


}
