package com.liuzx.mingxin.service;

import java.io.UnsupportedEncodingException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liuzx.mingxin.utils.CacheKeys;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class CacheService {
	@Autowired
	private JedisPool jedisPool;

	public Jedis jedis;

	@PostConstruct
	public void init() {
		try {
			System.out.println("正在执行初始化的init方法");
			jedis = jedisPool.getResource();
		} catch (Exception e) {
			e.printStackTrace();
			if (null != jedis)
				jedis.close();
		}
	}

	@PreDestroy
	public void destroy() {
		if (jedis != null && jedis.isConnected()) {
			jedis.close();
		}
	}

	public String putString(String key, String value) {
		if (key == null || "".equals(key)) {
			return null;
		}
		return jedis.set(key, value);
	}
	public String getString(String key) {
		return jedis.get(key);
	}

	public Integer getInteger(String key) {
		String value = jedis.get(key);
		int num = 0;
		if (value != null) {
			num = Integer.parseInt(value);
		}
		return num;
	}

	public String putInteger(String key, Integer value) {
		if (key == null || "".equals(key)) {
			return null;
		}
		return jedis.set(key, String.valueOf(value));

	}
	
	
	public int getGuestNum(){
		String key = CacheKeys.guestNumKey;
		Integer num = getInteger(key);
		if(num == null || num <= 1000){
			num = 1000;
		}
		return num;
	}
	public void putGuestNum(Integer num){
		String key = CacheKeys.guestNumKey;
		if(num == null || num <= 1000){
			num = 1000;
		}
		putInteger(key, num);
	} 

}
