package com.task.service;

import com.task.domain.Info;
import com.task.domain.Student;
import com.task.domain.Teacher;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.service
 * @date 2022/10/6 21:54
 */
public interface UserService {
    //分页查询所有学生
    List<Student> getStUser(int pageInteger, int limitInteger);

    //获取学生数据条数
    public int getStuCount();

    //分页查询所有教师
    List<Teacher> getTecUser(int pageInteger, int limitInteger);

    //查询所有学生
    List<Student> getStUsers();

    //查询所有教师
    List<Teacher> getTecUsers();

    //添加学生
    int addStUser(Student student);

    //添加教师
    int addTecUser(Teacher teacher);

    //查询学生
    Student queryStu(String username);

    //更新学生
    int updateStu(String sname, String phone, String password, String susername);

    //查询老师
    Teacher querytec(String tusername);

    //更新老师
    int updateTec(String phone,String password, String tusername);

    List<Info> getInfo(String username);

    //登录状态时间
    int addInfo(Info info);

    //删除学生
    String delettStudent(String susername);

    //分页搜索学生学号or班级or年级
    public List<Student> queryStudent(String susername, String classname,String grade, int page, int limit);


}
