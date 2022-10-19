package com.task.domain;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.domain
 * @date 2022/10/6 21:05
 */
public class Teacher {
    public String tusername;
    public String tname;
    public String password;
    public String phone;

    @Override
    public String toString() {
        return "Teacher{" +
                "tusername='" + tusername + '\'' +
                ", tname='" + tname + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public String getTusername() {
        return tusername;
    }

    public void setTusername(String tusername) {
        this.tusername = tusername;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Teacher(String tusername, String tname, String password, String phone) {
        super();
        this.tusername = tusername;
        this.tname = tname;
        this.password = password;
        this.phone = phone;
    }
}
