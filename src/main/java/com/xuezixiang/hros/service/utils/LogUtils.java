package com.xuezixiang.hros.service.utils;

import com.xuezixiang.hros.model.OpLog;

import java.util.Date;

/**
 * @Description :
 * @Date: 2023/1/6 17:38
 */
public class LogUtils {

    public static OpLog addLog(Byte type, String msg){
        return new OpLog(type,new Date(),msg,Hruitls.getCurrent().getName() );
    }
}
