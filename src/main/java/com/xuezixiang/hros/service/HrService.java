package com.xuezixiang.hros.service;

import com.xuezixiang.hros.mapper.HrMapper;
import com.xuezixiang.hros.mapper.HrRoleMapper;
import com.xuezixiang.hros.model.Hr;
import com.xuezixiang.hros.model.OpLog;
import com.xuezixiang.hros.service.utils.Hruitls;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

/**
 * @Description :

 * @Date: 2019/12/18 18:59
 */
@Transactional
@Service
public class HrService implements UserDetailsService {

    @Autowired
    HrMapper hrMapper;
    @Autowired
    HrRoleMapper hrRoleMapper;
    @Autowired
    OplogService oplogService;

    private static Logger Loggerlogger = Logger.getLogger("HrService");

    // 根据用户名加载user对象
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Hr hr = hrMapper.loadUserByUsername(username);
        if (hr == null) {
            throw new UsernameNotFoundException("用户名不存在");
        }
        hr.setRoles(hrMapper.getHrRolesById(hr.getId()));
        return hr;
    }

    public List<Hr> getAllHRs(String name) {
        return hrMapper.getAllHRs(Hruitls.getCurrent().getId(), name);
    }
    public Hr getBaseHr() {
        Hr hr = hrMapper.loadUserByEmployeeId(Hruitls.getCurrent().getEmployeeId());
        if (hr == null){
            hr = hrMapper.loadUserByUsername(Hruitls.getCurrent().getUsername());
        }
        return hr;
    }


    @Transactional
    public boolean updateHrRole(Integer hrid, Integer[] rids) {
        oplogService.addOpLog(new OpLog((byte) 8,new Date(),"操作员角色更新", Hruitls.getCurrent().getName()));
        Loggerlogger.warning("hrid:"+hrid + Arrays.toString(rids));
        int i = hrRoleMapper.deleteByHeId(hrid);
        if (rids == null || rids.length == 0) {
            return true;
        } else {
            return i >= 0 && hrRoleMapper.addHrRole(hrid, rids) == rids.length;
        }
    }

    public Integer updateHr(Hr hr) {
        oplogService.addOpLog(new OpLog((byte) 8, new Date(), "操作员信息更新:" + hr.getName(), Hruitls.getCurrent().getName()));
        return hrMapper.updateByPrimaryKeySelective(hr);
    }

    public Integer addHr(Hr hr) {
        oplogService.addOpLog(new OpLog((byte) 8, new Date(), "操作员信息更新:" + hr.getName(), Hruitls.getCurrent().getName()));
        hr.setPassword("$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm");
        if (StringUtils.isBlank(hr.getUserface())){
            hr.setUserface("https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg");
        }
        return hrMapper.insert(hr);
    }

    public Integer deleteHrById(Integer id) {
        oplogService.addOpLog(new OpLog((byte) 8, new Date(), "删除操作员: id=" + id, Hruitls.getCurrent().getName()));
        return hrMapper.deleteByPrimaryKey(id);
    }

    public List<Hr> getAllHrsExceptCurrentHr() {
        return hrMapper.getAllHrsExceptCurrentHr(Hruitls.getCurrent().getId());
    }
}
