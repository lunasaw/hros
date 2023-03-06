package com.xuezixiang.hros.mapper;

import com.xuezixiang.hros.model.Employee;
import com.xuezixiang.hros.model.EmployeeRecycle;
import com.xuezixiang.hros.model.datas.DataModel;
import com.xuezixiang.hros.model.datas.DataModels;

import java.util.List;

public interface EmployeeRecycleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeRecycle record);

    int insertSelective(Employee record);

    List<EmployeeRecycle> selectByPrimaryKey( );

    int updateByPrimaryKeySelective(EmployeeRecycle record);

    int updateByPrimaryKey(EmployeeRecycle record);

    List<DataModel>  dataViewDepartment();

    List<DataModels>  dataViewPosition();

    List<DataModels>  dataViewJobLevelT();
}