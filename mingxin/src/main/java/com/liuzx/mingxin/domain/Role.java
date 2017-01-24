package com.liuzx.mingxin.domain;

public class Role {
	public static final String SESSION_ID = "loginRole";
	private int id;
	private String name; // 管理员  老师 助理  -- vip  shipan  no
	private int roleOrder;
	private String imgUrl = "images/newrole/admin.png"; // admin vip   shipan  NoMoney guanmo guest
	private String note;
	private String auths = "0000001101100100";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRoleOrder() {
		return roleOrder;
	}
	public void setRoleOrder(int roleOrder) {
		this.roleOrder = roleOrder;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getAuths() {
		return auths;
	}
	public void setAuths(String auths) {
		this.auths = auths;
	}
	
}
