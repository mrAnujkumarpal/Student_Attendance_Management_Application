package com.bit.sams.service;

import com.bit.sams.entity.course.Branch;

import java.util.List;

public interface BranchService {

    void newBranch(Branch course) throws Exception;

    List<Branch> allBranches();

    Branch branchById(Integer branchId);

    List<Branch> branchListByCourseId(Integer courseId);

    void disableBranch(Branch branch);
}
