package com.bit.sams.entity.course;

import com.bit.sams.entity.BaseEntity;

@Entity
@Getter
@Setter
public class SubCourse extends BaseEntity {

    private String name;


    private Long classCordinatorId;
}
