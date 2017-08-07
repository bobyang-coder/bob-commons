package com.bob.base.common.date;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by bob on 2017/3/12.
 *
 * @author bob {Tel：15811588260}-{Email：bobyang_coder@163.com}
 * @version 1.0
 * @since 2017/3/12
 */
public class Test {

    public static void main(String[] args) {
        Calendar instance = Calendar.getInstance();
        System.out.println("----" + DateUtils.format(instance, DatePatternConsts.PATTERN_C_YMDHMS));
        System.out.println("----" + DateUtils.format(new Date(), null));
        System.out.println("----" + DateUtils.parse("2017年03月12日 13:01:17", DatePatternConsts.PATTERN_C_YMDHMS));
        System.out.println("----" + DateUtils.getDate(new Date(), DatePatternConsts.PATTERN_S_YMD));
        System.out.println("----" + DateUtils.getTime(new Date(), DatePatternConsts.PATTERN_S_YMD));
        System.out.println("----" + DateUtils.isWeekend(instance));
        Date date = instance.getTime();
        System.out.println("----" + DateUtils.getFirstDayOfMonth(date, null));
        instance.add(Calendar.DAY_OF_MONTH, 15);
        Date toDate = instance.getTime();
        System.out.println("----" + DateUtils.getListWeek(date, toDate));
        System.out.println("----" + DateUtils.getSimpleWeek(date, toDate));


    }
}
