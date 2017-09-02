package com.bob.base.common.date;

/**
 * 日期格式常量类
 *
 * @author bob {Tel：15811588260}-{Email：bobyang_coder@163.com}
 * @version 1.0
 * @since 2017/4/2
 */
public class DatePatternConsts {

    //yyyy-MM-dd HH:mm:ss
    public static final String PATTERN_YEAR = "yyyy";
    public static final String PATTERN_MONTH = "MM";
    private final static String PATTERN_DAY = "dd";
    private final static String PATTERN_HOUR = "HH";
    private final static String PATTERN_MINUTE = "mm";
    private final static String PATTERN_SECOND = "ss";

    //CST
    public static final String PATTERN_CST = "EEE MMM dd HH:mm:ss z yyyy";

    //L Line(横线"-")
    public static final String PATTERN_L_YM = "yyyy-MM";
    public static final String PATTERN_L_YMD = "yyyy-MM-dd";
    public static final String PATTERN_L_YMDHMS = "yyyy-MM-dd HH:mm:ss";

    //B Blank
    public static final String PATTERN_B_YM = "yyyyMM";
    public static final String PATTERN_B_YMD = "yyyyMMdd";
    public static final String PATTERN_B_YMDHMS = "yyyyMMdd HH:mm:ss";

    //S Slash(斜线"/")
    public static final String PATTERN_S_YM = "yyyy/MM";
    public static final String PATTERN_S_YMD = "yyyy/MM/dd";
    public static final String PATTERN_S_YMDHMS = "yyyy/MM/dd HH:mm:ss";

    //C Chinese(汉字)
    public static final String PATTERN_C_YM = "yyyy年MM月";
    public static final String PATTERN_C_YMD = "yyyy年MM月dd日";
    public static final String PATTERN_C_YMDHMS = "yyyy年MM月dd日 HH:mm:ss";
}
