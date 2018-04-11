package com.bob.base.common.string;

import java.util.regex.Pattern;

/**
 * 金额相关工具类
 *
 * @author bob   <bobyang_coder@163.com>
 * @version v1.0
 * @since 2017/9/11
 */
public class MoneyUtils {

    /**
     * 判断金额是否是整数
     *
     * @param amount
     * @return
     */
    public static boolean isInteger(String amount) {
        return Pattern.matches("^[0-9]*[1-9][0-9]*$", amount);
    }

    /**
     * 判断金额是否是正整数
     *
     * @param amount 金额
     * @return
     */
    public static boolean isPositiveInteger(String amount) {
        return Pattern.matches("^[1-9]*[1-9][0-9]*$", amount);
    }
}
