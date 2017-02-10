package com.liuzx.mingxin.domain;

import java.util.Date;

public class User {
	public static final String SESSION_ID = "loginUser";
	public static final String ALL_USER_ID = "00000000-0000-0000-0000-000000000000";
	
	private int id;
	private String uid;
	private String userName;
	private String password;
	private String nickName;
	private String qq;
	private int userOrder; //  用户排序  默认999 
	private int isSubscribe = 0; //是否可以订阅 0 否  1 是
	private int isQQ = 0; // 是否qq 咨询
	private int roleId; //角色id
	private Date createTime;
	private String registerIp; //注册ip 
	private String loginIp; //登录ip
	private String mobile; //手机号
	private String saleManId; //对应的销售人员
	private int isOnline; //是否在线 0 不在线 1 在线
	private String skinId = "skin0"; // 默认皮肤id 0 
	private int isNoTalking; //是否禁言  1 是  0 否 
	private User saleMan;
	private String email;
	
//	private int userType;//用户类型    1 游客、2 注册未激活、3 观摩用户.
//	private String userTypeName;//用户类型    1 游客、2 注册未激活、3 观摩用户
	
	
//	private int roleOrder; //角色排序  5 、经理  10 、老师  15、分析助理  投资顾问      20  vip 23 vip  30  默认99
//	private String roleName;  //角色名称
//	private String roleImgUrl;
	
//	public String getRoleImgUrl() {
//		return roleImgUrl;
//	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
//	public void setRoleImgUrl(String roleImgUrl) {
//		this.roleImgUrl = roleImgUrl;
//	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public int getIsSubscribe() {
		return isSubscribe;
	}

	public void setIsSubscribe(int isSubscribe) {
		this.isSubscribe = isSubscribe;
	}

	public int getIsQQ() {
		return isQQ;
	}

	public void setIsQQ(int isQQ) {
		this.isQQ = isQQ;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

//	public int getRoleOrder() {
//		return roleOrder;
//	}
//
//	public void setRoleOrder(int roleOrder) {
//		this.roleOrder = roleOrder;
//	}
//
//	public String getRoleName() {
//		return roleName;
//	}
//
//	public void setRoleName(String roleName) {
//		this.roleName = roleName;
//	}

	public int getUserOrder() {
		return userOrder;
	}

	public void setUserOrder(int userOrder) {
		this.userOrder = userOrder;
	}

	

//	public int getUserType() {
//		return userType;
//	}
//
//	public void setUserType(int userType) {
//		this.userType = userType;
//	}
//
//	public String getUserTypeName() {
//		return userTypeName;
//	}
//
//	public void setUserTypeName(String userTypeName) {
//		this.userTypeName = userTypeName;
//	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegisterIp() {
		return registerIp;
	}
	public void setRegisterIp(String registerIp) {
		this.registerIp = registerIp;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSaleManId() {
		return saleManId;
	}
	public void setSaleManId(String saleManId) {
		this.saleManId = saleManId;
	}

	public int getIsOnline() {
		return isOnline;
	}

	public void setIsOnline(int isOnline) {
		this.isOnline = isOnline;
	}

	public String getSkinId() {
		return skinId;
	}

	public void setSkinId(String skinId) {
		this.skinId = skinId;
	}

	public int getIsNoTalking() {
		return isNoTalking;
	}

	public void setIsNoTalking(int isNoTalking) {
		this.isNoTalking = isNoTalking;
	}
	public String getUserStatus(){
//		第一位 是否禁言  1 被禁言 0 未被禁言
//		第二位 是否屏蔽信息 
//		第三位 是否封闭ip
//		第四位 是否封闭账号
//		第五位  1 上麦 2 下麦
		return isNoTalking+"0001";
	}

	public User getSaleMan() {
		return saleMan;
	}

	public void setSaleMan(User saleMan) {
		this.saleMan = saleMan;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
