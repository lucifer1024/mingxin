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
import com.liuzx.mingxin.domain.Role;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.service.RoleService;
import com.liuzx.mingxin.talk.TalkHandler;
import com.liuzx.mingxin.utils.MessageUtils;

@Controller
@RequestMapping("/Message")
public class MessageController {
	private static Log logger = LogFactory.getLog(MessageController.class);
	@Autowired
	private TalkHandler talkHandler;
	@Autowired
	private RoleService roleService;
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
//			if (msg.getIsWhisper().equals("1") && msg.getToUserSNNO().equals(User.ALL_USER_ID)) {
//				// 私聊 判断接收人不能是大家
//				return "悄悄话不能对大家说哦！";
//			}
			if(msg.getIsWhisper().equals("1")){
				String toUser = msg.getToUserSNNO();
				if(User.ALL_USER_ID.equals(toUser)){
					// 私聊 判断接收人不能是大家
					return "悄悄话不能对大家说哦！";
				}else{
					Role loginRole = (Role) session.getAttribute(Role.SESSION_ID);
					if(loginRole == null){
						loginRole = roleService.selectById(loginUser.getRoleId());
					}
					if(loginRole!=null){
						//判断发送人的角色 如果是管理员级别的  所有人都可以私聊
						//TODO 是否可以私聊任何人 根据角色判断
						if(loginRole.getId()>3){
							//非管理员用户只能私聊管理员
							Role toRole = roleService.selectByUid(toUser);
							if(toRole.getId()>3){
								return "您没有权限私聊其他用户，有问题请咨询老师或助理。";
							}
						}
					}else{
						logger.error("发送人 角色为空");
					}
				}
			}
			talkHandler.sendMessage(msg, loginUser);
		} else if ("AddFlowerMessage".equals(method)) {
			talkHandler.sendFlowerMessage(msg, loginUser);
		}
		return "Ok";
	}
}
