package com.bit.sams.entity.util;
import java.sql.Timestamp;
import java.util.Calendar;


public class AppUtil {

    public static final String ZERO_TO_NINE = "[0-9]";
    public static final String NUMBER_PATTERN = "^[0-9,.]+$";
    public static final String MOBILE_PATTERN = "\\d{10}";

    public static final String STRING_PATTERN = "(?i)[a-z]+([,.\\s]+[a-z]+)*";
    public static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)$";
    public static final String PASSWORD_PATTERN ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{6,10}$";



    public static final String SUBJECT_CODE = "^[0-9]{3,5}$";


    public static String MESSAGE="";


    public static Timestamp currentTime() {
        Calendar calendar=Calendar.getInstance();
        long millis = calendar.getTimeInMillis();
        Timestamp ts =  new Timestamp(millis);
        return ts;
    }


}
