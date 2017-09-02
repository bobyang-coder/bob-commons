package com.bob.base.common.array;

import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;

/**
 * 数组相关工具类
 *
 * @author bob {Tel：15811588260}-{Email：bobyang_coder@163.com}
 * @version 1.0
 * @since 2017/4/2
 */
public class ArraysUtils {
    private static final Logger logger = LoggerFactory.getLogger(ArraysUtils.class);
    private static final String STR_COMMA = ",";

    /**
     * 基本数据类型数组转换为
     *
     * @return
     */
    public static String toString4BaseDataType(Object[] arr) {

        Class<?> componentType = arr.getClass().getComponentType();
        System.out.println(componentType.toString());
        if (arr instanceof Integer[]) {
            System.out.println(((Integer[]) arr).toString());
        }

        return "";
    }


    public static String toString4Int(int[] arr, String replacement, String start, String end) {
        long begin = System.currentTimeMillis();
        String replace = Arrays.toString(arr).replace(", ", replacement);
        replace = replace.substring(1, replace.length() - 1);
        replace = start + replace + end;
        long over = System.currentTimeMillis();
        logger.info("method run time:{}",over-begin);
        return replace;
    }

    public static String toString(Object obj, String replacement, String start, String end) {
        long begin = System.currentTimeMillis();
        String result = ArrayUtils.toString(obj).replace(STR_COMMA, replacement);
        result = result.substring(1, result.length() - 1);
        result = start + result + end;
        long over = System.currentTimeMillis();
        logger.info("method run time:{}",over-begin);
        return result;
    }
}
