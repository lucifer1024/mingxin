package com.liuzx.mingxin.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.liuzx.mingxin.domain.Message;
import com.liuzx.mingxin.domain.Role;
import com.liuzx.mingxin.domain.Room;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.utils.MessageUtils;
import com.liuzx.mingxin.utils.UUIDGenerator;

@Service
public class MsgService {
	private static String objectName = "/mingxin";
	/**
	 * 了解框背景颜色
	 */
	private static Map<Integer, String> roleToStyleMap = new HashMap<Integer, String>();
	/**
	 * 字体颜色
	 */
	private static Map<Integer, String> roleToFontStyleMap = new HashMap<Integer, String>();
	static {
		roleToStyleMap.put(1, "#ffaf60");// 管理员 橙色
		roleToStyleMap.put(2, "#ffaad5");// 管理员 粉红色
		roleToStyleMap.put(3, "#ffaad5");// 管理员 粉红色
		roleToStyleMap.put(4, "#84c1ff");// 用户蓝色
		roleToStyleMap.put(5, "#84c1ff");// 用户蓝色
		roleToStyleMap.put(6, "#84c1ff"); // 用户蓝色
		roleToStyleMap.put(7, "#f5f5f5"); // 游客 白色
		
		roleToFontStyleMap.put(1, "#ffaf60");// 管理员 橙色
		roleToFontStyleMap.put(2, "#ffaad5");// 管理员 粉红色
		roleToFontStyleMap.put(3, "#ffaad5");// 管理员 粉红色
		roleToFontStyleMap.put(4, "#84c1ff");// 用户蓝色
		roleToFontStyleMap.put(5, "#84c1ff");// 用户蓝色
		roleToFontStyleMap.put(6, "#84c1ff"); // 用户蓝色
		roleToFontStyleMap.put(7, "#f5f5f5"); // 游客 白色

		// #ccc 系统提示
	}

	public String getColour(int roleId) {
		String colour = roleToStyleMap.get(roleId);
		if (colour == null) {
			colour = "#f5f5f5";
		}
		return colour;
	}
	public String getFontColour(int roleId) {
		String colour = roleToFontStyleMap.get(roleId);
		if (colour == null) {
			colour = "#f5f5f5";
		}
		return colour;
	}

	/**
	 * 广播 或者发个自己的样式
	 * 
	 * @param msg
	 * @param fromUser
	 * @param methodType
	 * @return
	 */
	public String dealMsg(Message msg, User fromUser, User toUser, String methodType, Role role) {
		JSONObject retunObj = new JSONObject();
		// msg.setMessageId("15992832Z4ZL");
		/*
		 * <div class="msg-bubble-box" id="li15992832Z4ZL"> <div
		 * class="msg-bubble-user"> <a class="contact-name"
		 * id="lnkUser_ch042b7118-d648-407e-a937-572f9356e579BX6">
		 * <span>[您]</span> </a> <img class="ico16_chat"
		 * src="/images/newrole/guest.png" border="0">&nbsp; <span
		 * class="contact-name">21:55:14</span> </div> <div class=
		 * "msg-bubble bubble-gre"> <div class="bubble-arrow-l" style=
		 * "border-right:5px solid #f5f5f5"> </div> <div class="bubble-cont"
		 * style="background:#f5f5f5"> <a class="contact-name-at"
		 * href="javascript://"></a>奥奥 </div> </div> </div>
		 */
		String messageContent = generateAllMsg(msg, fromUser, toUser, role);
		retunObj.put("method", methodType);
		retunObj.put("messageContent", messageContent);
		retunObj.put("messageId", msg.getMessageId());
		retunObj.put("toUserSNNO", msg.getToUserSNNO());
		retunObj.put("toUserType", "");
		retunObj.put("toUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121"); // 销售人员
																				// 暂定刘老师
		retunObj.put("isShield", false); // 是否遮蔽
		retunObj.put("isWhisper", msg.getIsWhisper()); // 是否悄悄话
		retunObj.put("fromUserSNNO", fromUser.getUid());
		retunObj.put("fromUserType", "观摩用户");
		retunObj.put("fromUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121");// 销售人员
																				// 暂定刘老师
		retunObj.put("isDiffPubliAndPrivateChatAre", true); // 区分 公聊和私聊
		return retunObj.toJSONString();
	}

