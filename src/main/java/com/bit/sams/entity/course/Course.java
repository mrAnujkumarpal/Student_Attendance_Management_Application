package com.bit.sams.entity.course;

import com.bit.sams.entity.BaseEntity;

@Entity
@Getter
@Setter
public class Course extends BaseEntity {

    private String courseCode;
    private String courseName;
    private String affiliation;
}
