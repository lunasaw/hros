package com.xuezixiang.hros.service;

import com.xuezixiang.hros.model.datas.DataModelT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @Description :
 * @Date: 2023/1/6 20:26
 */
@Service
public class DataModelTService {

    @Autowired
    EmployeeService employeeService;


    public List<DataModelT> dataViewDepartment() {
       return employeeService.DataViewDepartmentT();

    }

    public List<DataModelT> dataViewWorkAge() {
        return employeeService.dataViewWorkAge();
    }

    public List<DataModelT> dataViewJobLevelT() {
        return employeeService.dataViewJobLevelTAge();
    }




}
