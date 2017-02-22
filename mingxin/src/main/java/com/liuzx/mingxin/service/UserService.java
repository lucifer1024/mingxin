package com.liuzx.mingxin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.liuzx.mingxin.dao.UserMapper;
import com.liuzx.mingxin.domain.Page;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.email.SendMail;
import com.liuzx.mingxin.talk.TalkHandler;
import com.liuzx.mingxin.utils.CacheKeys;
import com.liuzx.mingxin.utils.MessageUtils;
import com.liuzx.mingxin.utils.UUIDGenerator;

@Service
public class UserService {
	private static Log logger = LogFactory.getLog(UserService.class);
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CacheService cacheService;
	@Autowired
	private SendMail sendMail;
	@Autowired
	private TalkHandler talkHandler;

	/*
	 * public JSONArray findOnlineUser() { List<HashMap<String,Object>> userList
	 * = getAllUserByOrder(); JSONArray array = new JSONArray(); for(int
	 * i=0;i<userList.size();i++){ HashMap<String,Object> userMap =
	 * userList.get(i); JSONObject obj = new JSONObject(); obj.put("SUserSNNO",
	 * UUIDGenerator.ouUid((String)userMap.get("uid"))); obj.put("NickName",
	 * (String)userMap.get("nick_name")); obj.put("QQ",
	 * (String)userMap.get("qq")); obj.put("IsQQ",
	 * (Integer)userMap.get("is_qq")); obj.put("RoleShowOrder",
	 * (Integer)userMap.get("roleOrder")); obj.put("ShowOrder",
	 * (Integer)userMap.get("user_order")); obj.put("RoleIconPath",
	 * (String)userMap.get("roleImgUrl")); obj.put("UserIconPath",
	 * "system/userDefault.jpg"); obj.put("SubscribeType",
	 * (Integer)userMap.get("is_subscribe")); obj.put("RoleColor", "#ffaf60");
	 * obj.put("IsHidden", 0); obj.put("SubscribeTeacherExpireDate",
	 * "0001-01-01T00:00:00"); array.add(obj); } return array; }
	 */

	// public JSONArray findOnlineUser() {
	// List<User> userList = findOnlineUser1();
	// JSONArray array = new JSONArray();
	// for(int i=0;i<userList.size();i++){
	// User user = userList.get(i);
	// JSONObject obj = new JSONObject();
	// obj.put("SUserSNNO", UUIDGenerator.ouUid(user.getUid()));
	// obj.put("NickName", user.getNickName());
	// obj.put("QQ", user.getQq());
	// obj.put("IsQQ", user.getIsQQ());
	// obj.put("RoleShowOrder", user.getRoleOrder());
	// obj.put("ShowOrder", user.getUserOrder());
	// obj.put("RoleIconPath", user.getRoleImgUrl());
	// obj.put("UserIconPath", "system/userDefault.jpg");
	// obj.put("SubscribeType", user.getIsSubscribe());
	// obj.put("RoleColor", "#ffaf60");
	// obj.put("IsHidden", 0);
	// obj.put("SubscribeTeacherExpireDate", "0001-01-01T00:00:00");
	// array.add(obj);
	// }
	//// {
	//// JSONObject obj = new JSONObject();
	//// obj.put("SUserSNNO", "");
	//// obj.put("NickName", "");
	//// obj.put("QQ", "");
	//// obj.put("RoleShowOrder", "");
	//// obj.put("ShowOrder", "");
	//// obj.put("RoleIconPath", "");
	//// obj.put("UserIconPath", "");
	//// obj.put("SubscribeType", "");
	//// obj.put("RoleColor", "");
	//// obj.put("IsHidden", "");
	//// obj.put("SubscribeTeacherExpireDate", "");
	//// array.add(obj);
	//// }
	// return array;
	// }
	private static int num = 0;
	// public List<User> findOnlineUser1() {
	// List<User> userList = new ArrayList<User>();
	// //查找数据库 以 roleOrder userOrder userName 升序排列
	// //test
	// for(int i=num;i<num+4;i++){
	// User user = new User();
	// user.setUid(UUIDGenerator.getUUID());
	// user.setNickName("王老师 "+i);
	// user.setRoleId(1);
	// user.setRoleName("赢油天下");
	// user.setRoleOrder(5);
	// user.setUserOrder(i);
	// user.setIsSubscribe(1);
	// user.setRoleImgUrl("/images/newrole/admin.png");
	// userList.add(user);
	// }
	// for(int i=num;i<num+4;i++){
	// User user = new User();
	// user.setUid(UUIDGenerator.getUUID());
	// user.setNickName("小 "+i);
	// user.setRoleId(2);
	// if(i%2 ==0 ){
	// user.setRoleName("分析助理");
	// }else{
	// user.setRoleName("投资顾问");
	// }
	// user.setRoleOrder(15);
	// user.setUserOrder(i);
	// user.setQq("8888888"+i);
	// user.setIsQQ(1);
	// user.setRoleImgUrl("/images/newrole/admin.png");
	// userList.add(user);
	// }
	// for(int i=num;i<num+4;i++){
	// User user = new User();
	// user.setUid(UUIDGenerator.getUUID());
	// user.setNickName("大地主 "+i);
	// user.setRoleId(2);
	// user.setRoleName("W");
	// user.setRoleOrder(20);
	// user.setUserOrder(i);
	// user.setRoleImgUrl("/images/newrole/vip.png");
	// userList.add(user);
	// }
	// num += 10;
	// return userList;
	// }

