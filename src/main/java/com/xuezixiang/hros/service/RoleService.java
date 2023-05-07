package com.xuezixiang.hros.service;


import com.xuezixiang.hros.mapper.HrRoleMapper;
import com.xuezixiang.hros.mapper.MenuRoleMapper;
import com.xuezixiang.hros.mapper.RoleMapper;
import com.xuezixiang.hros.model.OpLog;
import com.xuezixiang.hros.model.Role;
import com.xuezixiang.hros.service.utils.Hruitls;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author xuezixiang
 * @Description
 * @Date 17:37 2022/12/26
 * @Param
 * @return
 **/
@Transactional
@Service
public class RoleService {
    @Autowired
    RoleMapper roleMapper;
    @Autowired
    OplogService oplogService;
    @Autowired
    HrRoleMapper hrRoleMapper;

    @Autowired
    MenuRoleMapper menuRoleMapper;


    /**
     * @return java.util.List<Role>
     * @Author xuezixiang
     * @Description 数据初始化
     * @Date 20:42 2019/12/26
     * @Param []
     **/

    public List<Role> getAllRoles() {
        return roleMapper.getAllRoles();
    }

    /**
     * @Author xuezixiang
     * @Description 添加角色权限
     * @Date 20:42 2019/12/26
     * @Param [role]
     * @return java.lang.Integer
     **/

    public Integer addRole(Role role) {
        if (!role.getName().startsWith("ROLE_")) {
            role.setName("ROLE_" + role.getName());
        }
        oplogService.addOpLog(new OpLog((byte) 1,new Date(),"添加角色: " + role.getName(), Hruitls.getCurrent().getName()));
        return roleMapper.insert(role);
    }

    /**
     * @Author xuezixiang
     * @Description 删除角色
     * @Date 20:43 2019/12/26
     * @Param [rid]
     * @return java.lang.Integer
     **/

    public Integer deleteRoleById(Integer rid) {
        oplogService.addOpLog(new OpLog((byte) 1, new Date(), "删除角色: id = " + rid, Hruitls.getCurrent().getName()));
        menuRoleMapper.deleteByRid(rid);
        hrRoleMapper.deleteByRoleId(rid);
        return roleMapper.deleteByPrimaryKey(rid);
    }
}
