package com.neutrino.config;

import ch.qos.logback.classic.pattern.DateConverter;
import com.neutrino.interceptor.ManagerLoginInterceptor;
import com.neutrino.interceptor.UserLoginInterceptor;
import com.neutrino.utils.DateConveter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ConversionServiceFactoryBean;
import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.converter.Converter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.HashSet;
import java.util.Set;

/**
 * WebMvcConfigurer配置类是spring内部的一种配置方式，采用javaBean的方式替代传统的xml方式进行个性化定制
 * 可以自定义一些handler、interceptor、viewResolver、messageConverter等
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    /**
     * addInterceptors:拦截器
     * 需要一个实现了HandlerInterceptor接口的拦截器实例
     * addPathPatterns用于设置拦截器的过滤路径规则
     * excludePathPatterns用于设置不需要拦截的过滤规则
     * 拦截器的主要用途：进行用户登录状态的拦截、日志的拦截等
     * order定义拦截器的执行顺序  数字越小越先执行
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 用户门户网站 登录拦截器
        registry.addInterceptor(new UserLoginInterceptor())
                .addPathPatterns("/listOrder","/userInfoPage","/getOrderInfo");
        // 管理系统 登录拦截器
        registry.addInterceptor(new ManagerLoginInterceptor())
                .addPathPatterns("/manageScenic","/manageTicket","/manageFood",
                        "/manageManager","/manageVisitor");
    }

}
