package com.bit.sams.entity.teachers;

import com.bit.sams.entity.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

@Entity
@Data
public class Teacher extends BaseEntity {

    String teacherName;
    String mobileNumber;
    String teacherEmail;
    String password;
    String highestQualification;

}
