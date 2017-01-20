package com.liuzx.mingxin.domain;

public class Message {
	
	private String messageId;
	private String Method;
	private String RoomId;
	private String Content;
	private String ToUserSNNO;
	private String ToUserName;
	private String IsWhisper; // 是否悄悄的   是  1 否 0 
	public String getMessageId() {
		return messageId;
	}
	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	public String getMethod() {
		return Method;
	}
	public void setMethod(String method) {
		Method = method;
	}
	public String getRoomId() {
		return RoomId;
	}
	public void setRoomId(String roomId) {
		RoomId = roomId;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getToUserSNNO() {
		return ToUserSNNO;
	}
	public void setToUserSNNO(String toUserSNNO) {
		ToUserSNNO = toUserSNNO;
	}
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getIsWhisper() {
		return IsWhisper;
	}
	public void setIsWhisper(String isWhisper) {
		IsWhisper = isWhisper;
	}
	public String  toString(){
		return RoomId +" ToUserSNNO "+ToUserSNNO+" to "+Content;
	}
}
