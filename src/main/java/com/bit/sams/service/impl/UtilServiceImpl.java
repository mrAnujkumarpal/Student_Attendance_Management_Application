package com.bit.sams.service.impl;

import com.bit.sams.entity.Enums;
import com.bit.sams.service.UtilService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class UtilServiceImpl implements UtilService {

    @Override
    public List<String> qualification() {
        return Stream.of(Enums.HIGHEST_DEGREE.values())
                .map(Enum::name)
                .collect(Collectors.toList());
    }

    @Override
    public List<String> departments() {
        return Stream.of(Enums.DEPARTMENT.values())
                .map(Enum::name)
                .collect(Collectors.toList());
    }
    @Override
    public List<String> teacherRole() {
        return Stream.of(Enums.TEACHERS_ROLE.values())
                .map(Enum::name)
                .collect(Collectors.toList());
    }
}
