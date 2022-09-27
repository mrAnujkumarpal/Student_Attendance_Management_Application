package com.bit.sams.service;

import com.bit.sams.entity.subject.Subject;

import java.util.List;

public interface SubjectService {

    void addSubject(Subject subject);

    List<Subject> allSubject();

    Subject subjectById(Integer subjectId);


}
