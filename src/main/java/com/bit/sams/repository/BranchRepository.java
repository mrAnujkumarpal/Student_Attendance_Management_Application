package com.bit.sams.repository;

import com.bit.sams.entity.course.Branch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BranchRepository extends JpaRepository<Branch,Integer> {

    List<Branch> findByCourseIdAndEnable(Integer courseId, Boolean enable);
}
