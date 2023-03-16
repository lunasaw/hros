package com.xuezixiang.hros.mapper;

import com.xuezixiang.hros.model.Hr;
import com.xuezixiang.hros.model.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface HrMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Hr record);

    int insertSelective(Hr record);

    Hr selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Hr record);

    int updateByPrimaryKey(Hr record);

    int updatePasswordByPrimaryKey(Hr record);

    int updateWorkDate(Hr record);

    /**
     * @return Hr
     * @Author xuezixiang
     * @Description 登录
     * @Date 19:06 2019/12/18
     * @Param [username]
     **/

    Hr loadUserByUsername(String username);

    Hr loadUserByEmployeeId(Integer employeeId);

    /**
     * @return java.util.List<Role>
     * @Author xuezixiang
     * @Description 获取当前用户的所用角色
     * @Date 23:23 2019/12/24
     * @Param [id]
     **/

    List<Role> getHrRolesById(Integer id);

    List<Hr> getAllHRs(@Param("id") Integer id, @Param("name") String name);


    List<Hr>  getAllHrsExceptCurrentHr(Integer id);
}