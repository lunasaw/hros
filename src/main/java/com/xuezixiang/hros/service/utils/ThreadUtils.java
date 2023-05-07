package com.xuezixiang.hros.service.utils;

import com.xuezixiang.hros.model.EmailModel;

import java.util.concurrent.*;

/**
 * @Description :线程池工具类
 * @Date: 2023/2/19 12:29
 */
public class ThreadUtils {
    //邮件发送线程池
    private static ThreadPoolExecutor threadPoolExecutor =
            new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60L, TimeUnit.MILLISECONDS, new SynchronousQueue<Runnable>());



    // 构建一个邮件发送的线程
    public static Thread getThtead(EmailModel emailModel) {
        return new Thread(() -> EmailUtils.sendGEmail(emailModel));
    }

    /**
     * @return void
     * @Author xuezixiang
     * @Description 构造一个有缓冲功能的线程池
     * @Date 18:14 2023/2/19
     * @Param [thread]
     **/
    public static void getCachedThreadPool(Thread thread) {
       Executors.newCachedThreadPool().execute(thread);
    }

    /**
     * @return void
     * @Author xuezixiang
     * @Description 构造一个固定线程数目的线程池
     * @Date 18:21 2023/2/19
     * @Param [thread]
     **/
    public static void getFixedThreadPool(Thread thread,Integer size){
        Executors.newFixedThreadPool(size).execute(thread);
    }




    public static void getThreadPoolExecutor(EmailModel emailModel){
          ThreadUtils.threadPoolExecutor.execute(getThtead(emailModel));
    }


}
