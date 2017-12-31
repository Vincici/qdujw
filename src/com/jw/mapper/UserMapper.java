package com.jw.mapper;

import com.jw.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @author mioko
 */
@Repository(value = "UserMapper")

public interface UserMapper {

    /**
     * 用户登录
     *
     * @param userName
     * @param password
     * @return
     */
    UserInfo login(@Param("userName") String userName, @Param("password") String password);

    /**
     * 根据用户名查询用户信息
     *
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
