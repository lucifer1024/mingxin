package com.liuzx.mingxin.utils;

import java.util.Random;
import java.util.UUID;

public class UUIDGenerator {
	public static void main(String[] args) {
		String s = UUID.randomUUID().toString();
		System.out.println(s);
		System.out.println(getStringRandom(8)); 
	}

	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	public static String ouUid(String uid){
		return "ou"+uid+getStringRandom(3);
	}
	public static String chUid(String uid){
		return "ch"+uid+getStringRandom(3);
	}
	/**
	 * 
	 * @param chuid  lnkUser_chab45bfe3-af07-4ad8-9215-0a4c84ab3e37vo5
	 * @return ab45bfe3-af07-4ad8-9215-0a4c84ab3e37
	 */
	public static String unChUid(String chuid){
//		lnkUser_ouaf804f68-9ccb-438d-afed-c7679d6304ca
		chuid = chuid.replace("lnkUser_ch", "");
		chuid = chuid.replace("lnkUser_ou", "");
		chuid = chuid.substring(0,chuid.length()-3);
		return chuid;
	}
	public static String getStringRandom(int length) {  
        
        String val = "";  
        Random random = new Random();  
          
        //参数length，表示生成几位随机数  
        for(int i = 0; i < length; i++) {  
              
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";  
            //输出字母还是数字  
            if( "char".equalsIgnoreCase(charOrNum) ) {  
                //输出是大写字母还是小写字母  
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;  
                val += (char)(random.nextInt(26) + temp);  
            } else if( "num".equalsIgnoreCase(charOrNum) ) {  
                val += String.valueOf(random.nextInt(10));  
            }  
        }  
        return val;  
    }  
	/**
	 * 获取用户随机临时密码 用于重置密码 有效时间 30分钟
	 * @return
	 */
	public static String getTmpPw(){
		return getStringRandom(6);
	}
}
