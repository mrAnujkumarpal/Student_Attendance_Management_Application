package com.bit.sams.controller.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidateHelper {


    public static boolean validateMinMaxLengthOfStr(String str, int minLength, int maxLength) {
        Boolean bool = false;
        int len = str.length();
        if (len >= minLength && len <= maxLength) {
            bool = true;
        }
        return bool;
    }

    public static boolean validateValueByRegex(String value, String regex) {
        Boolean bool = false;
        if (regex != null && regex.trim().length() != 0) {
            boolean matchesRegex = matchesRegex(value, regex);
            if (matchesRegex) {
                bool = true;
            }
        }
        return bool;
    }


    private static boolean matchesRegex(String value, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(value);
        return matcher.matches();
    }
}
