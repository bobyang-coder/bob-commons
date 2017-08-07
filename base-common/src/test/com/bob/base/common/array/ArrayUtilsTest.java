package com.bob.base.common.array;

import java.util.Arrays;

/**
 * Created by bob on 2017/4/2.
 *
 * @author bob {Tel：15811588260}-{Email：bobyang_coder@163.com}
 * @version 1.0
 * @since 2017/4/2
 */
public class ArrayUtilsTest {

    public static void main(String[] args) {
        int[] a = {1, 2, 2};
        String[] ss = {"22", "22", "22sss"};
        long start1 = System.currentTimeMillis();
        String intstr = ArraysUtils.toString(a, "','", "'", "'");
        long end1 = System.currentTimeMillis();
        System.out.println(intstr + "--" + (start1 - end1));

        long start = System.currentTimeMillis();
        String s = ArraysUtils.toString(ss, "','", "'", "'");
        long end = System.currentTimeMillis();
        System.out.println(s + "--" + (start - end));
        System.out.println(org.apache.commons.lang3.ArrayUtils.toString(a));
        System.out.println(Arrays.toString(a));
        System.out.println(s);

        System.out.println(org.apache.commons.lang3.ArrayUtils.toString(ss));

    }

}