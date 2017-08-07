package com.bob.base.common.string;

import java.util.regex.Pattern;

/**
 * 针对字符串的工具类
 *
 * @author bob
 * @version 1.0
 * @since 2016-11-20 10:21
 */
public class StringUtils {

    /**
     * 判断是否是手机号
     *
     * @param mobile
     * @return
     */
    public static boolean isMobile(String mobile) {
        String pMobile = "^(1(([34578][0-9])))\\d{8}$";
        return Pattern.matches(pMobile, mobile);
    }
}
