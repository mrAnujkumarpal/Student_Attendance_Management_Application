package com.bit.sams.service.impl;

import com.bit.sams.entity.subject.Subject;
import com.bit.sams.repository.SubjectRepository;
import com.bit.sams.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectImpl implements SubjectService {

    @Autowired
    SubjectRepository subjectRepository;

    @Override
    public void addSubject(Subject subject) {
        subjectRepository.save(subject);
    }

    @Override
    public List<Subject> allSubject() {
        return subjectRepository.findAll();
    }

    @Override
    public Subject subjectById(Integer subjectId) {
        return subjectRepository.getById(subjectId);
    }


}
