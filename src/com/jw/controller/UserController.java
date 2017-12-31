package com.jw.controller;

import com.jw.pojo.UserInfo;
import com.jw.services.UserService;
import com.jw.util.DeciptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author mioko
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/api/modifypassword"}, method = RequestMethod.POST)
    public ModelAndView login(String jw_password, HttpSession session) {
        UserInfo userInfo = (UserInfo) session.getAttribute("user");
        ModelAndView mav = new ModelAndView();
        if (userService.modifyPassword(userInfo.getUserName(), DeciptUtil.md5(jw_password))) {
            mav.addObject("msg", "修改成功，请重新登录");
            mav.setViewName("system/changepw_status");
        } else {
            mav.addObject("msg", "修改失败");
            mav.setViewName("system/changepw_status");
        }
        return mav;
    }

    @RequestMapping(value = {"/changepassword"})
    public ModelAndView cp() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("system/changePassword");
        return mav;
    }
}
