package com.liuzx.mingxin.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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
		Random r = new Random();
		for(int i=0;i<10;i++){
			System.out.println(r.nextInt(5));
		}
		System.out.println(getMessageId());
	}
	public static int getRandomIndex(int start,int end){
		Random random = new Random();
		int len = end -start;
		if(len<1){
			return 1;
		}
		return start + random.nextInt(len);
	}
	public static String getEnterRoomMessage(String userName){
		Random random = new Random();
		int index = random.nextInt(6);
		String message = null;
		switch (index) {
		case 0:
			message = userName+" 来了,市场一扫之前的阴霾,欢呼雀跃,上蹿下跳...";
			break;
		case 1:
			message = userName+" 来了,带着财富秘籍前来和大家分享...";
			break;
		case 2:
			message = userName+" 来了,带来了市场的利好信息...";
			break;
		case 3:
			message = "只听咔擦一声,"+userName+"骑着一匹黑马从天而降...";
			break;
		case 4:
			message = userName+" 来了,市场一扫之前的阴霾,一路飘红...";
			break;
		case 5:
			message = "徘徊了好久,"+userName+" 鼓足勇气	推开了财富之门...";
			break;
		case 6:
			message = "三人行,必有我师,"+userName+"闪亮登场...";
			break;
		default:
			message = userName+" 来了,市场一扫之前的阴霾,欢呼雀跃,上蹿下跳...";
			break;
		}
		
		return message;
	}
}
