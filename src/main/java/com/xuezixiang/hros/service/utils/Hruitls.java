package com.xuezixiang.hros.service.utils;

import com.xuezixiang.hros.model.Hr;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @Description :
 * @Date: 2022/12/29 20:21
 */
public class Hruitls {
    public static Hr getCurrent(){
        return (Hr) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    }
}
