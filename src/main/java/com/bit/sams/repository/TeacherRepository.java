package com.bit.sams.repository;

import com.bit.sams.entity.teachers.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher, Integer> {

    List<Teacher> findByDepartmentAndEnable(String department, Boolean enable);
}
