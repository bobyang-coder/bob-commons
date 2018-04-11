package com.bob.commons.exception;

/**
 * 基础错误码
 *
 * @author bob   <bobyang_coder@163.com>
 * @version v1.0
 * @since 2017/12/26
 */
public enum BaseErrorEnum implements ErrorCode {

    SUCCESS("200", "success", Level.ERROR.getCode()),
    ERROR("500", "success", 2),
    SYSTEM_ERROR("100001", "系统错误", 5),

    RULE_IS_NULL("300002", "系统错误", 2),
    RULE_IS_ERROR("300003", "规则语句错误", 2);

    /**
     * 错误码
     */
    private String code;

    /**
     * 错误信息
     */
    private String message;

    /**
     * 错误等级
     */
    private int level;

    BaseErrorEnum(String code, String message, int level) {
        this.code = code;
        this.message = message;
        this.level = level;
    }


    @Override
    public String getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public int getLevel() {
        return level;
    }
}
