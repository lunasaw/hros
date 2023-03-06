package com.xuezixiang.hros.controller.system.basic;


import com.xuezixiang.hros.model.Position;
import com.xuezixiang.hros.model.RespBean;
import com.xuezixiang.hros.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author xuezixiang
 * @Description 职位
 * @Date 15:01 2019/12/25
 * @Param
 * @return
 **/

@RestController
@RequestMapping("/system/basic/pos")
public class PositionController {
    @Autowired
    PositionService positionService;

    /**
     * @Author xuezixiang
     * @Description 返回显示信息
     * @Date 15:29 2019/12/25
     * @Param []
     * @return java.util.List<Position>
     **/

    @GetMapping("/")
    public List<Position> getAllPositions() {
        return positionService.getAllPositions();
    }

    /**
     * @Author xuezixiang
     * @Description 添加
     * @Date 15:29 2019/12/25
     * @Param [position]
     * @return RespBean
     **/

    @PostMapping("/")
    public RespBean addPosition(@RequestBody Position position) {
        if (positionService.addPosition(position) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    /**
     * @Author xuezixiang
     * @Description 更新
     * @Date 15:29 2019/12/25
     * @Param [position]
     * @return RespBean
     **/
    @PutMapping("/")
    public RespBean updatePositions(@RequestBody Position position) {
        if (positionService.updatePositions(position) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @PostMapping("/serch/")
    public List<Position> serchPositions(@RequestBody Position position){
        return  positionService.serchPositions(position);

    }
    /**
     * @Author xuezixiang
     * @Description 删除
     * @Date 15:29 2019/12/25
     * @Param [id]
     * @return RespBean
     **/

    @DeleteMapping("/{id}")
    public RespBean deletePositionById(@PathVariable Integer id) {
        if (positionService.deletePositionById(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

    /**
     * @Author xuezixiang
     * @Description 批量删除
     * @Date 15:30 2019/12/25
     * @Param [ids]
     * @return RespBean
     **/

    @DeleteMapping("/")
    public RespBean deletePositionsByIds(Integer[] ids) {
        if (positionService.deletePositionsByIds(ids) == ids.length) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }
}
