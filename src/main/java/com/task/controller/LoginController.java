package com.task.controller;

import com.alibaba.fastjson.JSON;
import com.task.domain.*;
import com.task.domain.Class;
import com.task.service.ClassService;
import com.task.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

import java.util.logging.Logger;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.controller
 * @date 2022/10/6 21:24
 */
@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    private ClassService classService;
    @Autowired
    private UserService userService;
    public static String username = "";
    public static String name = "";
    public static String phone = "";
    static Logger logger = Logger.getLogger(LoginController.class.getName());

    @RequestMapping("loginto")
    public void LointTo(HttpServletResponse response,
                        @RequestParam(value = "loginUsername") String username,
                        @RequestParam(value = "loginPassword") String password,
                        @RequestParam(value = "loginType") int loginType, HttpSession session) {
        List<Integer> retjson = new ArrayList<Integer>();
        List<Info> info = new ArrayList<Info>();
        String json = "";
        switch (loginType) {
            case 0:
                if (LoginTeacher(username, password)) {
                    userService.addInfo(new Info(username, "用户登录成功", null));
                    retjson.add(200);
                    retjson.add(loginType);
                    json = JSON.toJSONString(retjson);
                    session.setAttribute("username", username);
                    session.setAttribute("name", name);
                    session.setAttribute("phone", phone);
                    session.setAttribute("password",password);
                    this.username = username;
                    this.name = name;
                    this.phone = phone;

                    info = userService.getInfo(username);
                    session.setAttribute("info", JSON.toJSONString(info));
                    logger.info(JSON.toJSONString(info));
                    logger.info("用户名：" + username + "|" + password+"密码：" + name+phone + "登录成功");
                } else {
                    retjson.add(500);
                    retjson.add(loginType);
                    json = JSON.toJSONString(retjson);
                }

                break;
            case 1:
                if (LoginStudent(username, password)) {
                    userService.addInfo(new Info(username, "用户登录成功", null));
                    retjson.add(200);
                    retjson.add(loginType);
                    json = JSON.toJSONString(retjson);
                    session.setAttribute("username", username);
                    session.setAttribute("name", name);
                    this.username = username;
                    this.name = name;
                    info = userService.getInfo(username);
                    session.setAttribute("info", JSON.toJSONString(info));
                    logger.info(JSON.toJSONString(info));
                    logger.info("用户名：" + username + "|" + "密码：" + name + "登录成功");
                } else {
                    retjson.add(500);
                    retjson.add(loginType);
                    json = JSON.toJSONString(retjson);
                }
                break;
        }


        try {
            response.getWriter().println(json);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public boolean LoginStudent(String username, String password) {
        boolean ret = false;
        List<Student> lstStudents = userService.getStUsers();
        try {
            Optional<Student> getLisStu = lstStudents.stream().filter(item -> item.susername.equals(username)).findFirst();//返回查找到的第一个元素
            if (getLisStu.isPresent()) {
                Student student = getLisStu.get();
                if (student.getSusername().equals(username) && student.getPassword().equals(password)) {
                    name = student.getSname();
                    phone=student.getPhone();
                    ret = true;
                }
            }
        } catch (Exception e) {

            // TODO: handle exception
        }

        return ret;
    }

    public boolean LoginTeacher(String username, String password) {
        boolean ret = false;
        List<Teacher> lstTeachers = userService.getTecUsers();
        try {
            Optional<Teacher> getLisTec = lstTeachers.stream().filter(item -> item.tusername.equals(username)).findFirst();//返回查找到的第一个元素
            if (getLisTec.isPresent()) {
                Teacher teacher = getLisTec.get();
                if (teacher.getTusername().equals(username) && teacher.getPassword().equals(password)) {
                    name = teacher.getTname();
                    phone=teacher.getPhone();
                    ret = true;
                }
            }
        } catch (Exception e) {

            // TODO: handle exception
        }

        return ret;
    }


    //获取班级列表
    @RequestMapping("list")
    public void listOption(HttpServletResponse response) {
        List<Class> lisoptList = classService.getClassNames();
        List<String> listsStrings = new ArrayList<String>();
        listsStrings.add("选择班级");
        for (Class className : lisoptList) {
            listsStrings.add(className.getClassname());
        }
        String json = JSON.toJSONString(listsStrings);
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //获取年级
    @RequestMapping("listgrade")
    public void lisgarde(HttpServletResponse response) {
        List<Grade> studentList = classService.getGrade();
        List<String> liss = new ArrayList<String>();
        liss.add("选择年级");
        for (Grade grade : studentList) {
            liss.add(grade.getGrade());
        }
        String json = JSON.toJSONString(liss);
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @RequestMapping("/getClassCount")
    @ResponseBody
    public String getClassCount() {
        int count = classService.getClassCount();
        String data = "{\"count\":" + count + "}";
        return data;
    }

    @RequestMapping("/getGradeCount")
    @ResponseBody
    public String getGradeCount() {
        int count = classService.getGradeCount();
        String data = "{\"count\":" + count + "}";
        return data;
    }

    @RequestMapping("/getClass")
    @ResponseBody
    public Map<String, List<Class>> getClass(int page, int limit) {
        List<Class> classList = classService.getClassNamess(page, limit);
        Map<String, List<Class>> map = new HashMap<String, List<Class>>();
        map.put("data", classList);
        return map;
    }

    @RequestMapping("/getGrade")
    @ResponseBody
    public Map<String, List<Grade>> getGrade(int page, int limit) {
        List<Grade> gradeList = classService.getGrades(page, limit);
        Map<String, List<Grade>> map = new HashMap<String, List<Grade>>();
        map.put("data", gradeList);
        return map;
    }


    //添加班级
    @RequestMapping("/addclass.do")
    @ResponseBody
    public void AddClass(HttpServletResponse response,
                         @RequestParam(value = "registerUsername") String classname) {
        logger.info(classname);
        logger.info("班级：" + classname);
        List<Integer> retjson = new ArrayList<Integer>();
        String jsonString = "";
        Class aclass = new Class(classname);
        int tcount = classService.addClasses(aclass);
        if (tcount > 0) {
            retjson.add(200);
            jsonString = JSON.toJSONString(retjson);
            logger.info("jsonString：" + jsonString);
        } else {
            retjson.add(500);
            jsonString = JSON.toJSONString(retjson);
            logger.info("jsonString：" + jsonString);
        }
        try {
            response.getWriter().print(jsonString);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @RequestMapping("/deleteclass")
    @ResponseBody
    public String deleteClass(@RequestParam("classname") String classname) {
        System.out.println("删除操作");
        return classService.delettClass(classname);
    }

    //添加年级
    @RequestMapping("/addgrade.do")
    @ResponseBody
    public void AddGrade(HttpServletResponse response,
                         @RequestParam(value = "registerUsername") String grade) {
        logger.info(grade);
        logger.info("年级：" + grade);
        List<Integer> retjson = new ArrayList<Integer>();
        String jsonString = "";
        Grade grade1 = new Grade(grade);
        int tcount = classService.addGrade(grade1);
        if (tcount > 0) {
            retjson.add(200);
            jsonString = JSON.toJSONString(retjson);
            logger.info("jsonString：" + jsonString);
        } else {
            retjson.add(500);
            jsonString = JSON.toJSONString(retjson);
            logger.info("jsonString：" + jsonString);
        }
        try {
            response.getWriter().print(jsonString);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @RequestMapping("/deletegrade")
    @ResponseBody
    public String deleteGrade(@RequestParam("grade") String grade) {
        System.out.println("删除操作");
        return classService.delettGrade(grade);
    }
}