	public boolean insertUser(User user) {
		// 给user 生成uid
		// TODO password MD5 加密
		// TODO 分配销售人员 saleManId
		if (user.getUid() == null) {
			user.setUid(UUIDGenerator.getUUID());
		}
		// 注册用户
		user.setUserOrder(25);
		user.setRoleId(6);
		int result = userMapper.insertSelective(user);
		logger.info(" insert result=" + result);
		return true;
	}

	/**
	 * 检验用户登录信息
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	public User checkUser(String userName, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		// TODO 用户密码 做MD5 加密
		map.put("password", password);
		List<User> list = userMapper.selectSelective(map);
		User user = null;
		if (list != null && list.size() > 0) {
			user = list.get(0);
			user.setSaleMan(selectSaleMan());
		}
		//
		try {
			if (user == null) {
				// 判断是否 重置密码
				String tmpPw = cacheService.getString(CacheKeys.TMP_PW_KEY + userName);
				if (tmpPw != null && password.equals(tmpPw)) {
					// 删除缓存的临时密码
					cacheService.del(CacheKeys.TMP_PW_KEY + userName);
					// 重置密码验证成功 直接查询用户信息
					map = new HashMap<String, Object>();
					map.put("userName", userName);
					list = userMapper.selectSelective(map);
					user = null;
					if (list != null && list.size() > 0) {
						user = list.get(0);
						user.setSaleMan(selectSaleMan());
						user.setPassword(tmpPw);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public String checkUserName(String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		// TODO 用户密码 做MD5 加密
		List<User> list = userMapper.selectSelective(map);
		User user = null;
		String returnMsg = null;
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				user = list.get(i);
				if (user.getRoleId() == 7) {
					// 游客信息 不校验
					continue;
				}
				if (userName.equals(user.getUserName())) {
					returnMsg = "用户名已存在)";
				}
			}
		}
		return returnMsg;
	}

	public String checkUserNameAndIp(String userName, String registerIp) {
		Map<String, Object> map = new HashMap<String, Object>();
		// map.put("userName", userName);
		// TODO 用户密码 做MD5 加密
		map.put("registerIp", registerIp);
		List<User> list = userMapper.selectSelective(map);
		User user = null;
		String returnMsg = null;
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				user = list.get(i);
				if (user.getRoleId() == 7) {
					// 游客信息 不校验
					continue;
				}
				if (registerIp.equals(user.getRegisterIp())) {
					returnMsg = "同一个IP只能注册一个账号(您的IP:" + registerIp + ")";
				}
				if (userName.equals(user.getUserName())) {
					returnMsg = "用户名已存在)";
				}
			}
		}
		return returnMsg;
		// return null;
	}

	public String checkUserNameAndEmail(String userName, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("email", email);
		List<User> list = userMapper.selectSelective(map);
		String returnMsg = null;
		if (list == null || list.size() == 0) {
			returnMsg = "用户名或邮箱输入错误！";
		}
		return returnMsg;
	}

	public User checkGuestUser(String registerIp) {
		// 根据ip 查询游客信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("registerIp", registerIp);
		map.put("roleId", 7);
		map.put("userOrder", 999);

		List<User> list = userMapper.selectSelective(map);
		// List<User> list = null; //test
		User user = null;
		if (list != null && list.size() > 0) {
			user = list.get(0);
		} else {
			user = createGuestUser(registerIp);
			userMapper.insertSelective(user);
		}
		user.setSaleMan(selectSaleMan());
		return user;
	}

	private User createGuestUser(String registerIp) {
		int index = cacheService.getGuestNum() + 1;
		cacheService.putGuestNum(index);
		User user = new User();
		user.setUid(UUIDGenerator.getUUID());
		user.setNickName("游客 " + index);
		user.setUserName("游客 " + index);
		user.setPassword("");
		user.setRoleId(7);
		user.setUserOrder(999);
		user.setRegisterIp(registerIp);
		user.setSkinId("skin0");
		return user;
	}

	/*
	 * public List<HashMap<String,Object>> getAllUserByOrder(){
	 * Map<String,Object> map =new HashMap<String,Object>();
	 * List<HashMap<String,Object>> list = userMapper.selectByOrder(map); return
	 * list; }
	 */
	public JSONArray findUserByNickName(String nickName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (nickName != null) {
			map.put("nickName", nickName);
		}
		List<HashMap<String, Object>> list = userMapper.selectByOrder(map);
		return chang2JSON(list);
	}

