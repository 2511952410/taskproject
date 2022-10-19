package com.task.service.impl;


import com.task.dao.UserDao;
import com.task.domain.Info;
import com.task.domain.Student;
import com.task.domain.Teacher;
import com.task.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.service.impl
 * @date 2022/10/6 21:55
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao  userDao;

    @Override
    public List<Student> getStUser(int pageInteger, int limitInteger) {
        int pageIndex = (pageInteger - 1) * limitInteger;
        int pageSize = limitInteger;

        return userDao.getStUser(pageIndex, pageSize);
    }

    @Override
    public int getStuCount() {
        return this.userDao.getStuCount();
    }

    @Override
    public List<Teacher> getTecUser(int pageInteger, int limitInteger) {
        int pageIndex = (pageInteger - 1) * limitInteger;
        int pageSize = limitInteger;
        return userDao.getTecUser(pageIndex, pageSize);
    }

    @Override
    public List<Student> getStUsers() {
        return userDao.getStUsers();
    }

    @Override
    public List<Teacher> getTecUsers() {
        return userDao.getTecUsers();
    }

    @Override
    public int addStUser(Student student) {
        return userDao.addStUser(student);
    }

    @Override
    public int addTecUser(Teacher teacher) {
        return userDao.addTecUser(teacher);
    }

    @Override
    public Student queryStu(String username) {
        return userDao.queryStu(username);
    }

    @Override
    public int updateStu(String sname, String phone, String password, String susername) {
        return userDao.updateStu(sname,phone,password,susername);
    }

    @Override
    public Teacher querytec(String tusername) {
        return userDao.querytec(tusername);
    }

    @Override
    public int updateTec(String phone, String password, String tusername) {
        return userDao.updateTec(phone,password,tusername);
    }


    @Override
    public List<Info> getInfo(String username) {
        return userDao.getInfo(username);
    }

    @Override
    public int addInfo(Info info) {
        return userDao.addInfo(info);
    }

    @Override
    public String delettStudent(String susername) {
        return  userDao.delettStudent(susername);
    }

    @Override
    public List<Student> queryStudent(String susername, String classname, String grade, int page, int limit) {
        return userDao.queryStudent(susername, classname,grade, page, limit);
    }


}