	// /**
	// * 私聊发给别人的样式
	// * @param msg
	// * @param toUser
	// * @param methodType
	// * @return
	// */
	// public String dealPrivateToMsg(Message msg, User fromUser,User toUser,
	// String methodType) {
	// JSONObject retunObj = new JSONObject();
	// String messageContent = generatePrivateMessage(msg,fromUser, toUser);
	// retunObj.put("method", methodType);
	// retunObj.put("messageContent", messageContent);
	// retunObj.put("messageId", msg.getMessageId());
	// retunObj.put("toUserSNNO", msg.getToUserSNNO());
	// retunObj.put("toUserType", "");
	// retunObj.put("toUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121"); //
	// 销售人员
	// // 暂定刘老师
	// retunObj.put("isShield", true);
	// retunObj.put("fromUserSNNO", toUser.getUid());
	// retunObj.put("fromUserType", "观摩用户");
	// retunObj.put("fromUserSaleMan",
	// "210b60d1-00f8-4a73-97da-aa8ba374d121");// 销售人员
	// // 暂定刘老师
	// retunObj.put("isDiffPubliAndPrivateChatAre", true); // 区分 公聊和私聊
	// return retunObj.toJSONString();
	// }
	// /**
	// * 群聊发给别人的样式
	// * @param msg
	// * @param fromUser
	// * @param methodType
	// * @return
	// */
	// public String dealPublicToMsg(Message msg, User fromUser,User toUser,
	// String methodType) {
	// JSONObject retunObj = new JSONObject();
	// String messageContent = generatePublicMessage(msg, fromUser,toUser);
	// retunObj.put("method", methodType);
	// retunObj.put("messageContent", messageContent);
	// retunObj.put("messageId", msg.getMessageId());
	// retunObj.put("toUserSNNO", msg.getToUserSNNO());
	// retunObj.put("toUserType", "");
	// retunObj.put("toUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121"); //
	// 销售人员
	// // 暂定刘老师
	// retunObj.put("isShield", true);
	// retunObj.put("fromUserSNNO", fromUser.getUid());
	// retunObj.put("fromUserType", "观摩用户");
	// retunObj.put("fromUserSaleMan",
	// "210b60d1-00f8-4a73-97da-aa8ba374d121");// 销售人员
	// // 暂定刘老师
	// retunObj.put("isDiffPubliAndPrivateChatAre", true); // 区分 公聊和私聊
	// return retunObj.toJSONString();
	// }
	/**
	 * 发送鲜花
	 * 
	 * @param msg
	 * @param fromUser
	 * @param methodType
	 * @return
	 */
	public String dealToFlower(Message msg, User fromUser, User toUser, String methodType, Role role) {
		JSONObject retunObj = new JSONObject();
		String messageContent = generateFlower(msg, fromUser,toUser,role);
		retunObj.put("method", methodType);
		retunObj.put("messageContent", messageContent);
		retunObj.put("messageId", msg.getMessageId());
		retunObj.put("toUserSNNO", msg.getToUserSNNO());
		retunObj.put("toUserType", "");
		retunObj.put("toUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121"); // 销售人员
																				// 暂定刘老师
		retunObj.put("isShield", false); // 是否遮蔽
		retunObj.put("isWhisper", msg.getIsWhisper()); // 是否悄悄话
		retunObj.put("fromUserSNNO", fromUser.getUid());
		retunObj.put("fromUserType", role.getName());
		retunObj.put("fromUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121");// 销售人员
																				// 暂定刘老师
		retunObj.put("isDiffPubliAndPrivateChatAre", true); // 区分 公聊和私聊
		return retunObj.toJSONString();
	}
	/**
	 * 
	 * @param msg
	 * @param user
	 * @param methodType
	 * @return
	 */
	public String dealToNoTalk(Message msg, User user, String methodType) {
		JSONObject retunObj = new JSONObject();
		retunObj.put("method", methodType);
		retunObj.put("messageId", msg.getMessageId());
		retunObj.put("toUserSNNO",user.getUid());
		retunObj.put("noTalking",user.getIsNoTalking());
		return retunObj.toJSONString();
	}

//	/**
//	 * 私聊发给别人的样式
//	 * 
//	 * @param msg
//	 * @param toUser
//	 * @param methodType
//	 * @return
//	 */
//	public String dealPrivateToFlower(Message msg, User fromUser, User toUser, String methodType, Role role) {
//		JSONObject retunObj = new JSONObject();
//		String messageContent = generatePrivateFlower(msg, fromUser, toUser,role);
//		retunObj.put("method", methodType);
//		retunObj.put("messageContent", messageContent);
//		retunObj.put("messageId", msg.getMessageId());
//		retunObj.put("toUserSNNO", msg.getToUserSNNO());
//		retunObj.put("toUserType", "");
//		retunObj.put("toUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121"); // 销售人员
//																				// 暂定刘老师
//		retunObj.put("isShield", false); // 是否遮蔽
//		retunObj.put("isWhisper", msg.getIsWhisper()); // 是否悄悄话
//		retunObj.put("fromUserSNNO", fromUser.getUid());
//		retunObj.put("fromUserType", role.getName());
//		retunObj.put("fromUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121");// 销售人员
//																				// 暂定刘老师
//		retunObj.put("isDiffPubliAndPrivateChatAre", true); // 区分 公聊和私聊
//		return retunObj.toJSONString();
//	}