	public JSONArray findUserLimit(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("pageSize", page.getPageSize());
		List<HashMap<String, Object>> list = userMapper.selectByOrderLimit(map);
		return chang2JSON(list);
	}

	public User findUserByUserControlId(String userControlId) {
		String uid = UUIDGenerator.unChUid(userControlId);
		return userMapper.selectByUid(uid);
	}

	public User findUserByUid(String uid) {
		User user = userMapper.selectByUid(uid);
		user.setSaleMan(selectSaleMan());
		return user;
	}

	public int updateUser(User user) {
		return userMapper.updateByUidSelective(user);
	}

	public int noTalkUser(String uid, int isNoTalking) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("isNoTalking", isNoTalking);
		return userMapper.updateByMap(map);
	}

	/**
	 * 随机一个获取助理
	 */
	public User selectSaleMan() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", 3); //
		List<User> userList = userMapper.selectSelective(map);
		if (userList != null && userList.size() > 0) {
			int index = MessageUtils.getRandomIndex(0, userList.size());
			return userList.get(index);
		}
		return null;
	}

	public String findPassword(String userName, String email) {
		// 随机生成密码 tmpPw
		String tmpPw = UUIDGenerator.getTmpPw();
		// 保存到 redis key tmp_pw_userName:tmpPw
		// 发送邮件
		try {
			sendMail.sendEmail(sendMail.createResetPwMail(tmpPw, email));
			cacheService.setStringEx(CacheKeys.TMP_PW_KEY + userName, CacheKeys.TMP_PW_EX, tmpPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO 重置数据库密码
		return null;
	}

	private JSONArray chang2JSON(List<HashMap<String, Object>> userList) {
		JSONArray array = new JSONArray();
		for (int i = 0; i < userList.size(); i++) {
			HashMap<String, Object> userMap = userList.get(i);
			Integer id = (Integer) userMap.get("id");
			String uid = (String) userMap.get("uid");
			if (id != null && id > 104) {
				if (!talkHandler.containsUid(uid)) {
					// 用户不在线
					continue;
				}
			}
			JSONObject obj = new JSONObject();
			obj.put("SUserSNNO", UUIDGenerator.ouUid(uid));
			obj.put("NickName", (String) userMap.get("nick_name"));
			obj.put("QQ", (String) userMap.get("qq"));
			obj.put("IsQQ", (Integer) userMap.get("is_qq"));
			obj.put("RoleShowOrder", (Integer) userMap.get("roleOrder"));
			obj.put("ShowOrder", (Integer) userMap.get("user_order"));
			obj.put("RoleIconPath", (String) userMap.get("roleImgUrl"));
			obj.put("UserIconPath", "system/userDefault.jpg");
			obj.put("SubscribeType", (Integer) userMap.get("is_subscribe"));
			obj.put("RoleColor", "#ffaf60");
			obj.put("IsHidden", 0);
			obj.put("SubscribeTeacherExpireDate", "0001-01-01T00:00:00");
			array.add(obj);
		}
		return array;
	}

}
