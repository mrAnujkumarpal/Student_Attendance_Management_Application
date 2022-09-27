package com.bit.sams.service;

import com.bit.sams.entity.course.Branch;

import java.util.List;

public interface BranchService {

    void newBranch(Branch course);

    List<Branch> allBranches();

    Branch branchById(Integer branchId);

    List<Branch> branchListByCourseId(Integer courseId);
}
