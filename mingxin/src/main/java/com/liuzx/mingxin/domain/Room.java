package com.liuzx.mingxin.domain;

public class Room {
	
	private int id;
	private String roomId; //房间号
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	private String name;
	private int lineNum; //在线人数
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLineNum() {
		return lineNum;
	}
	public void setLineNum(int lineNum) {
		this.lineNum = lineNum;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void incr(){
		lineNum++;
	}
	public void decr(){
		lineNum--;
	}
}
