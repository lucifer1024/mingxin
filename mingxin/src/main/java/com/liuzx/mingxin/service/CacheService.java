package com.liuzx.mingxin.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liuzx.mingxin.utils.CacheKeys;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class CacheService {
	@Autowired
	private JedisPool jedisPool;

	/*public Jedis jedis;

	@PostConstruct
	public void init() {
		try {
			jedis = jedisPool.getResource();
		} catch (Exception e) {
			e.printStackTrace();
			if (null != jedis)
				jedis.close();
		}
	}*/

	public Jedis getJedis() {
		try {
			return jedisPool.getResource();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

/*	@PreDestroy
	public void destroy() {
		try {
			if (jedis != null && jedis.isConnected()) {
				jedisPool.returnResource(jedis);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

	public String putString(String key, String value) {
		Jedis jedis = getJedis();
		try {
			if (key == null || "".equals(key)) {
				return null;
			}
			return jedis.set(key, value);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (jedis != null && jedis.isConnected()) {
				jedisPool.returnResource(jedis);
			}
		}
	}

	public String getString(String key) {
		Jedis jedis = getJedis();
		try {
			return jedis.get(key);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		} finally {
			if (jedis != null && jedis.isConnected()) {
				jedisPool.returnResource(jedis);
			}
		}
	}

	public Integer getInteger(String key) {
		Jedis jedis = getJedis();
		try {
			String value = jedis.get(key);
			int num = 0;
			if (value != null) {
				num = Integer.parseInt(value);
			}
			return num;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (jedis != null && jedis.isConnected()) {
				jedisPool.returnResource(jedis);
			}
		}
	}

	public String putInteger(String key, Integer value) {
		Jedis jedis = getJedis();
		try {
			if (key == null || "".equals(key)) {
				return null;
			}
			return jedis.set(key, String.valueOf(value));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (jedis != null && jedis.isConnected()) {
				jedisPool.returnResource(jedis);
			}
		}

	}

	public String setStringEx(String key, Integer seconds, String value) {
		Jedis jedis = getJedis();
		try {
			if (key == null || "".equals(key)) {
				return null;
			}
			return jedis.setex(key, seconds, String.valueOf(value));
		} catch (Exception e) {
			e.printStackTrace();
			return value;
		} finally {
			if (jedis != null && jedis.isConnected()) {
				jedisPool.returnResource(jedis);
			}
		}

	}

	public int getGuestNum() {
		try {
			String key = CacheKeys.guestNumKey;
			Integer num = getInteger(key);
			if (num == null || num <= 1000) {
				num = 1000;
			}
			return num;
		} catch (Exception e) {
			e.printStackTrace();
			return 1000;
		} finally {
		}
	}

	public void putGuestNum(Integer num) {

		try {
			String key = CacheKeys.guestNumKey;
			if (num == null || num <= 1000) {
				num = 1000;
			}
			putInteger(key, num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void del(String key) {
		Jedis jedis = getJedis();
		try {
			jedis.del(key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (jedis != null && jedis.isConnected()) {
				jedisPool.returnResource(jedis);
			}
		}
	}

}
