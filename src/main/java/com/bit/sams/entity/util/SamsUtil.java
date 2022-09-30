package com.bit.sams.entity.util;

public class SamsUtil {

    public static final String ZERO_TO_NINE = "[0-9]";
    public static final String NUMBER_PATTERN = "^[0-9,.]+$";
    public static final String MOBILE_PATTERN = "\\d{10}";
    public static final String STRING_PATTERN = "(?i)[a-z]+([,.\\s]+[a-z]+)*";
    public static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)$";
    public static final String PASSWORD_PATTERN ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{6,10}$";

}
