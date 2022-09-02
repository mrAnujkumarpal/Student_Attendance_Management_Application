package com.bit.sams.entity.teachers;

import com.bit.sams.entity.BaseEntity;
@Entity
@Getter
@Setter
public class Teacher extends BaseEntity {

    String teacherName;
    String mobileNumber;
    String teacherEmail;
    String password;
    String highestQualification;

}
