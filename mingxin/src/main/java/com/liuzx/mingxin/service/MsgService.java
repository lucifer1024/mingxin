package com.liuzx.mingxin.service;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.liuzx.mingxin.domain.Message;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.utils.MessageUtils;
import com.liuzx.mingxin.utils.UUIDGenerator;

@Service
public class MsgService {
	
	public String dealMsg(Message msg, User fromUser) {
		JSONObject retunObj = new JSONObject();
//		msg.setMessageId("15992832Z4ZL");
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
		retunObj.put("messageContent", generateMsg(msg, fromUser));
		retunObj.put("messageId", msg.getMessageId());
		retunObj.put("toUserSNNO", msg.getToUserSNNO());
		retunObj.put("toUserType", "");
		retunObj.put("toUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121"); //销售人员 暂定刘老师
		retunObj.put("isShield", true);
		retunObj.put("fromUserSNNO", fromUser.getUid());
		retunObj.put("fromUserType", "观摩用户");
		retunObj.put("fromUserSaleMan", "210b60d1-00f8-4a73-97da-aa8ba374d121");//销售人员 暂定刘老师
		retunObj.put("isDiffPubliAndPrivateChatAre", true); //区分 公聊和私聊
		return retunObj.toJSONString();
	}
	private static String objectName = "/mingxin";
	private String generateMsg(Message msg, User fromUser) {
		StringBuffer sb = new StringBuffer();
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
		sb.append("<div class=\"msg-bubble-box\" id=\"" + msg.getMessageId() + "\">");
			sb.append("<div class=\"msg-bubble-user\">");
				sb.append("<a class=\"contact-name\" id=\"lnkUser_" + UUIDGenerator.chUid(fromUser.getUid()) + "\">");
					sb.append("<span>["+fromUser.getNickName()+"]</span>");
				sb.append("</a>");
				sb.append("<img class=\"ico16_chat\" src=\""+objectName+"/images/newrole/guest.png\" border=\"0\">&nbsp;");
				sb.append("<span class=\"contact-name\">"+MessageUtils.getMessageTime()+"</span>");
			sb.append("</div>");
			sb.append("<div class=\"msg-bubble bubble-gre\">");
				sb.append("<div class=\"bubble-arrow-l\" style=\"border-right:5px solid #f5f5f5\">");
				sb.append("</div>");
				sb.append("<div class=\"bubble-cont\" style=\"background:#f5f5f5\">");
					sb.append("<a class=\"contact-name-at\" href=\"javascript://\"></a>" + msg.getContent());
					sb.append("</div>");
			sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
	}

	public String dealMsg(String msg) {
		JSONObject retunObj = new JSONObject();
		JSONObject msgObj = JSONObject.parseObject(msg);
		String talktype = msgObj.getString("talktype");
		if ("messageReceived".equals(talktype)) {
			dealMessageReceived(msgObj, retunObj, talktype);
		}
		return retunObj.toJSONString();
	}

	private void dealMessageReceived(JSONObject msgObj, JSONObject retunObj, String talktype) {
		retunObj.put("talktype", talktype);
		retunObj.put("userId", msgObj.get("uid"));
		retunObj.put("userName", msgObj.get("name"));
		retunObj.put("mid", "");
		retunObj.put("message", msgObj.get("message"));
		retunObj.put("time", msgObj.get("now"));
		retunObj.put("type", msgObj.get("type"));
		retunObj.put("top", msgObj.get("top"));
		retunObj.put("tip", msgObj.get("tip"));
		retunObj.put("customerId", msgObj.get("1057"));
		retunObj.put("isHide", msgObj.get("false"));
		retunObj.put("index ", msgObj.get("index "));
		{
			JSONObject infoObj = new JSONObject();
			infoObj.put("id", "5ade862b-cf67-4868-909d-de6366ede482");
			infoObj.put("IsSleepwalk", 0);
			infoObj.put("groupName", "游客");
			infoObj.put("groupIcon", "uploadfile/group/1057/游-1.png");
			infoObj.put("sex", "1");
			infoObj.put("avatar", "images/avatar/t3/32/40.png");
			infoObj.put("spoker", 0);
			infoObj.put("fwtoa", "True");
			infoObj.put("fwtom", "False");
			infoObj.put("roleType", "3");
			infoObj.put("aw", "False");
			infoObj.put("gag", 0);
			infoObj.put("status", 0);
			infoObj.put("hasSensitiveWords", 0);
			infoObj.put("as", 1);
			infoObj.put("barrage", "False");
			infoObj.put("wonderful", "False");
			infoObj.put("talkto", "");
			infoObj.put("talktoId", "");
			retunObj.put("info", infoObj);
		}
	}
}
