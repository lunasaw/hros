package com.xuezixiang.hros.mapper;

import com.xuezixiang.hros.model.Employeeremove;

public interface EmployeeremoveMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByEmpId(Integer eid);


    int insert(Employeeremove record);

    int insertSelective(Employeeremove record);

    Employeeremove selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Employeeremove record);

    int updateByPrimaryKey(Employeeremove record);
}