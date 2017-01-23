package com.liuzx.mingxin.domain;

import com.liuzx.mingxin.utils.MessageUtils;

public class Room {
	
	private int id;
	private String roomId; //房间号
	private String name;
	private int lineNum; //实际在线人数
	private int showLineNum; //展示在线人数
	
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	
	
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
		showLineNum += MessageUtils.getRandomIndex(50,100);
	}
	public void decr(){
		lineNum--;
		showLineNum -= MessageUtils.getRandomIndex(20,70);
	}
	public int getShowLineNum() {
		return showLineNum;
	}
	public void setShowLineNum(int showLineNum) {
		this.showLineNum = showLineNum;
	}
}
