package com.task.config;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.config
 * @date 2022/10/6 18:56
 */

public class Result {
    private Integer code;
    private String msg;
    private Object object;

    public Result(String msg, Object object) {
        this.msg = msg;
        this.object = object;
    }

    public Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result() {

    }

    public Result(Integer code, String msg, Object object) {
        this.code = code;
        this.msg = msg;
        this.object = object;
    }

    @Override
    public String toString() {
        return "Result{" +
                "object=" + object +
                ", code=" + code +
                ", msg='" + msg + '\'' +
                '}';
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
