package com.jw.services;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author mioko
 */
public interface PermissionService {

    /**
     * 获取一级菜单
     *
     * @param roleId
     * @return
     */
    List getPermissionMenu(@Param("roleId") int roleId);


    /**
     * 获取所有权限菜单
     *
     * @return
     */
    List getAllPermissionMenu();

}