package com.xuezixiang.hros.service;

import com.xuezixiang.hros.mapper.EmployeeecMapper;
import com.xuezixiang.hros.model.Employeeec;
import com.xuezixiang.hros.service.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;

/**
 * @Description :
 * @Date: 2023/1/8 20:26
 */
@Service
public class EmployeeecService {

    @Autowired
    EmployeeecMapper employeeecMapper;

    @Autowired
    OplogService oplogService;
    public Integer addEmployeeec(Employeeec employeeec, Integer[] ids) {
        employeeec.setEcdate(new Date());
        oplogService.addOpLog(LogUtils.addLog((byte) 3,"员工奖惩添加:eid="+ employeeec.getEid()+"--ids:"+ Arrays.toString(ids)));
      return   employeeecMapper.insertSelectives(employeeec,  ids);


    }

    public Integer deleteEmpByEidc(Integer eid, Integer id) {
        oplogService.addOpLog(LogUtils.addLog((byte) 3,"员工奖惩删除:eid="+ eid+"--id:"+ id));
        return employeeecMapper.deleteEmpByEidc(eid, id);
    }
}