	/**
	 * 上线消息样式
	 * 
	 * @param user
	 * @param role
	 * @param methodType
	 * @param room
	 * @return
	 */
	public String dealLineMsg(User user, Role role, String methodType, Room room) {
		String messageId = MessageUtils.getMessageId();
		JSONObject retunObj = new JSONObject();
		retunObj.put("method", methodType);
		retunObj.put("sRoomId", room.getRoomId());
		retunObj.put("enterRoomMessage", generateEnterRoomMessage(user, room, messageId,role));
		{
			JSONObject obj = new JSONObject();
			obj.put("SUserSNNO", UUIDGenerator.ouUid(user.getUid()));
			obj.put("IsHidden", 0); // 是否隐藏 0 否 1 是
			obj.put("RoleShowOrder", role.getRoleOrder());
			obj.put("ShowOrder", user.getUserOrder());
			obj.put("NickName", user.getNickName());
			obj.put("QQ", user.getQq());
			obj.put("RoleIconPath", role.getImgUrl());
			retunObj.put("onlineUser", obj);
		}
		retunObj.put("enterRoomMessageId", messageId); // 销售人员 暂定刘老师
		retunObj.put("relatedSaleManSNNO", "210b60d1-00f8-4a73-97da-aa8ba374d121");
		return retunObj.toJSONString();
	}

	// private String generateMsg(Message msg, User fromUser, Role role) {
	// StringBuffer sb = new StringBuffer();
	// /*
	// * <div class="msg-bubble-box" id="li15992832Z4ZL"> <div
	// * class="msg-bubble-user"> <a class="contact-name"
	// * id="lnkUser_ch042b7118-d648-407e-a937-572f9356e579BX6">
	// * <span>[您]</span> </a> <img class="ico16_chat"
	// * src="/images/newrole/guest.png" border="0">&nbsp; <span
	// * class="contact-name">21:55:14</span> </div> <div class=
	// * "msg-bubble bubble-gre"> <div class="bubble-arrow-l" style=
	// * "border-right:5px solid #f5f5f5"> </div> <div class="bubble-cont"
	// * style="background:#f5f5f5"> <a class="contact-name-at"
	// * href="javascript://"></a>奥奥 </div> </div> </div>
	// */
	// sb.append("<div class=\"msg-bubble-box\" id=\"li" + msg.getMessageId() +
	// "\">");
	// sb.append("<div class=\"msg-bubble-user\">");
	// sb.append("<a class=\"contact-name\" id=\"lnkUser_" +
	// UUIDGenerator.chUid(fromUser.getUid()) + "\">");
	// sb.append("<span>[" + fromUser.getNickName() + "]</span>");
	// sb.append("</a>");
	// sb.append("<img class=\"ico16_chat\" src=\"" + objectName +
	// role.getImgUrl() + "\" border=\"0\">&nbsp;");
	// sb.append("<span class=\"contact-name\">" + MessageUtils.getMessageTime()
	// + "</span>");
	// sb.append("</div>");
	// sb.append("<div class=\"msg-bubble bubble-gre\">");
	// sb.append("<div class=\"bubble-arrow-l\" style=\"border-right:5px solid "
	// + getColour(role.getId()) + "\">");
	// sb.append("</div>");
	// sb.append("<div class=\"bubble-cont\" style=\"background:" +
	// getColour(role.getId()) + "\">");
	// sb.append("<a class=\"contact-name-at\" href=\"javascript://\"></a>" +
	// msg.getContent());
	// sb.append("</div>");
	// sb.append("</div>");
	// sb.append("</div>");
	// return sb.toString();
	// }

