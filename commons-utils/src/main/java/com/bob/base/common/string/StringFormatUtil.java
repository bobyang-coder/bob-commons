package com.bob.base.common.string;

import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Set;

/**
 * 字符串格式化工具类
 *
 * @author bob   <bobyang_coder@163.com>
 * @version v1.0
 * @since 2017/10/9
 */
public class StringFormatUtil {

    /**
     * 格式化Set集合
     *
     * @param pattern
     * @param set
     * @return
     */
    public static String format(String pattern, Set<String> set) {
        StringBuilder sb = new StringBuilder("");
        if (null != set && !set.isEmpty()) {
            for (String s : set) {
                sb.append(MessageFormat.format(pattern, s));
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String pattern = "''{0}'',";
        HashSet<String> set = new HashSet<>();
        set.add("s1111");
        set.add("s2222");
        System.out.println(format(pattern, set));


    }
}
