package com.xuezixiang.hros.service;

import com.xuezixiang.hros.mapper.EmployeeRecycleMapper;
import com.xuezixiang.hros.model.Employee;
import com.xuezixiang.hros.model.EmployeeRecycle;
import com.xuezixiang.hros.model.datas.DataModel;
import com.xuezixiang.hros.model.datas.DataModels;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description :

 * @Date: 2020/1/6 16:45
 */
@Service
public class EmployeeRecycleService {

    @Autowired
    EmployeeRecycleMapper employeeRecycleMapper;


    public void addEmployeeRecycle(Employee employee){
        employeeRecycleMapper.insertSelective(employee);

    }

    public List<EmployeeRecycle> getAllEmployeeRecycle() {
        return employeeRecycleMapper.selectByPrimaryKey();
    }

    public List<DataModel> dataViewDepartment() {
        return employeeRecycleMapper.dataViewDepartment();
    }

    public List<DataModels> dataViewPosition() {
        return employeeRecycleMapper.dataViewPosition();
    }

    public List<DataModels> dataViewJobLevelT() {
        return employeeRecycleMapper.dataViewJobLevelT();
    }
}
