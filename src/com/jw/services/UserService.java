package com.jw.services;

import com.jw.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;

/**
 * @author mioko
 */
public interface UserService {

    /**
     * 登录
     * @param userName
     * @param password
     * @return
     */
    UserInfo login(@Param("userName") String userName, @Param("password") String password);

    /**
     * 根据userName查询用户信息
     * @param userName
     * @return
     */
    UserInfo getUserByUserName(@Param("userName") String userName);


    /**
     * 修改密码
     * @param userName
     * @param password
     * @return
     */
    boolean modifyPassword(@Param("userName") String userName,@Param("password") String password);
}