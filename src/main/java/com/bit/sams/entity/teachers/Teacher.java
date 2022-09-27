package com.bit.sams.entity.teachers;

import com.bit.sams.entity.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

@Entity
@Data
public class Teacher extends BaseEntity {

    private String firstName;
    private String lastName;
    private String mobileNumber;
    private String teacherEmail;
    private String password;

    private String highestQualification;
    private String teacherRole;
    private String department;
}
