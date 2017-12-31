package com.jw.services;

import com.jw.pojo.RoleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author mioko
 */
public interface RoleService {


    /**
     * 获取角色
     *
     * @param userName
     * @return
     */
    RoleInfo getARole(@Param("userName") String userName);


    /**
     * 添加角色
     *
     * @param roleName
     * @return
     */
    boolean addRole(@Param("roleName") String roleName);


    /**
     * 判断是否当前角色存在权限
     * @param roleId
     * @return
     */
    int countRoleOfUser(@Param("roleId") int roleId);



    /**
     * 删除角色
     *
     * @param roleId
     * @return
     */
    boolean deleteRole(@Param("roleId") int roleId);

    /**
     * 删除用户角色
     * @param roleId
     * @return
     */
    boolean deleteRoleOfUser(@Param("roleId") int roleId);


    /**
     * 删除该角色的权限
     * @param roleId
     * @return
     */
    boolean deletePermissionOfRole(@Param("roleId") int roleId);


    /**
     * 修改角色名称
     * @param roleId
     * @param roleName
     * @return
     */
    boolean updateRole(@Param("roleId") int roleId,@Param("roleName") String roleName);

    /**
     * 获取所有角色
     * @return
     */
    List<RoleInfo> allRole();

}