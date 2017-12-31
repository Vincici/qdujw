package com.jw.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author mioko
 */
@Repository(value = "PermissionMapper")

public interface PermissionMapper {



    /**
     * 一级菜单
     * @param roleId
     * @return
     */
    List getPermissionMenu(@Param("roleId") int roleId);

    /**
     * 所有菜单
     * @return
     */
    List getAllPermissionMenu();

}