	private String generateAllMsg(Message msg, User fromUser, User toUser, Role role) {
		StringBuffer sb = new StringBuffer();
		sb.append("<div class=\"msg-bubble-box\" id=\"li" + msg.getMessageId() + "\">");
		sb.append("<div class=\"msg-bubble-user\">");
		// 时间
		sb.append("<span class=\"contact-name\">" + MessageUtils.getMessageTime() + "</span>&nbsp;");
		// 头像
		sb.append("<img class=\"ico16_chat\" src=\"" + objectName + role.getImgUrl() + "\" border=\"0\">&nbsp;");
		// 昵称
		sb.append("<a class=\"contact-name\" id=\"lnkUser_" + UUIDGenerator.chUid(fromUser.getUid()) + "\">");
		sb.append("<span>[" + fromUser.getNickName() + "]</span>");
		sb.append("</a>");
		sb.append("</div>");
		// 聊天内容
		sb.append("<div class=\"msg-bubble bubble-gre\" >");
		sb.append("<div class=\"bubble-arrow-l\" style=\"border-right:5px solid " + getColour(role.getId()) + "\">");
		sb.append("</div>");
		sb.append("&nbsp;<div class=\"bubble-cont\" style=\"background:" + getColour(role.getId()) + "\">");
		// 是否悄悄话
		if (toUser != null) {
			// @个人
			if ("1".equals(msg.getIsWhisper())) {
				sb.append("<a class=\"contact-name-at\" href=\"javascript://\">悄悄</a>");
			} else {
				sb.append("<a class=\"contact-name-at\" href=\"javascript://\"></a>");
			}
			sb.append("<a class=\"contact-name-at\" href=\"javascript://\"  id=\"lnkUser_"
					+ UUIDGenerator.chUid(toUser.getUid()) + "\" >");
			sb.append("@<span>[" + toUser.getNickName() + "]</span>");
			sb.append("</a>&nbsp;&nbsp;&nbsp;" + msg.getContent());
		} else {
			// 广播
			sb.append("<a class=\"contact-name-at\" href=\"javascript://\"></a>" + msg.getContent());
		}
		sb.append("</div>");
		sb.append("</div>");
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();

	}
	// public String dealMsg(String msg) {
	// JSONObject retunObj = new JSONObject();
	// JSONObject msgObj = JSONObject.parseObject(msg);
	// String talktype = msgObj.getString("talktype");
	// if ("messageReceived".equals(talktype)) {
	// dealMessageReceived(msgObj, retunObj, talktype);
	// }
	// return retunObj.toJSONString();
	// }
	//
	// private void dealMessageReceived(JSONObject msgObj, JSONObject retunObj,
	// String talktype) {
	// retunObj.put("talktype", talktype);
	// retunObj.put("userId", msgObj.get("uid"));
	// retunObj.put("userName", msgObj.get("name"));
	// retunObj.put("mid", "");
	// retunObj.put("message", msgObj.get("message"));
	// retunObj.put("time", msgObj.get("now"));
	// retunObj.put("type", msgObj.get("type"));
	// retunObj.put("top", msgObj.get("top"));
	// retunObj.put("tip", msgObj.get("tip"));
	// retunObj.put("customerId", msgObj.get("1057"));
	// retunObj.put("isHide", msgObj.get("false"));
	// retunObj.put("index ", msgObj.get("index "));
	// {
	// JSONObject infoObj = new JSONObject();
	// infoObj.put("id", "5ade862b-cf67-4868-909d-de6366ede482");
	// infoObj.put("IsSleepwalk", 0);
	// infoObj.put("groupName", "游客");
	// infoObj.put("groupIcon", "uploadfile/group/1057/游-1.png");
	// infoObj.put("sex", "1");
	// infoObj.put("avatar", "images/avatar/t3/32/40.png");
	// infoObj.put("spoker", 0);
	// infoObj.put("fwtoa", "True");
	// infoObj.put("fwtom", "False");
	// infoObj.put("roleType", "3");
	// infoObj.put("aw", "False");
	// infoObj.put("gag", 0);
	// infoObj.put("status", 0);
	// infoObj.put("hasSensitiveWords", 0);
	// infoObj.put("as", 1);
	// infoObj.put("barrage", "False");
	// infoObj.put("wonderful", "False");
	// infoObj.put("talkto", "");
	// infoObj.put("talktoId", "");
	// retunObj.put("info", infoObj);
	// }
	// }

