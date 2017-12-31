package com.jw.controller;

import com.jw.pojo.RoleInfo;
import com.jw.pojo.UserInfo;
import com.jw.services.RoleService;
import com.jw.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author mioko
 * 角色控制
 */
@Controller
@RequestMapping(value = "/api")
public class RoleController implements CodeUtil {

    @Autowired
    private RoleService roleService;

    /**
     * 增加角色
     *
     * @param roleName
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value = {"/addrole"}, method = RequestMethod.POST)
    public ModelAndView addRole(String roleName, HttpServletResponse response, HttpSession session) {
        ModelAndView mav=new ModelAndView();
        UserInfo user = (UserInfo) session.getAttribute("user");
        RoleInfo role = (RoleInfo) session.getAttribute("role");
        mav.setViewName("system/roleManage");
        /**
         * 判断用户当前状态和当前权限
         * 用户状态 0 正常  1 停用
         * 角色 系统初始化时有三个默认角色，不可删除
         * 角色Id为0是超级管理员，拥有最高权限，可以修改系统任何内容
         * 角色Id为1是普通管理员，拥有非系统最高权限
         * 角色Id为2是普通用户，拥有非管理员权限
         * 超级管理员可以添加普通管理员和普通用户以及所有权限，普通管理员可以添加普通用户及其权限
         */
        boolean permission = user.getStatus() == 0 && (role.getRoleId() == 0 || role.getRoleId() == 1);
        if (permission) {
            if (roleService.addRole(roleName)) {
                mav.addObject("msg", ADD_SUCCESS);
                return mav;
            } else {
                mav.addObject("msg", ADD_FAILED);
                return mav;
            }
        } else {
            mav.addObject("msg", FORBIDDEN);
            response.setStatus(403);
            return mav;
        }
    }

    /**
     * 删除角色
     *
     * @param roleId
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value = {"/deleterole"}, method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteRole(int roleId, HttpServletResponse response, HttpSession session) {
        ModelAndView mav=new ModelAndView();
        UserInfo user = (UserInfo) session.getAttribute("user");
        RoleInfo role = (RoleInfo) session.getAttribute("role");
        mav.setViewName("system/roleManage");
        /**
         *  删除角色前先判断是否存在属于该角色的用户并进行提示
         */
        //用户已正常登录且角色为管理员
        boolean permission = user.getStatus() == 0 && (role.getRoleId() == 0 || role.getRoleId() == 1);
        if (permission) {
            //如果不存在属于该角色的用户
            if (roleService.countRoleOfUser(roleId) == 0) {
                //删除角色，删除用户拥有的角色，删除角色所拥有的权限
                if (roleService.deleteRole(roleId) && roleService.deleteRoleOfUser(roleId) && roleService.deletePermissionOfRole(roleId)) {
                    //删除角色成功
                    mav.addObject("msg", DELETE_SUCCESS);
                    return mav;
                } else {
                    //删除角色失败
                    mav.addObject("msg", DELETE_FAILED);
                    return mav;
                }
            } else {
                //存在属于该角色的用户
                mav.addObject("msg", EXIST_ROLE_OF_USER);
                return mav;
            }

        } else {
            mav.addObject("msg", FORBIDDEN);
            response.setStatus(403);
            return mav;
        }
    }

    /**
     * 更新角色名称
     *
     * @param roleId
     * @param roleName
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value = {"/updaterole"}, method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateRole(int roleId, String roleName, HttpServletResponse response, HttpSession session) {
        ModelAndView mav=new ModelAndView();
        UserInfo user = (UserInfo) session.getAttribute("user");
        RoleInfo role = (RoleInfo) session.getAttribute("role");
        boolean permission = user.getStatus() == 0 && (role.getRoleId() == 0 || role.getRoleId() == 1);
        mav.setViewName("system/roleManage");
        if (permission) {
            if (roleService.updateRole(roleId, roleName)) {
                //修改角色成功
                mav.addObject("msg", UPDATE_SUCCESS);
                return mav;
            } else {
                //修改角色失败
                mav.addObject("msg", UPDATE_FAILED);
                return mav;
            }
        } else {
            mav.addObject("msg", FORBIDDEN);
            response.setStatus(403);
            return mav;
        }
    }

    /**
     * 查询所有角色
     *
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value = {"/allrole"})
    @ResponseBody
    public ModelAndView allRole(HttpServletResponse response, HttpSession session) {
        ModelAndView mav=new ModelAndView();
        UserInfo user = (UserInfo) session.getAttribute("user");
        RoleInfo role = (RoleInfo) session.getAttribute("role");
        boolean permission = user.getStatus() == 0 && (role.getRoleId() == 0 || role.getRoleId() == 1);
        System.out.println(permission);
        if (permission) {
            List<RoleInfo> rolelist = roleService.allRole();
            mav.addObject("allrole", rolelist);
            mav.setViewName("system/roleManage");
            return mav;
        } else {
            mav.addObject("msg", FORBIDDEN);
            response.setStatus(403);
            return mav;
        }
    }


}
