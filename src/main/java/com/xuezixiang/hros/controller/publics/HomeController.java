package com.xuezixiang.hros.controller.publics;

import com.xuezixiang.hros.model.MainNorice;
import com.xuezixiang.hros.model.OpLog;
import com.xuezixiang.hros.service.MainNoriceService;
import com.xuezixiang.hros.service.OplogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Description :
 */
@RestController
public class HomeController {

    @Autowired
    MainNoriceService mainNoriceService;
    @Autowired
    OplogService oplogService;

    @GetMapping("/body")
    @Scheduled(cron = "0 0 3 * * ?")
    public List<MainNorice> getAllsMainNoricebody(){
        return mainNoriceService.getAllsMainNoricebody();
    }

    @GetMapping("/log")
    @Scheduled(cron = "0 0 3 * * ?")
    public List<OpLog> getAllsOplog(){
        return oplogService.getAllsOplogm();
    }



}