	// private String generatePrivateMessage(Message msg, User fromUser, User
	// toUser) {
	// StringBuffer sb = new StringBuffer();
	// /*
	// * <div class="msg-bubble-box" id="li15992832Z4ZL"> <div
	// * class="msg-bubble-user"> <a class="contact-name"
	// * id="lnkUser_ch042b7118-d648-407e-a937-572f9356e579BX6">
	// * <span>[您]</span> </a> <img class="ico16_chat"
	// * src="/images/newrole/guest.png" border="0">&nbsp; <span
	// * class="contact-name">21:55:14</span> </div> <div class=
	// * "msg-bubble bubble-gre"> <div class="bubble-arrow-l" style=
	// * "border-right:5px solid #f5f5f5"> </div> <div class="bubble-cont"
	// * style="background:#f5f5f5"> <a class="contact-name-at"
	// * href="javascript://"></a>奥奥 </div> </div> </div>
	// */
	// sb.append("<div class=\"msg-bubble-box\" id=\"li" + msg.getMessageId() +
	// "\">");
	// sb.append("<div class=\"msg-bubble-user\">");
	// sb.append("<a class=\"contact-name\" id=\"lnkUser_" +
	// UUIDGenerator.chUid(fromUser.getUid()) + "\">");
	// sb.append("<span>[" + fromUser.getNickName() + "]</span>");
	// sb.append("</a>");
	// sb.append("<img class=\"ico16_chat\" src=\"" + objectName +
	// "/images/newrole/guest.png\" border=\"0\">&nbsp;");
	// sb.append("<span class=\"contact-name\">" + MessageUtils.getMessageTime()
	// + "</span>");
	// sb.append("</div>");
	// sb.append("<div class=\"msg-bubble bubble-gre\">");
	// sb.append("<div class=\"bubble-arrow-l\" style=\"border-right:5px solid
	// #ffaad5\">");
	// sb.append("</div>");
	// sb.append("<div class=\"bubble-cont\" style=\"background:#ffaad5\">");
	// sb.append("<a class=\"contact-name-at\" href=\"javascript://\">悄悄</a>");
	// sb.append("<a class=\"contact-name-at\" href=\"javascript://\"
	// id=\"lnkUser_"
	// + UUIDGenerator.chUid(toUser.getUid()) + "\" >");
	// sb.append("@<span>[" + toUser.getNickName() + "]</span>");
	// sb.append("</a>&nbsp;&nbsp;&nbsp;" + msg.getContent());
	// sb.append("</div>");
	// sb.append("</div>");
	// sb.append("</div>");
	// return sb.toString();
	// }
	//
	// private String generatePublicMessage(Message msg, User fromUser, User
	// toUser) {
	// StringBuffer sb = new StringBuffer();
	// // <div class="msg-bubble-box" id="li1615226246D8">
	// // <div class="msg-bubble-user">
	// // <a class="contact-name"
	// //
	// id="lnkUser_ch6985decb-8bdc-4ada-affa-aae49dec7c78J8L"><span>[您]</span></a>
	// // <img class="ico16_chat" src="/images/newrole/guanmo.png" border="0"
	// // />&nbsp;
	// // <span class="contact-name">20:15:40</span>
	// // </div>
	// // <div class="msg-bubble bubble-gre">
	// // <div class="bubble-arrow-l" style="border-right:5px solid
	// // #f5f5f5"></div>
	// // <div class="bubble-cont" style="background:#f5f5f5">
	// // <a class="contact-name-at" href="javascript://"></a>
	// // <a class="contact-name-at" href="javascript://"
	// //
	// id="lnkUser_chfa82928c-bd1a-4cc0-84f5-9491ff6bdc452PR">@<span>[投资顾问-米琦]</span></a>&nbsp;&nbsp;&nbsp;?
	// // </div>
	// // </div>
	// // </div>
	// sb.append("<div class=\"msg-bubble-box\" id=\"li" + msg.getMessageId() +
	// "\">");
	// sb.append("<div class=\"msg-bubble-user\">");
	// sb.append("<a class=\"contact-name\" id=\"lnkUser_" +
	// UUIDGenerator.chUid(fromUser.getUid()) + "\">");
	// sb.append("<span>[" + fromUser.getNickName() + "]</span>");
	// sb.append("</a>");
	// sb.append("<img class=\"ico16_chat\" src=\"" + objectName +
	// "/images/newrole/guest.png\" border=\"0\">&nbsp;");
	// sb.append("<span class=\"contact-name\">" + MessageUtils.getMessageTime()
	// + "</span>");
	// sb.append("</div>");
	// sb.append("<div class=\"msg-bubble bubble-gre\">");
	// sb.append("<div class=\"bubble-arrow-l\" style=\"border-right:5px solid
	// #f5f5f5\">");
	// sb.append("</div>");
	// sb.append("<div class=\"bubble-cont\" style=\"background:#f5f5f5\">");
	// sb.append("<a class=\"contact-name-at\" href=\"javascript://\"></a>");
	// sb.append("<a class=\"contact-name-at\" href=\"javascript://\"
	// id=\"lnkUser_"
	// + UUIDGenerator.chUid(toUser.getUid()) + "\" >");
	// sb.append("@<span>[" + toUser.getNickName() + "]</span>");
	// sb.append("</a>&nbsp;&nbsp;&nbsp;" + msg.getContent());
	// sb.append("<p><br /></p>");
	// sb.append("</div>");
	// sb.append("</div>");
	// sb.append("</div>");
	// return sb.toString();
	// }

