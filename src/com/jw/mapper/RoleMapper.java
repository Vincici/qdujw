package com.jw.mapper;

import com.jw.pojo.RoleInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author mioko
 */
@Repository(value = "RoleMapper")

public interface RoleMapper {


    /**
     * 获取用户角色
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
