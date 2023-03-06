package com.xuezixiang.hros.service;


import com.xuezixiang.hros.mapper.SalaryMapper;
import com.xuezixiang.hros.model.OpLog;
import com.xuezixiang.hros.model.Salary;
import com.xuezixiang.hros.service.utils.Hruitls;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Transactional
@Service
public class SalaryService {
    @Autowired
    SalaryMapper salaryMapper;
    @Autowired
    OplogService oplogService;

    public List<Salary> getAllSalaries() {
        return salaryMapper.getAllSalaries();
    }

    public Integer addSalary(Salary salary) {
        oplogService.addOpLog(new OpLog((byte) 5, new Date(), "添加套账:name=" +salary.getName(), Hruitls.getCurrent().getName()));
        salary.setCreatedate(new Date());
        salary.setAllsalary( salary.getBasicsalary() + salary.getBonus() + salary.getLunchsalary() + salary.getTrafficsalary() + salary.getPensionbase() );
        return salaryMapper.insertSelective(salary);
    }

    public Integer deleteSalaryById(Integer id) {
        oplogService.addOpLog(new OpLog((byte) 5, new Date(), "删除套账:id=" +id , Hruitls.getCurrent().getName()));
        return salaryMapper.deleteByPrimaryKey(id);
    }

    public Integer updateSalaryById(Salary salary) {
        salary.setAllsalary( salary.getBasicsalary() + salary.getBonus() + salary.getLunchsalary() + salary.getTrafficsalary() + salary.getPensionbase() );
        oplogService.addOpLog(new OpLog((byte) 5, new Date(), "更新套账:" + salary.getName(), Hruitls.getCurrent().getName()));

        return salaryMapper.updateByPrimaryKeySelective(salary);
    }
}