	private String generatePublicFlower(Message msg, User fromUser,Role role) {
		StringBuffer sb = new StringBuffer();
		// <div class="msg-bubble-box" id="li161565188Z2P">
		// <div class="msg-bubble-user">
		// <a class="contact-name"
		// id="lnkUser_ch6985decb-8bdc-4ada-affa-aae49dec7c7806V"><span>[您]</span></a>
		// <img class="ico16_chat" src="/images/newrole/guanmo.png" border="0"
		// />&nbsp;
		// <span class="contact-name">21:16:12</span>
		// </div>
		// <div class="msg-bubble bubble-gre">
		// <div class="bubble-arrow-l" style="border-right:5px solid
		// #fff"></div>
		// <div class="bubble-cont" style="background:#fff">
		// <a class="contact-name-at_flower" href="javascript://"></a>
		// <img src="/images/flower/flower1.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower2.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower3.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower4.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower5.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower6.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower7.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower8.gif?1" alt="" style="border:0" />
		// </div>
		// </div>
		// </div>

		sb.append("<div class=\"msg-bubble-box\" id=\"li" + msg.getMessageId() + "\">");
		sb.append("<div class=\"msg-bubble-user\">");
		sb.append("<a class=\"contact-name\" id=\"lnkUser_" + UUIDGenerator.chUid(fromUser.getUid()) + "\">");
		sb.append("<span>[" + fromUser.getNickName() + "]</span>");
		sb.append("</a>");
		sb.append("<img class=\"ico16_chat\" src=\"" + objectName + role.getImgUrl() + "\" border=\"0\">&nbsp;");
		sb.append("<span class=\"contact-name\">" + MessageUtils.getMessageTime() + "</span>");
		sb.append("</div>");
		sb.append("<div class=\"msg-bubble bubble-gre\">");
		sb.append("<div class=\"bubble-arrow-l\" style=\"border-right:5px solid #fff\">");
		sb.append("</div>");
		sb.append("<div class=\"bubble-cont\" style=\"background:#fff\">");
		sb.append("<a class=\"contact-name-at_flower\" href=\"javascript://\"></a>");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("</div>");
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
	}

