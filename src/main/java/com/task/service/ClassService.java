package com.task.service;

import com.task.domain.Class;
import com.task.domain.Grade;
import com.task.domain.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.service
 * @date 2022/10/6 21:22
 */
public interface ClassService {
    //获取班级名称
    List<Class> getClassNames();

    //获取年级
    List<Grade> getGrade();

    //分页获取班级名称
    List<Class> getClassNamess(int pageInteger, int limitInteger);

    //删除班级
    String delettClass(String classname);

    //添加班级
    int addClasses(Class classes);

    //分页获取年级
    List<Grade> getGrades(int pageInteger, int limitInteger);

    //获取班级数据条数
    public int getClassCount();

    //获取年级数据条数
    public int getGradeCount();

    //添加年级
    int addGrade(Grade grade);

    //删除班级
    String delettGrade(String grade);

}
