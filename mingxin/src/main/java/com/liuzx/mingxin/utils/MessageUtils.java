package com.liuzx.mingxin.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 生成mssageId
 * @author liuzx
 *
 */
public class MessageUtils {
	static int num = 1;
	public static String getMessageId(){
		return getDate()+num++;
	}
	private static String getDate(){
		return "1701131519";
	}
	private static SimpleDateFormat timeFormate = new SimpleDateFormat("HH:mm:ss");
	public static String getMessageTime(){
		String time = timeFormate.format(new Date());
		System.out.println(time);
		return time;
	}
	
	public static void main(String[] args) {
		 getMessageTime();
	}
}
