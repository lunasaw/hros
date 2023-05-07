package com.xuezixiang.hros.service;

import com.xuezixiang.hros.mapper.EmployeeremoveMapper;
import com.xuezixiang.hros.model.Employeeremove;
import com.xuezixiang.hros.service.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description :
 * @Date: 2023/1/14 16:40
 */
@Service
@Transactional
public class EmployeeremoveService {

    @Autowired
    EmployeeremoveMapper employeeremoveMapper;
    @Autowired
    OplogService oplogService;
    public Integer addEmploymove(Employeeremove employeeremove) {
       oplogService.addOpLog(LogUtils.addLog((byte) 6,"员工调动:eid="+employeeremove.getEid()));
       return employeeremoveMapper.insertSelective(employeeremove);
    }
}
