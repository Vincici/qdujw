package com.jw.controller;

import com.jw.pojo.PermissionInfo;
import com.jw.pojo.RoleInfo;
import com.jw.pojo.UserInfo;
import com.jw.services.PermissionService;
import com.jw.services.RoleService;
import com.jw.services.UserService;
import com.jw.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author mioko
 * 权限控制
 */
@Controller
public class PermissonController implements CodeUtil {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionService permissionService;

    /**
     * 授权
     *
     * @param userName
     * @param token
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value = {"/sidelist/{userName}/{token}"})
    public ModelAndView permission(@PathVariable("userName") String userName, @PathVariable("token") String token, HttpServletResponse response, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String salt = (String) session.getAttribute("token");
        if (token.equals(salt)) {
            //反过来写，防止equals后面为空发生空指针异常
            //如果有内存中有验证过的token，即可免认证登录
            //重新查一次用户信息
            UserInfo user = userService.getUserByUserName(userName);
            mav.addObject("userName", user.getUserName());
            mav.addObject("nickName", user.getNickName());
            mav.addObject("status", user.getStatus());
            //根据用户名查询用户角色列表
            RoleInfo role = roleService.getARole(user.getUserName());
            //遍历角色列表，查询用户拥有的各个角色的一级导航菜单
            List<PermissionInfo> pmenu = permissionService.getPermissionMenu(role.getRoleId());
            mav.addObject("pmenu", pmenu);
            //角色列表，是个list，查询时需要遍历，优先显示最大权限的角色
            mav.addObject("role", role);
            mav.setViewName("commons/sidebar");
            return mav;
        } else {
            //未登录显示401
            mav.addObject("msg", UNAUTHORIZED);
            response.setStatus(401);
            return mav;
        }
    }


    @RequestMapping(value = {"/allpermission"})
    public ModelAndView permission(HttpServletResponse response, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/system/permissionManage");
        UserInfo user = (UserInfo) session.getAttribute("user");
        RoleInfo role = (RoleInfo) session.getAttribute("role");
        boolean permission = user.getStatus() == 0 && (role.getRoleId() == 0 || role.getRoleId() == 1);
        if (permission) {
            List<PermissionInfo> allpermission = permissionService.getAllPermissionMenu();
            mav.addObject("all", allpermission);
            return mav;
        } else {
            response.setStatus(403);
            return mav;
        }
    }
}
