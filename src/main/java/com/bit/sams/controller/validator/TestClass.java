package com.bit.sams.controller.validator;

import static com.bit.sams.entity.util.AppUtil.SUBJECT_CODE;

public class TestClass  extends ValidateHelper{

    public static void main(String[] args) {


        if (!validateValueByRegex(String.valueOf(1243), SUBJECT_CODE)) {
            System.out.println(" this is not code ");
        }else {
            System.out.println(" CODE;");
        }

    }
}
