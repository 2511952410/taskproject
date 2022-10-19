package com.task.dao;

import com.task.domain.Info;
import com.task.domain.Student;
import com.task.domain.Teacher;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.dao
 * @date 2022/10/6 21:38
 */
public interface UserDao {
    //分页查询所有学生
    @Select("select * from student limit #{param1},#{param2}")
    List<Student> getStUser(int pageIndex, int pageSize);

    //分页查询所有教师
    @Select("select * from teacher limit #{param1},#{param2}")
    List<Teacher> getTecUser(int pageIndex, int pageSize);

    //获取学生数据条数
    @Select(" select count(*) from student ")
    public int getStuCount();

    //查询所有学生
    @Select("select * from student")
    List<Student> getStUsers();

    //查询所有教师
    @Select("select * from teacher")
    List<Teacher> getTecUsers();

    //添加学生
    @Insert("insert into student(susername,sname,phone,classname,grade,password) values (#{susername},#{sname},#{phone},#{classname},#{grade},#{password})")
    int addStUser(Student student);

    //添加教师
    @Insert("insert into teacher(tusername,tname,password,phone) values (#{tusername},#{tname},#{password},#{phone})")
    int addTecUser(Teacher teacher);

    //搜索学生
    @Select("select * from student where susername = #{susername}")
    Student queryStu(String username);

    //更新学生
    @Update("update student set sname = #{arg0},phone = #{arg1}, password = #{arg2} where susername = #{arg3}")
    int updateStu(String sname, String phone, String password, String susername);

    //搜索老师
    @Select("select * from teacher where tusername = #{tusername}")
    Teacher querytec(String tusername);

    //更新老师
    @Update("update teacher set phone = #{arg0},password = #{arg1} where tusername = #{arg2}")
    int updateTec(String phone,String password, String tusername);

    @Select("select * from info where username = #{username}")
    List<Info> getInfo(String username);

    //登录状态时间
    @Insert("insert into info(username,info) values (#{username},#{info})")
    int addInfo(Info info);

    //删除学生
    @Delete("delete from student where susername=#{susername}")
    String delettStudent(String susername);

    //分页搜索学生学号or班级or年级
    @Select("select * from student where susername like #{arg0} or classname = #{arg1} or grade = #{arg2} limit #{arg3},#{arg4}")
    public List<Student> queryStudent(String susername, String classname, String grade, int page, int limit);

    //获取当前登录的教师信息
    @Select("select * from teacher where tusername=#{tusername")
    Teacher findteacherByTusername(@Param("tusername") String tusername);
}
