package com.xuezixiang.hros.mapper;

import com.xuezixiang.hros.model.Employeetrain;
import org.apache.ibatis.annotations.Param;

public interface EmployeetrainMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Employeetrain record);

    int insertSelective(Employeetrain record);

    Employeetrain selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Employeetrain record);

    int updateByPrimaryKey(Employeetrain record);

    Integer deleteByEmployeetrain(@Param("eid") Integer eid, @Param("id") Integer id);

    Integer deleteByEmploy(@Param("eid") Integer eid);


    Integer addEmploteetByPge(@Param("emp") Employeetrain employeetrain, @Param("ids") Integer[] ids);
}