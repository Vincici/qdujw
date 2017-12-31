package com.jw.services.impl;

import com.jw.mapper.RoleMapper;
import com.jw.pojo.RoleInfo;
import com.jw.services.RoleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author mioko
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    /**
     * 获取用户角色
     * @param userName
     * @return
     */
    @Override
    public RoleInfo getARole(String userName) {
        return roleMapper.getARole(userName);
    }

    /**
     * 添加角色
     * @param roleName
     * @return
     */
    @Override
    public boolean addRole(String roleName){
        return roleMapper.addRole(roleName);
    }

    /**
     * 删除角色
     * @param roleId
     * @return
     */

    @Override
    public boolean deleteRole(int roleId){
        return roleMapper.deleteRole(roleId);
    }


    /**
     * 判断是否当前角色存在权限
     * @param roleId
     * @return
     */

    @Override
    public int countRoleOfUser(@Param("roleId") int roleId){
        return roleMapper.countRoleOfUser(roleId);
    }


    /**
     * 删除用户角色
     * @param roleId
     * @return
     */
    @Override
    public boolean deleteRoleOfUser(int roleId){
        return roleMapper.deleteRoleOfUser(roleId);
    }



    /**
     * 删除用户角色
     * @param roleId
     * @return
     */
    @Override
    public boolean deletePermissionOfRole(int roleId){
        return roleMapper.deletePermissionOfRole(roleId);
    }

    /**
     * 修改角色名称
     * @param roleId
     * @return
     */
    @Override
    public boolean updateRole(int roleId, String roleName){
        return roleMapper.updateRole(roleId,roleName);
    }

    /**
     * 获取所有角色
     * @return
     */
    @Override
    public List<RoleInfo> allRole(){
        return roleMapper.allRole();
    }


}