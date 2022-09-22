package com.neutrino.interceptor;

import com.neutrino.entity.Manager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerLoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        // 判断session
        HttpSession session  = request.getSession();
        // 从session中取出用户身份信息
        Manager managerInfo = (Manager)session.getAttribute("manager");
        // session存在时，放行
        if (managerInfo!=null) {
            return true;
        }
        // 执行这里表示用户身份需要认证，跳转登陆页面
        request.getRequestDispatcher("/manager/login.jsp").forward(request, response);
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
