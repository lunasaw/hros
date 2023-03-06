package com.xuezixiang.hros.mapper;

import com.xuezixiang.hros.model.LogType;

import java.util.List;

public interface LogTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LogType record);

    int insertSelective(LogType record);

    List<LogType> selectByPrimaryKey();

    int updateByPrimaryKeySelective(LogType record);

    int updateByPrimaryKey(LogType record);
}