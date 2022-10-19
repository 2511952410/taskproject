package com.task.domain;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.domain
 * @date 2022/10/9 11:55
 */
public class Grade {
    @Override
    public String toString() {
        return "Grade{" +
                "grade='" + grade + '\'' +
                '}';
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Grade(String grade) {
        this.grade = grade;
    }

    public String grade;
}
