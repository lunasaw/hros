package com.xuezixiang.hros.mapper;

import com.xuezixiang.hros.model.EmpSalary;

public interface EmpSalaryMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByEmpId(Integer eid);


    int insert(EmpSalary record);

    int insertSelective(EmpSalary record);

    EmpSalary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmpSalary record);

    int updateByPrimaryKey(EmpSalary record);
}