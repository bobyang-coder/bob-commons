package com.bob.commons.response;

import com.bob.commons.exception.BaseException;

/**
 * 基础响应
 *
 * @author bob   <bobyang_coder@163.com>
 * @since 2017/8/6
 */
public class BaseRes {
    /**
     * 响应码
     */
    private int code;
    /**
     * 响应信息
     */
    private String message;

    /**
     * 错误等级
     */
    private int level;

    public BaseRes() {
    }

    public BaseRes(BaseException ex) {
        this.code = ex.getCode();
        this.message = ex.getMessage();
        this.level = ex.getLevel();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

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
}
