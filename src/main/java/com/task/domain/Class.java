package com.task.domain;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.domain
 * @date 2022/10/6 21:10
 */
public class Class {
    public String classname;

    public Class(String classname) {
        this.classname = classname;
    }

    @Override
    public String toString() {
        return "ClassDao{" +
                "classname='" + classname + '\'' +
                '}';
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }
}
