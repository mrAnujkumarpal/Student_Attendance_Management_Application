package com.bit.sams.entity.course;

import com.bit.sams.entity.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

@Entity
@Data
public class Course extends BaseEntity {

    private String courseCode;
    private String courseName;
    private String affiliation;
}
