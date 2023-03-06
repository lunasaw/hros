package com.xuezixiang.hros.controller.salary;

import com.xuezixiang.hros.model.Employee;
import com.xuezixiang.hros.model.RespPageBean;
import com.xuezixiang.hros.service.EmployeeService;
import com.xuezixiang.hros.service.utils.POIUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * @Description :

 * @Date: 2020/1/15 9:48
 */
@RestController
@RequestMapping("/salary/table")
public class SalartTableController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/")
    public RespPageBean getAllsalarts(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, Employee employee, Date[] beginDateScope) {
        return employeeService.getAllsalarts(page, size, employee, beginDateScope);
    }

    @GetMapping("/export")
    public ResponseEntity<byte[]> export() {
        List<Employee> list = (List<Employee>) employeeService.getEmploteeByPge(null, null, null, null).getData();
        return POIUtils.employeeSalary2Excel(list);
    }
}
