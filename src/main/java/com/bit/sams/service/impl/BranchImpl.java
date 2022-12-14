package com.bit.sams.service.impl;

import com.bit.sams.entity.course.Branch;
import com.bit.sams.entity.util.AppUtil;
import com.bit.sams.repository.BranchRepository;
import com.bit.sams.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchImpl implements BranchService {

    @Autowired
    BranchRepository branchRepository;

    @Override
    public void newBranch(Branch course) {
        branchRepository.save(course);
    }

    @Override
    public List<Branch> allBranches() {
        return branchRepository.findAll();
    }

    @Override
    public Branch branchById(Integer branchId) {
        return branchRepository.getById(branchId);
    }

    @Override
    public List<Branch> branchListByCourseId(Integer courseId) {
         return branchRepository.findByCourseIdAndEnable(courseId,true);
    }

    @Override
    public void disableBranch(Branch branch) {
        branch.setEnable(false);
        branch.setModifiedOn(AppUtil.currentTime());
        branch.setModifiedBy(9999);
        branchRepository.save(branch);
    }
}
