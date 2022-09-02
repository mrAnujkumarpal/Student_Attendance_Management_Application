package com.bit.sams.entity.subject;

import com.bit.sams.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class Subject extends BaseEntity {

    private String subjectCode;
    private String subjectName;


    private Long subCourseId;
    private Long teacherId;

}
