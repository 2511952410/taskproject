package com.task.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * @author 刘通
 * @version V1.0
 * @Package com.task.config
 * @date 2022/10/6 18:55
 */
@Configuration
@ComponentScan({"com.task.controller", "com.task.config"})
@EnableWebMvc
public class SpringMvcConfig {
}