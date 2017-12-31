package com.jw.filter;

import com.jw.pojo.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**登录认证拦截器
 * 拦截器必须实现HandleInterceptor接口
 * @author mioko
 */
public class AuthorizationInterceptor implements HandlerInterceptor{
    /** 不拦截以下页面*/
    static final  String[] IGNORE_URL={"/", "/login", "/index"};

    /**
     * 该方法将在整个请求完成之后执行，主要作用是清理资源
     * 该方法也只能在当前Interceptor的preHandle方法的返回值为true时才会执行
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }

    /**
     * preHandle方法是进行处理器拦截用的
     * 该方法将在Controller处理之前调用
     * 该方法的返回值为true拦截器才会继续往下执行
     * 该方法的返回值为false的时候整个请求就结束了
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        boolean flag=false;
        String servletPath=httpServletRequest.getServletPath();
        for(String s:IGNORE_URL){
            if(servletPath.contains(s)){
                flag=true;
                break;
            }
        }
        if(!flag){
            //获取session中的用户
            UserInfo user=(UserInfo)httpServletRequest.getSession().getAttribute("user");
            if(user==null){
                //————>拦截请求
                httpServletRequest.setAttribute("msg","用户未登录");
                httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/commons/login.jsp").forward(httpServletRequest,httpServletResponse);
            }
            else {
                //如果已登录-->放行
                flag=true;
            }
        }
        return flag;
    }

    /**
     * 该方法在Controller的方法调用之后执行，方法中可以对ModelAndView进行操作
     * 该方法也只能在当前Interceptor的preHandle方法的返回值为true时才会执行
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
//        System.out.println("postHandle");
    }


}
