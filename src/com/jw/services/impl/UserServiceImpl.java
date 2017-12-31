package com.jw.services.impl;

import com.jw.mapper.UserMapper;
import com.jw.pojo.UserInfo;
import com.jw.services.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author mioko
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public UserInfo login(String userName, String password) {
        return userMapper.login(userName, password);
    }


    @Override
    public UserInfo getUserByUserName(String userName) {
        return userMapper.getUserByUserName(userName);
    }



    @Override
    public boolean modifyPassword(String userName,String password) {
        return userMapper.modifyPassword(userName,password);
    }


}