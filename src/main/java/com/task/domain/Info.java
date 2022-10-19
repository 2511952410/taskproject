package com.task.domain;

import java.sql.Date;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.domain
 * @date 2022/10/6 22:42
 */
public class Info {
    public String username;
    public String info;
    public Date datetime;
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getInfo() {
        return info;
    }
    public void setInfo(String info) {
        this.info = info;
    }
    public Date getDatetime() {
        return datetime;
    }
    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
    @Override
    public String toString() {
        return "Info [username=" + username + ", info=" + info + ", datetime=" + datetime + "]";
    }
    public Info(String username, String info, Date datetime) {
        super();
        this.username = username;
        this.info = info;
        this.datetime = datetime;
    }
}
