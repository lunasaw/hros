package com.xuezixiang.hros.controller.system;

import com.xuezixiang.hros.model.Hr;
import com.xuezixiang.hros.model.RespBean;
import com.xuezixiang.hros.model.Role;
import com.xuezixiang.hros.service.HrService;
import com.xuezixiang.hros.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

/**
 * @Description :

 * @Date: 2019/12/29 20:14
 */
@RequestMapping("/system/hr")
@RestController
public class HrController {

    @Autowired
    HrService hrService;
    @Autowired
    RoleService roleService;

    @GetMapping("/")
    public List<Hr> getAllHRs(String name) {
        return hrService.getAllHRs(name);

    }

    @GetMapping("/base")
    public List<Hr> getBaseHr() {
        return Collections.singletonList(hrService.getBaseHr());

    }

    @PostMapping("/add")
    public RespBean addHr(@RequestBody Hr hr) {
        if (hrService.addHr(hr) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @PutMapping("/")
    public RespBean updateHr(@RequestBody Hr hr) {
        if (hrService.updateHr(hr) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @GetMapping("/roles")
    public List<Role> getAllRoles() {
        return roleService.getAllRoles();
    }

    @PutMapping("/role")
    public RespBean updateHrRole(Integer hrid, Integer[] rids) {
        if (hrService.updateHrRole(hrid, rids)) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @DeleteMapping("/{id}")
    public RespBean deleteHrById(@PathVariable Integer id) {
        if (hrService.deleteHrById(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

}


