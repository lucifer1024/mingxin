package com.liuzx.mingxin.utils;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class CourseTimeUtils {
	private static Log logger = LogFactory.getLog(TextWebSocketHandler.class);
	private static Map<String, Integer> courserTime = new HashMap<String, Integer>();
	private static Map<String, Long> calculateCourserTime = new HashMap<String, Long>();
	private static int currentDay = -1;
	public static int initTime = 120;

	public static int getCourseTime(String uid) {
		Calendar c = Calendar.getInstance();
		int dayOfMonth = c.get(Calendar.DAY_OF_MONTH);
		if(dayOfMonth!= currentDay){
			//新的一天 清除
			courserTime.clear();
			calculateCourserTime.clear();
			currentDay = dayOfMonth;
		}
		Integer time = courserTime.get(uid);
		if (time == null) {
			time = initTime;
			courserTime.put(uid, time);
		}
		return time;
	}

	// private static void updateCourseTime(String uid,Integer time){
	// courserTime.put(uid, time);
	// }

	// 开始计费
	public static void startCalculateCourserTime(String uid) {
		long start = System.currentTimeMillis() / (60 * 1000); // 单位分钟
		logger.info(" 开始计时 uid=" + uid);
		calculateCourserTime.put(uid, start);
	}

	public static void stopCalculateCourserTime(String uid) {
		if (!calculateCourserTime.containsKey(uid)) {
			return;
		}
		long end = System.currentTimeMillis() / (60 * 1000); // 单位分钟
		logger.info(" 停止计时  uid=" + uid);
		long start = calculateCourserTime.remove(uid);
		long costTime = end - start;
		int time = courserTime.get(uid);
		int newTime = (int) (time - costTime);
		if (newTime < 0) {
			newTime = 0;
		}
		courserTime.put(uid, newTime);
	}
}
