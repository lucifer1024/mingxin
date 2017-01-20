package com.liuzx.mingxin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.liuzx.mingxin.dao.UserMapper;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.utils.UUIDGenerator;

@Service
public class UserService {
	private static Log logger = LogFactory.getLog(UserService.class);
	@Autowired
	private UserMapper userMapper;
	
	public static int guestNum = 1000;
	
	public JSONArray findOnlineUser() {
		List<HashMap<String,Object>> userList = getAllUserByOrder();
		JSONArray array = new JSONArray();
		for(int i=0;i<userList.size();i++){
			HashMap<String,Object> userMap = userList.get(i);
			JSONObject obj = new JSONObject();
			obj.put("SUserSNNO", UUIDGenerator.ouUid((String)userMap.get("uid")));
			obj.put("NickName", (String)userMap.get("nick_name"));
			obj.put("QQ", (String)userMap.get("qq"));
			obj.put("IsQQ", (Integer)userMap.get("is_qq"));
			obj.put("RoleShowOrder", (Integer)userMap.get("roleOrder"));
			obj.put("ShowOrder", (Integer)userMap.get("user_order"));
			obj.put("RoleIconPath", (String)userMap.get("roleImgUrl"));
			obj.put("UserIconPath", "system/userDefault.jpg");
			obj.put("SubscribeType", (Integer)userMap.get("is_subscribe"));
			obj.put("RoleColor", "#ffaf60");
			obj.put("IsHidden", 0);
			obj.put("SubscribeTeacherExpireDate", "0001-01-01T00:00:00");
			array.add(obj);
		}
		return array;
	}
	
//	public JSONArray findOnlineUser() {
//		List<User> userList = findOnlineUser1(); 
//		JSONArray array = new JSONArray();
//		for(int i=0;i<userList.size();i++){
//			User user = userList.get(i);
//			JSONObject obj = new JSONObject();
//			obj.put("SUserSNNO", UUIDGenerator.ouUid(user.getUid()));
//			obj.put("NickName", user.getNickName());
//			obj.put("QQ", user.getQq());
//			obj.put("IsQQ", user.getIsQQ());
//			obj.put("RoleShowOrder", user.getRoleOrder());
//			obj.put("ShowOrder", user.getUserOrder());
//			obj.put("RoleIconPath", user.getRoleImgUrl());
//			obj.put("UserIconPath", "system/userDefault.jpg");
//			obj.put("SubscribeType", user.getIsSubscribe());
//			obj.put("RoleColor", "#ffaf60");
//			obj.put("IsHidden", 0);
//			obj.put("SubscribeTeacherExpireDate", "0001-01-01T00:00:00");
//			array.add(obj);
//		}
////		{
////			JSONObject obj = new JSONObject();
////			obj.put("SUserSNNO", "");
////			obj.put("NickName", "");
////			obj.put("QQ", "");
////			obj.put("RoleShowOrder", "");
////			obj.put("ShowOrder", "");
////			obj.put("RoleIconPath", "");
////			obj.put("UserIconPath", "");
////			obj.put("SubscribeType", "");
////			obj.put("RoleColor", "");
////			obj.put("IsHidden", "");
////			obj.put("SubscribeTeacherExpireDate", "");
////			array.add(obj);
////		}
//		return array;
//	}
	private static int num = 0;
//	public List<User> findOnlineUser1() {
//		List<User> userList = new ArrayList<User>();
//		//查找数据库  以 roleOrder userOrder userName 升序排列
//		//test
//		for(int i=num;i<num+4;i++){
//			User user = new User();
//			user.setUid(UUIDGenerator.getUUID());
//			user.setNickName("王老师 "+i);
//			user.setRoleId(1);
//			user.setRoleName("赢油天下");
//			user.setRoleOrder(5);
//			user.setUserOrder(i);
//			user.setIsSubscribe(1);
//			user.setRoleImgUrl("/images/newrole/admin.png");
//			userList.add(user);
//		}
//		for(int i=num;i<num+4;i++){
//			User user = new User();
//			user.setUid(UUIDGenerator.getUUID());
//			user.setNickName("小 "+i);
//			user.setRoleId(2);
//			if(i%2 ==0 ){
//				user.setRoleName("分析助理");
//			}else{
//				user.setRoleName("投资顾问");
//			}
//			user.setRoleOrder(15);
//			user.setUserOrder(i);
//			user.setQq("8888888"+i);
//			user.setIsQQ(1);
//			user.setRoleImgUrl("/images/newrole/admin.png");
//			userList.add(user);
//		}
//		for(int i=num;i<num+4;i++){
//			User user = new User();
//			user.setUid(UUIDGenerator.getUUID());
//			user.setNickName("大地主 "+i);
//			user.setRoleId(2);
//			user.setRoleName("W");
//			user.setRoleOrder(20);
//			user.setUserOrder(i);
//			user.setRoleImgUrl("/images/newrole/vip.png");
//			userList.add(user);
//		}
//		num += 10;
//		return userList;
//	}
	
	public boolean insertUser(User user){
		//给user 生成uid
		//TODO password MD5 加密
		//TODO 分配销售人员  saleManId  
		if(user.getUid() == null){
			user.setUid(UUIDGenerator.getUUID());
		}
		int result = userMapper.insertSelective(user);
		logger.info(" insert result="+result);
		return true;
	}
	/**
	 * 检验用户登录信息
	 * @param userName
	 * @param password
	 * @return
	 */
	public User checkUser(String userName,String password){
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("userName", userName);
		//TODO 用户密码 做MD5 加密
		map.put("password", password);
		List<User> list = userMapper.selectSelective(map);
		User user = null;
		if(list != null&&list.size()>0){
			user = list.get(0);
		}
		return user;
	}
	
	public User checkGuestUser(String registerIp){
		//根据ip 查询游客信息
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("registerIp", registerIp);
		map.put("roleId", 7);
		map.put("userOrder", 999);
		
//		List<User> list = userMapper.selectSelective(map);
		List<User> list = null; //test
		User user = null;
		if(list != null&&list.size()>0){
			user = list.get(0);
		}else{
			user =createGuestUser( registerIp);
			userMapper.insertSelective(user);
		}
		return user;
	}
	
	
	private User createGuestUser(String registerIp){
		guestNum++;
		User user = new User();
		user.setUid(UUIDGenerator.getUUID());
		user.setNickName("游客 "+guestNum);
		user.setUserName("游客 "+guestNum);
		user.setPassword("");
		user.setRoleId(7);
		user.setUserOrder(999);
		user.setRegisterIp(registerIp);
		return user;
	}
	
	public List<HashMap<String,Object>> getAllUserByOrder(){
		Map<String,Object> map =new HashMap<String,Object>();
		List<HashMap<String,Object>> list = userMapper.selectByOrder(map);
		return list;
	}
	
	public User findUserByUid(String uid){
		return userMapper.selectByUid(uid);
	}
	
}
