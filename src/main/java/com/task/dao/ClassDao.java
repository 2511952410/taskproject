package com.task.dao;

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
 * @Package com.task.dao
 * @date 2022/10/6 21:17
 */
public interface ClassDao {
    //获取班级名称
    @Select("select * from class")
    List<Class> getClassNames();

    //获取年级
    @Select("select * from grade")
    List<Grade> getGrade();

    //分页获取班级名称
    @Select("select * from class limit #{param1},#{param2}")
    List<Class> getClassNamess(int pageIndex, int pageSize);

    //添加班级
    @Insert("insert into class(classname) values (#{classname})")
    int addClasses(Class classes);

    //删除班级
    @Delete("delete from class where classname=#{classname}")
    String delettClass(String classname);

    //分页获取年级
    @Select("select * from grade limit #{param1},#{param2}")
    List<Grade> getGrades(int pageIndex, int pageSize);

    //获取班级数据条数
    @Select(" select count(*) from class ")
    public int getClassCount();

    //获取年级数据条数
    @Select(" select count(*) from grade ")
    public int getGradeCount();

    //添加年级
    @Insert("insert into grade(grade) values (#{grade})")
    int addGrade(Grade grade);

    //删除班级
    @Delete("delete from grade where grade=#{grade}")
    String delettGrade(String grade);

}

