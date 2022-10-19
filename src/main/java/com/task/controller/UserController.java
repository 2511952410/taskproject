package com.task.controller;

import com.alibaba.fastjson.JSON;
import com.task.config.Result;
import com.task.domain.Student;
import com.task.domain.Teacher;
import com.task.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.controller
 * @date 2022/10/6 22:16
 */

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    static Logger logger = Logger.getLogger(UserController.class.getName());
    public static String susername = "";
    //添加用户
    @RequestMapping("/adduser.do")
    @ResponseBody
    public void AddUserDo(HttpServletResponse response,
                          @RequestParam(value = "registerUsername") String susername,
                          @RequestParam(value = "registerNname") String name,
                          @RequestParam(value = "registerPhone") String phone,
                          @RequestParam(value = "selectType") int type,
                          @RequestParam(value = "selectClass") String seclass,
                          @RequestParam(value = "selectGrden") String grden,
                          @RequestParam(value = "registerPassword") String password) {
        logger.info(susername + ":" + name + ":" + phone + ":" + type + ":" + seclass + ":" + grden + ":" + password);
        logger.info("年级：" + grden);
        List<Integer> retjson = new ArrayList<Integer>();
        String jsonString = "";
        switch (type) {
            case 0:
                Teacher teacher = new Teacher(susername, name, password, phone);
                int tcount = userService.addTecUser(teacher);
                if (tcount > 0) {
                    retjson.add(200);
                    retjson.add(type);
                    jsonString = JSON.toJSONString(retjson);
                    logger.info("jsonString：" + jsonString);
                } else {
                    retjson.add(500);
                    retjson.add(type);
                    jsonString = JSON.toJSONString(retjson);
                    logger.info("jsonString：" + jsonString);
                }
                break;

            case 1:
                Student student = new Student(susername, name, phone, seclass, grden, password);
                int scount = userService.addStUser(student);
                if (scount > 0) {
                    retjson.add(200);
                    retjson.add(type);
                    jsonString = JSON.toJSONString(retjson);
                    logger.info("jsonString：" + jsonString);
                } else {
                    retjson.add(500);
                    retjson.add(type);
                    jsonString = JSON.toJSONString(retjson);
                    logger.info("jsonString：" + jsonString);
                }
                break;
        }
        try {
            response.getWriter().print(jsonString);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @RequestMapping("/getStu")
    @ResponseBody
    public Map<String, List<Student>> getStUser(int page, int limit) {
        List<Student> studentList = userService.getStUser(page, limit);
        Map<String, List<Student>> map = new HashMap<String, List<Student>>();
        map.put("data", studentList);
        return map;
    }
    @RequestMapping("/getCount")
    @ResponseBody
    public String getCount(){
        int count = userService.getStuCount();
        String data = "{\"count\":"+count+"}";
        return data;
    }
    @RequestMapping("/getTecUser")
    @ResponseBody
    public Map<String, List<Teacher>> getTec(int page, int limit) {
        List<Teacher> teacherList = userService.getTecUser(page, limit);
        Map<String, List<Teacher>> map = new HashMap<String, List<Teacher>>();
        map.put("data", teacherList);
        return map;

    }
    @RequestMapping("/delete")
    @ResponseBody
    public String deleteUser(@RequestParam("susername") String susername) {
        System.out.println("删除操作");
        return userService.delettStudent(susername);
    }
    @RequestMapping("/update.do")
    public void updateSUser(HttpServletResponse response,
                           @RequestParam("susername") String susername,
                           @RequestParam("sname") String sname,
                           @RequestParam("phone") String phone,
                           @RequestParam("password") String password
    ) {
        List<Integer> listCode = new ArrayList<Integer>();
        int count = userService.updateStu(sname, phone, password, susername);
        if (count > 0) {
            listCode.add(200);
        } else {
            listCode.add(500);
        }
        try {
            response.getWriter().print(JSON.toJSONString(listCode));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @RequestMapping("/Tupdate.do")
    public void updateTUser(HttpServletResponse response,
                            @RequestParam("tusername") String tusername,
                            @RequestParam("phone") String phone,
                            @RequestParam("password") String password
    ) {
        List<Integer> listCode = new ArrayList<Integer>();
        int count = userService.updateTec( phone, password, tusername);
        if (count > 0) {
            listCode.add(200);

        } else {
            listCode.add(500);
        }
        try {
            response.getWriter().print(JSON.toJSONString(listCode));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }




    @RequestMapping("/query.do")
    public @ResponseBody
    String queryAnimal(@RequestParam("page") int page, @RequestParam("limit") int limit, @RequestParam("susername") String susername, @RequestParam("classname") String classname,@RequestParam("grade") String grade, HttpSession session) {
        int before = limit * (page - 1);
        int after = page * limit;
        logger.info(page + ":" + limit);
        List<Student> eilist =userService.queryStudent(susername, classname,grade, before, after);
        List<Student> retList = new ArrayList<Student>();
        for (Student student : eilist) {

            retList.add(student);

        }
        //IndexControl.username
        session.setAttribute("subinfo", eilist);
        logger.info(UserController.susername);
        int count = eilist.size();
        logger.info("获取信息：" + JSON.toJSONString(eilist));

        String jso = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + JSON.toJSONString(retList) + "}";
        return jso;
    }


}
