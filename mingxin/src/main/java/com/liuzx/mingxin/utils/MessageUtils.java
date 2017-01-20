package com.liuzx.mingxin.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 生成mssageId
 * 
 * @author liuzx
 *
 */
public class MessageUtils {
	static int num = 0;
	// li00000000VH84
	public static String getMessageId(){
		return getNum()+UUIDGenerator.getStringRandom(4);
	}

	private static String pattern = "00000000";

	private static String getNum() {
		num++;
		java.text.DecimalFormat df = new java.text.DecimalFormat(pattern);
		return df.format(num);
	}

	private static SimpleDateFormat timeFormate = new SimpleDateFormat("HH:mm:ss");

	public static String getMessageTime() {
		String time = timeFormate.format(new Date());
		System.out.println(time);
		return time;
	}

	public static void main(String[] args) {
		System.out.println(getMessageId());
	}
}
