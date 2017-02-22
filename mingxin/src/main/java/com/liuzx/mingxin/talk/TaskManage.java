package com.liuzx.mingxin.talk;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.liuzx.mingxin.service.CacheService;
import com.liuzx.mingxin.utils.CacheKeys;

public class TaskManage {
	public static void runTask(TalkHandler talk,CacheService cacheService){
		runNoticeTask( talk, cacheService);
	}
	private static void runNoticeTask(final TalkHandler talk,final CacheService cacheService){
		Runnable runnable = new Runnable() {  
            public void run() {  
            	try {
					int isChange = cacheService.getInteger(CacheKeys.NOTICE_CHANGE);
					if(isChange == 1){
						cacheService.putInteger(CacheKeys.NOTICE_CHANGE, 0);
						talk.noticeChange();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
            }  
        };  
        ScheduledExecutorService service = Executors  
                .newSingleThreadScheduledExecutor();  
        // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
        service.scheduleAtFixedRate(runnable, 2, 1, TimeUnit.MINUTES); 
	}
}
