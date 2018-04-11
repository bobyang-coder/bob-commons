package com.bob.base.common.string;

import java.util.regex.Pattern;

/**
 * 手机号工具类
 *
 * @author bob   <bobyang_coder@163.com>
 * @version v1.0
 * @since 2017/9/11
 */
public class MobileUtils {

    /**
     * 判断是否是手机号
     *
     * @param mobile
     * @return
     */
    public static boolean isMobile(String mobile) {
        return Pattern.matches("^(1(([34578][0-9])))\\d{8}$", mobile);
    }
}
