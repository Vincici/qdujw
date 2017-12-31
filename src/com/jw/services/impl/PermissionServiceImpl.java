package com.jw.services.impl;

import com.jw.mapper.PermissionMapper;
import com.jw.pojo.PermissionInfo;
import com.jw.services.PermissionService;
import com.jw.services.PermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author mioko
 */
@Service("PermissionService")
public class PermissionServiceImpl implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public List getPermissionMenu(int roleId) {
        return permissionMapper.getPermissionMenu(roleId);
    }

    @Override
    public List getAllPermissionMenu(){
        return  permissionMapper.getAllPermissionMenu();
    }

}