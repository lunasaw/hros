package com.xuezixiang.hros.service;

import com.xuezixiang.hros.mapper.LogTypeMapper;
import com.xuezixiang.hros.model.LogType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description :
 * @Date: 2023/1/5 22:20
 */
@Service
public class LogTypeService {

    @Autowired
    LogTypeMapper logTypeMapper;


    public List<LogType> getAllsLogtype() {
        return logTypeMapper.selectByPrimaryKey();
    }
}
