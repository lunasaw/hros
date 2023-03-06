package com.xuezixiang.hros.controller.system;

import com.xuezixiang.hros.model.LogType;
import com.xuezixiang.hros.model.RespPageBean;
import com.xuezixiang.hros.service.LogTypeService;
import com.xuezixiang.hros.service.OplogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * @Description :

 * @Date: 2020/1/5 22:06
 */
@RestController
@RequestMapping("/system/log")
public class OplogController {

    @Autowired
    OplogService oplogService;

    @Autowired
    LogTypeService logTypeService;


    @GetMapping("/")
    public RespPageBean getAllsOplog(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "13") Integer size, Integer logtype, Date[] beginDateScope ){
        return  oplogService.getAllsOplog(page, size, logtype,beginDateScope );
    }


    @GetMapping("/logtype")
    public List<LogType> getAllsLogtype(){
        return logTypeService.getAllsLogtype();
    }
}
