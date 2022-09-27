package com.bit.sams.entity.subject;

import com.bit.sams.entity.BaseEntity;  

import javax.persistence.*;
import lombok.Data;

@Entity
@Data
public class Subject extends BaseEntity {

    private String subjectCode;
    private String subjectName;

    private String department;
    private int courseId;
    private int subCourseId;
    private int subjectTeacherId;

}
