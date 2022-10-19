package com.task.service.impl;

import com.task.dao.ClassDao;
import com.task.domain.Class;
import com.task.domain.Grade;
import com.task.domain.Student;
import com.task.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.service.impl
 * @date 2022/10/6 21:23
 */
@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassDao classDao;


    @Override
    public List<Class> getClassNames() {
        return classDao.getClassNames();
    }

    @Override
    public List<Grade> getGrade() {
        return classDao.getGrade();
    }

    @Override
    public List<Class> getClassNamess(int pageInteger, int limitInteger) {
        int pageIndex = (pageInteger - 1) * limitInteger;
        int pageSize = limitInteger;
        return classDao.getClassNamess(pageIndex, pageSize);
    }

    @Override
    public String delettClass(String classname) {
        return classDao.delettClass(classname);
    }

    @Override
    public int addClasses(Class classes) {
        return classDao.addClasses(classes);
    }

    @Override
    public List<Grade> getGrades(int pageInteger, int limitInteger) {
        int pageIndex = (pageInteger - 1) * limitInteger;
        int pageSize = limitInteger;
        return classDao.getGrades(pageIndex, pageSize);
    }


    @Override
    public int getClassCount() {
        return this.classDao.getClassCount();
    }

    @Override
    public int getGradeCount() {
        return this.classDao.getGradeCount();
    }

    @Override
    public int addGrade(Grade grade) {
        return classDao.addGrade(grade);
    }

    @Override
    public String delettGrade(String grade) {
        return classDao.delettGrade(grade);
    }
}
