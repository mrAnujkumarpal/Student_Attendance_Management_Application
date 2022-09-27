package com.bit.sams.entity.course;

import com.bit.sams.entity.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;

@Entity
@Data
public class Branch extends BaseEntity {

    private String branchName;
    private String branchCode;

    private String description;

    private int courseId;
    private int classCordinatorId;
}
