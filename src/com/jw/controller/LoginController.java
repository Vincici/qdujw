package com.jw.controller;

import com.jw.pojo.RoleInfo;
import com.jw.pojo.UserInfo;
import com.jw.services.RoleService;
import com.jw.services.UserService;
import com.jw.util.CodeUtil;
import com.jw.util.DeciptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author mioko
 */
@Controller
public class LoginController implements CodeUtil {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;


    @RequestMapping(value = {"/"})
    public String login() {
        return "commons/login";
    }

    /**
     * 认证
     *
     * @param userName
     * @param password
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login(String userName, String password, HttpServletResponse response, HttpSession session) {
        UserInfo user = userService.login(userName, DeciptUtil.md5(password));
        Map<String, Object> map = new HashMap<String, Object>();
        if (user == null) {
            map.put("msg", LOGIN_FAILED);
            response.setStatus(401);
            return map;
        } else {
            if (user.getStatus() == 0) {
                map.put("msg", LOGIN_SUCCESS);
                map.put("userName", user.getUserName());
                Date date = new Date();
                RoleInfo role = roleService.getARole(user.getUserName());
                session.setAttribute("role",role);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                String token = DeciptUtil.md5(userName + sdf.format(date));
                session.setAttribute("user", user);
                session.setAttribute("token", token);
                map.put("token", token);
                return map;
            } else {
                map.put("msg", USER_DISABLED);
                response.setStatus(403);
                return map;
            }
        }
    }

    @RequestMapping(value = {"/logout_security_check"})
    public ModelAndView login(HttpSession session) {
        ModelAndView mav=new ModelAndView();
        session.invalidate();
        mav.setViewName("commons/login");
        return mav;
    }



}
