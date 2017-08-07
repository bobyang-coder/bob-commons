package com.bob.base.common.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 日期格式化工具
 *
 * @author bob
 * @version 1.0
 * @since 2016-11-20 10:23
 */
public class DateUtils {

    /**
     * 转换日期为指定格式的字符串
     * <p>
     *
     * @param date    日期 如果{@code date} 为 {@code null},则返回{@code null}
     * @param pattern 日期格式
     */
    public static String format(Date date, String pattern) {
        if (null == date) return null;
        if (null == pattern) pattern = DatePatternConsts.PATTERN_L_YMDHMS;
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(date);
    }

    public static String format(Calendar c, String format) {
        return format(c == null ? (Date) null : c.getTime(), format);
    }

    public static String format(String s, String parsePattern, String formatPattern) {
        Date parseDate = parse(s, parsePattern);
        return format(parseDate, formatPattern);
    }

    /**
     * 将指定日期格式的字符串解析为的日期
     * <p>
     *
     * @param s       日期字符串
     * @param pattern 日期格式
     * @return
     */
    public static Date parse(String s, String pattern) {
        Date d = null;
        if (null == pattern) pattern = DatePatternConsts.PATTERN_L_YMDHMS;
        SimpleDateFormat sdf2 = new SimpleDateFormat(pattern);
        try {
            d = sdf2.parse(s);
        } catch (Exception e) {
            //e.printStackTrace();
        }
        return d;
    }


    public static Calendar parse2Calendar(String s, String parsePattern) {
        Calendar c = null;
        Date d = parse(s, parsePattern);
        if (d != null) {
            c = Calendar.getInstance();
            c.setTime(d);
        }
        return c;
    }

    public static Date parse2CSTDate(String s) {
        Date date = null;
        SimpleDateFormat sdf = new SimpleDateFormat(DatePatternConsts.PATTERN_CST, Locale.US);
        try {
            date = sdf.parse(s);
        } catch (Exception e) {
            //e.printStackTrace();
        }
        return date;
    }


    /**
     * 取得当前年的字符串形式yyyy
     */
    public static String getYear(Date date) {
        return format(date, DatePatternConsts.PATTERN_YEAR);
    }


    /**
     * 获取指定日期所在月份
     *
     * @param date    指定日期
     * @param pattern 日期格式
     * @return
     */
    public static String getMonth(Date date, String pattern) {
        if (null == pattern) pattern = DatePatternConsts.PATTERN_L_YM;
        return format(date, pattern);
    }

    public static String getDate(Date date, String pattern) {
        if (null == pattern) pattern = DatePatternConsts.PATTERN_L_YMD;
        return format(date, pattern);
    }

    public static String getTime(Date date, String pattern) {
        if (null == pattern) pattern = DatePatternConsts.PATTERN_L_YMDHMS;
        return format(date, pattern);
    }

    /*
     * 取指定日期所在月份第一天
     */
    public static String getFirstDayOfMonth(Date date, String format) {
        String curMonth = getMonth(date, format);
        return curMonth + "-01";
    }


    /**
     * 判断是否周末
     */
    public static boolean isWeekend(Calendar theDay) {
        int dayOfWeek = theDay.get(Calendar.DAY_OF_WEEK);
        return (dayOfWeek == Calendar.SUNDAY || dayOfWeek == Calendar.SATURDAY);
    }


