package com.task.config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.config
 * @date 2022/10/10 18:07
 */
public class LoginInterceptor  implements HandlerInterceptor {
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        //执行完毕，返回前拦截
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        //处理过程中执行拦截
    }
    static Logger logger = Logger.getLogger(LoginInterceptor.class.getName());
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        Object loginuser = request.getSession().getAttribute("username");
        if(loginuser == null) {
            request.setAttribute("msg","未有用户登录");
            logger.info("对不起,您无权访问");
            request.getRequestDispatcher("/indexs.jsp").forward(request,response);
            return false;
        }else {
            logger.info("无需拦截"+loginuser.toString());
            return true;
        }
    }
}

