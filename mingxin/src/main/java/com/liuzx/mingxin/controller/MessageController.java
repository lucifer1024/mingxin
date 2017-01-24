package com.liuzx.mingxin.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liuzx.mingxin.domain.Message;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.talk.TalkHandler;
import com.liuzx.mingxin.utils.MessageUtils;

@Controller
@RequestMapping("/Message")
public class MessageController {
	private static Log logger = LogFactory.getLog(MessageController.class);
	@Autowired
	private TalkHandler talkHandler;
	/**
	 * 
	 * @param model
	 * @param session
	 * @param msg
	 * @param userControlId 用户id  lnkUser_chab45bfe3-af07-4ad8-9215-0a4c84ab3e37vo5  需要截取
	 * @param TrueOrFalse 是否  1 是  0 否
	 * @return
	 */
	@RequestMapping(value = "/Message", produces = "text/html;charset=UTF-8")
	@ResponseBody
	String message(ModelMap model, HttpSession session, Message msg,@RequestParam(required = false) String userControlId,@RequestParam(required = false) String TrueOrFalse) {
		logger.info("接受到的信息 " + msg.toString());
		logger.info("talkHandler " + talkHandler);
		User loginUser = (User) session.getAttribute(User.SESSION_ID);
		if(loginUser == null){
			return "timeout";
		}
		if (loginUser.getUid().equals(msg.getToUserSNNO())) {
			return "您不能给自己发送消息";
		}
		String method = msg.getMethod();
		msg.setMessageId(MessageUtils.getMessageId());
		if ("AddChatMessage".equals(method)) {
			if (msg.getIsWhisper().equals("1") && msg.getToUserSNNO().equals(User.ALL_USER_ID)) {
				// 私聊 判断接收人不能是大家
				return "悄悄话不能对大家说哦！";
			}
			talkHandler.sendMessage(msg, loginUser);
		} else if ("AddFlowerMessage".equals(method)) {
			talkHandler.sendFlowerMessage(msg, loginUser);
		}
		return "Ok";
	}
}
