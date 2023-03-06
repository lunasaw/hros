package com.xuezixiang.hros.service;

import com.xuezixiang.hros.mapper.AppraiseMapper;
import com.xuezixiang.hros.model.Appraise;
import com.xuezixiang.hros.service.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description :

 * @Date: 2020/1/13 17:22
 */
@Service
public class AppraiseService {


    @Autowired
    AppraiseMapper appraiseMapper;
    @Autowired
    OplogService oplogService;

    public Integer addAppraise(Appraise appraise) {
        oplogService.addOpLog(LogUtils.addLog((byte) 10,"添加员工考评eid:" + appraise.getEid()));
        return appraiseMapper.insertSelective(appraise);
    }

    public Integer deleteAppraise(Integer eid, Integer id) {
        oplogService.addOpLog(LogUtils.addLog((byte) 10,"删除员工考评eid:" + eid));
        return appraiseMapper.deleteAppraise(eid, id);
    }

    public Integer updateAppraise(Appraise appraise) {
        oplogService.addOpLog(LogUtils.addLog((byte) 10,"更新员工考评eid:" + appraise.getEid()));
        return appraiseMapper.updateByPrimaryKeySelective(appraise);
    }

    public Integer addEmploteeaByPge(Appraise appraise, Integer[] ids) {
        oplogService.addOpLog(LogUtils.addLog((byte) 10,"批量添加员工考评" ));
        return appraiseMapper.addEmploteeaByPge(appraise, ids);
    }
}