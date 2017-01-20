package com.liuzx.mingxin.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.talk.TalkHandler;
import com.liuzx.mingxin.utils.MessageUtils;

@Controller
@RequestMapping("/Message")
public class MessageController {
	private static Log logger = LogFactory.getLog(MessageController.class);
	@Autowired
	private TalkHandler talkHandler;

	@RequestMapping(value = "/Message", produces = "text/html;charset=UTF-8")
	@ResponseBody
	String message(ModelMap model, HttpSession session, com.liuzx.mingxin.domain.Message msg) {
		logger.info("接受到的信息 " + msg.toString());
		logger.info("talkHandler " + talkHandler);
		User loginUser = (User) session.getAttribute(User.SESSION_ID);
		if (loginUser.getUid().equals(msg.getToUserSNNO())) {
			return "您不能给自己发送消息";
		}
		String method = msg.getMethod();
		if ("AddChatMessage".equals(method)) {
			if (msg.getIsWhisper().equals("1") && msg.getToUserSNNO().equals(User.ALL_USER_ID)) {
				// 私聊 判断接收人不能是大家
				return "悄悄话不能对大家说哦！";
			}
			msg.setMessageId(MessageUtils.getMessageId());
			talkHandler.sendMessage(msg, loginUser);
		} else if ("AddFlowerMessage".equals(method)) {
			talkHandler.sendFlowerMessage(msg, loginUser);
		}
		return "Ok";
	}
}
