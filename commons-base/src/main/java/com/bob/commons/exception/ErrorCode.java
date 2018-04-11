package com.bob.commons.exception;

/**
 * 错误码接口
 * <p>
 * 1.错误码:前两位为各业务层类型，后四位业务内错误码
 * 2.10打头为基础公共异常类型
 *
 * @author bob   <bobyang_coder@163.com>
 * @since 2017/8/6
 */
public interface ErrorCode {

    public String getCode();

    public String getMessage();

    public int getLevel();


    enum Level {
        //成功
        SUCCESS(0),
        //验证错误
        ERROR(1),
        //警告
        WARN(2);

        private int code;

        Level(int code) {
            this.code = code;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }
    }
}