	private String generateFlower(Message msg, User fromUser, User toUser,Role role) {
		StringBuffer sb = new StringBuffer();
		// <div class="msg-bubble-box" id="li161580402282">
		// <div class="msg-bubble-user">
		// <a class="contact-name"
		// id="lnkUser_ch6985decb-8bdc-4ada-affa-aae49dec7c78N8J"><span>[您]</span></a>
		// <img class="ico16_chat" src="/images/newrole/guanmo.png" border="0"
		// />&nbsp;
		// <span class="contact-name">21:44:20</span>
		// </div>
		// <div class="msg-bubble bubble-gre">
		// <div class="bubble-arrow-l" style="border-right:5px solid
		// #fff"></div>
		// <div class="bubble-cont" style="background:#fff">
		// <a class="contact-name-at_flower" href="javascript://">悄悄</a>
		// <a class="contact-name-at_flower" href="javascript://"
		// id="lnkUser_chfa82928c-bd1a-4cc0-84f5-9491ff6bdc454P0">@<span>[投资顾问-米琦]</span></a>
		// <img src="/images/flower/flower1.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower2.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower3.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower4.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower5.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower6.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower7.gif?1" alt="" style="border:0" />
		// <img src="/images/flower/flower8.gif?1" alt="" style="border:0" />
		// </div>
		// </div>
		// </div>

		sb.append("<div class=\"msg-bubble-box\" id=\"li" + msg.getMessageId() + "\">");
		sb.append("<div class=\"msg-bubble-user\">");
		sb.append("<a class=\"contact-name\" id=\"lnkUser_" + UUIDGenerator.chUid(fromUser.getUid()) + "\">");
		sb.append("<span>[" + fromUser.getNickName() + "]</span>");
		sb.append("</a>");
		sb.append("<img class=\"ico16_chat\" src=\"" + objectName + role.getImgUrl() + "\" border=\"0\">&nbsp;");
		sb.append("<span class=\"contact-name\">" + MessageUtils.getMessageTime() + "</span>");
		sb.append("</div>");
		sb.append("<div class=\"msg-bubble bubble-gre\">");
		sb.append("<div class=\"bubble-arrow-l\" style=\"border-right:5px solid #fff\">");
		sb.append("</div>");
		sb.append("<div class=\"bubble-cont\" style=\"background:#fff\">");
		if (toUser != null) {
			if ("1".equals(msg.getIsWhisper())) {
				sb.append("<a class=\"contact-name-at_flower\" href=\"javascript://\">悄悄</a>");
			} else {
				sb.append("<a class=\"contact-name-at_flower\" href=\"javascript://\"></a>");
			}
			sb.append("<a class=\"contact-name-at\" href=\"javascript://\"  id=\"lnkUser_"
					+ UUIDGenerator.chUid(toUser.getUid()) + "\" >");
			sb.append("@<span>[" + toUser.getNickName() + "]</span>");
			sb.append("</a>");
		}else{
			sb.append("<a class=\"contact-name-at_flower\" href=\"javascript://\"></a>");
		}
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("<img src=\"" + objectName + "/images/flower/flower1.gif\" alt=\"\" style=\"border:0\" />");
		sb.append("</div>");
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
	}

	private String generateEnterRoomMessage(User user, Room room, String messageId,Role role) {
		StringBuffer sb = new StringBuffer();
		StringBuffer userNameSb = new StringBuffer();
		// <div class="chat-tip" id="li00000000VH84">
		// <div class="chat-tip-in">
		// <a class="contact-name"
		// id="lnkUser_ch6985decb-8bdc-4ada-affa-aae49dec7c78P6Z">[6-lucifer]</a>您好，欢迎光临石油帝国，我们将竭诚为您服务！
		// </div>
		// </div>
		sb.append("<div class=\"chat-tip\" id=\"li" + messageId + "\">");
		sb.append("<div class=\"chat-tip-in\">");
		
		userNameSb.append("<a class=\"contact-name\" href=\"javascript:;\" id=\"lnkUser_" + UUIDGenerator.chUid(user.getUid()) + "\">");
		userNameSb.append("<span style=\"color:" + getFontColour(role.getId()) + "\">");
		userNameSb.append("["+user.getNickName()+"]");
		userNameSb.append("</span>");
		userNameSb.append("</a>");
		sb.append(MessageUtils.getEnterRoomMessage(userNameSb.toString()));
		sb.append("&nbsp;&nbsp;<span class=\"contact-name\">" + MessageUtils.getMessageTime() + "</span>");
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
	}
}
