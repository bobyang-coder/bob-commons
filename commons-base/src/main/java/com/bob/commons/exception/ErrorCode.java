package com.bob.commons.exception;

/**
 * 错误码枚举
 * <p>
 * 1.错误码:前两位为各业务层类型，后四位业务内错误码
 * 2.10打头为基础公共异常类型
 *
 * @author bob   <bobyang_coder@163.com>
 * @since 2017/8/6
 */
public enum ErrorCode {
    SUCCESS(200, "success", 2),
    SYSTEM_ERROR(100001, "系统错误", 5),

    RULE_IS_NULL(300002, "系统错误", 2),
    RULE_IS_ERROR(300003, "规则语句错误", 2);

    /**
     * 错误码
     */
    private int code;

    /**
     * 错误信息
     */
    private String message;

    /**
     * 错误等级
     */
    private int level;

    ErrorCode(int code, String message, int level) {
        this.code = code;
        this.message = message;
        this.level = level;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public int getLevel() {
        return level;
    }
}


