package com.jw.mapper;

import com.jw.pojo.LogInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 日志管理
 * @author mioko
 */
@Repository(value = "LogMapper")

public interface LogMapper {

    /**
     * 添加日志
     * @param content
     * @param userName
     * @param time
     * @param status
     * @return
     */
    boolean addLog(@Param("content") String content, @Param("userName") String userName, @Param("time") String time, @Param("status") String status);


    /**
     * 删除日志
     *
     * @param id
     * @return
     */
    boolean deleteRole(@Param("id") int id);


    /**
     * 获取所有日志
     * @return
     */
    List<LogInfo> allLog();

}