    /**
     * 日期段星期列表
     *
     * @param startDate 开始日期
     * @param endDate   结束日期
     * @return
     */
    public static List<String> getListWeek(Date startDate, Date endDate) {
        SimpleDateFormat sdf = new SimpleDateFormat();
        SimpleDateFormat sdf1 = new SimpleDateFormat();
        String formatPattern = "yyyy-MM-dd";
        String formatPattern1 = "MM-dd";
        sdf.applyPattern(formatPattern);
        sdf1.applyPattern(formatPattern1);
        SimpleDateFormat formatter4 = new SimpleDateFormat("E", Locale.CHINESE);
        List<String> weekList = new ArrayList<String>();
        long day = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
        for (int i = 0; i <= day; i++) {
            long myTime = (startDate.getTime() / 1000) + 60 * 60 * 24 * i;
            Date myDate = new java.util.Date();
            myDate.setTime(myTime * 1000);
            String week;
            try {
                week = formatter4.format(sdf.parse(sdf.format(myDate))).replaceAll("星期", "周") + "<br/>" + sdf1.format(myDate);
                weekList.add(week);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return weekList;
    }

    //日期段星期列表
    public static List<String> getSimpleWeek(Date startDate, Date endDate) {
        SimpleDateFormat sdf = new SimpleDateFormat();
        SimpleDateFormat sdf1 = new SimpleDateFormat();
        String formatPattern = "yyyy-MM-dd";
        String formatPattern1 = "dd";
        sdf.applyPattern(formatPattern);
        sdf1.applyPattern(formatPattern1);
        SimpleDateFormat formatter4 = new SimpleDateFormat("E", Locale.CHINESE);
        List<String> weekList = new ArrayList<String>();
        long day = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
        for (int i = 0; i <= day; i++) {
            long myTime = (startDate.getTime() / 1000) + 60 * 60 * 24 * i;
            Date myDate = new java.util.Date();
            myDate.setTime(myTime * 1000);
            String week;
            try {
                week = formatter4.format(sdf.parse(sdf.format(myDate))).replaceAll("星期", "") + "<br/>" + sdf1.format(myDate);
                weekList.add(week);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return weekList;
    }


    /**
     * 根据传入的开始时间和截止时间，返回该时间范围内的小时列表
     */
    public static List<String> getBetweenHourList(String beginTime, String endTime) {
        List<String> list = new ArrayList<String>();
        if (beginTime != null && beginTime.length() >= 2 && endTime != null && endTime.length() >= 2) {
            beginTime = beginTime.substring(0, 2);//开始时间
            endTime = endTime.substring(0, 2); //结束时间
            int totalHours = Integer.parseInt(endTime) - Integer.parseInt(beginTime) + 1; //总小时数
            for (int i = 0; i < totalHours; i++) {
                String temp = (Integer.parseInt(beginTime) + i) + "";
                if (temp.length() == 1) {
                    list.add("0" + temp + ":00");
                    //结束时间不生成半小时
                    if (Integer.parseInt(temp) != Integer.parseInt(endTime))
                        list.add("0" + temp + ":30");
                } else {
                    list.add(temp + ":00");
                    //结束时间不生成半小时
                    if (Integer.parseInt(temp) != Integer.parseInt(endTime))
                        list.add(temp + ":30");
                }
            }
        }
        return list;
    }

    /**
     * 计算年龄
     *
     * @return
     */

    public static int getAgeYear(String outTime, String birth) {
        Date outTimeDate = DateUtils.parse(outTime, DatePatternConsts.PATTERN_L_YMD);
        Date birthDate = DateUtils.parse(birth, DatePatternConsts.PATTERN_L_YMD);
        Calendar calOutTime = Calendar.getInstance(); //
        calOutTime.setTime(outTimeDate);
        Calendar calBirthDate = Calendar.getInstance(); //构建出生年月日
        calBirthDate.setTime(birthDate);
        int outYear = calOutTime.get(Calendar.YEAR);
        int birthYear = calBirthDate.get(Calendar.YEAR);
        int birthMonth = calBirthDate.get(Calendar.MONTH);
        int birthDay = calBirthDate.get(Calendar.DAY_OF_MONTH);
        int deletYear = outYear - birthYear;
        if (deletYear > 0) {
            Calendar newCalendar = Calendar.getInstance();//构建新的时间
            newCalendar.clear();
            newCalendar.set(outYear, birthMonth, birthDay);
            Date d = newCalendar.getTime();
            Date dd = calOutTime.getTime();
            if (d.after(dd)) {
                deletYear = deletYear - 1;
            }
        }
        return deletYear;
    }


}
