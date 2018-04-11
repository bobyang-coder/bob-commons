package com.bob.commons.exception;

import java.util.Map;

/**
 * 基础异常类
 *
 * @author bob   <bobyang_coder@163.com>
 * @since 2017/8/6
 */
public class BaseException extends RuntimeException {

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

    private Map<String, Object> map;

    BaseException(ErrorCode errorCode) {
        this.code = errorCode.getCode();
        this.message = errorCode.getMessage();
        this.level = errorCode.getLevel();
    }

    public BaseException(String code, String message, int level) {
        this.code = code;
        this.message = message;
        this.level = level;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }


    public BaseException set(String key, Object obj) {
        map.put(key, obj);
        return this;
    }
}
