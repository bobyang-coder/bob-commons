package com.bob.commons.response.web;

import com.bob.commons.exception.BaseException;
import com.bob.commons.exception.ErrorCode;
import com.bob.commons.response.BaseRes;

/**
 * json格式的web层响应
 *
 * @author bob   <bobyang_coder@163.com>
 * @since 2017/8/6
 */
public class JsonWebRes extends BaseRes {
    public JsonWebRes() {
        super();
    }

    public JsonWebRes(Exception exception) {
        if (exception instanceof BaseException) {
            BaseException ex = (BaseException) exception;
            super.setCode(ex.getCode());
            super.setMessage(ex.getMessage());
            super.setLevel(ex.getLevel());
        } else {
            super.setCode(ErrorCode.SYSTEM_ERROR.getCode());
            super.setMessage(ErrorCode.SYSTEM_ERROR.getMessage());
            super.setLevel(ErrorCode.SYSTEM_ERROR.getLevel());
        }
    }

}
