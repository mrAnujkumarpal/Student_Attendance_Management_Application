package com.bit.sams.entity.course;

import com.bit.sams.entity.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

@Entity
@Data
public class SubCourse extends BaseEntity {

    private String name;


    private Long classCordinatorId;
}
