package com.task.domain;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.domain
 * @date 2022/10/6 21:05
 */
public class Student {
    public String susername;
    public String sname;
    public String phone;
    public String classname;
    public String grade;
    public String password;

    @Override
    public String toString() {
        return "Student{" +
                "susername='" + susername + '\'' +
                ", sname='" + sname + '\'' +
                ", phone='" + phone + '\'' +
                ", classname='" + classname + '\'' +
                ", Grade='" + grade + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public String getSusername() {
        return susername;
    }

    public void setSusername(String susername) {
        this.susername = susername;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Student(String susername, String sname, String phone, String classname, String grade, String password) {
        super();
        this.susername = susername;
        this.sname = sname;
        this.phone = phone;
        this.classname = classname;
        this.grade = grade;
        this.password = password;
    }

    public Student(String grade) {
        this.grade = grade;
    }
}
