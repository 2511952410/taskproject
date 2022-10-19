package com.task.util;


import com.task.config.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author 刘通
 * @version 1.0.0
 * @date 2022年09月09日 09:11:37
 * @packageName com.demo.config
 * @className ProjectExceptionAdvice
 * @describe TODO
 */
@RestControllerAdvice
public class ProjectExceptionAdvice {
    @ExceptionHandler(Exception.class)
    public Result doException(Exception ex){
        System.out.println("出错了");
        return new Result(400,null,"程序出异常了");
    }
}

