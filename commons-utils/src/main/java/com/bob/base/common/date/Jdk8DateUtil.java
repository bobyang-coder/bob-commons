package com.bob.base.common.date;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

/**
 * 利用jdk8提供的日期类
 *
 * @author bob   <bobyang_coder@163.com>
 * @version v1.0
 * @since 2018/1/2
 */
public class Jdk8DateUtil {


    /**
     * 获取当天的日期，只有年月日
     *
     * @return
     */
    private static Date getCurrentDate() {
        ZonedDateTime zdt = LocalDate.now().atStartOfDay(ZoneId.systemDefault());
        return Date.from(zdt.toInstant());
    }

    //java.time.LocalDate 转 java.util.Date

    private static Date of() {
        LocalDate dateOfBirth = LocalDate.of(2010, 01, 14);
        return Date.from(dateOfBirth.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public static void main(String[] args) {
        System.out.println(getCurrentDate());
    }
}
