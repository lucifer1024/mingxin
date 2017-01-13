package com.liuzx.mingxin.talk;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.alibaba.fastjson.JSONObject;
import com.liuzx.mingxin.controller.AccountController;
import com.liuzx.mingxin.domain.Message;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.service.MsgService;
import com.liuzx.mingxin.service.UserService;

@Component
public class TalkHandler extends TextWebSocketHandler {
	private static Log logger = LogFactory.getLog(TextWebSocketHandler.class);
	@Autowired
	private MsgService msgService;
	@Autowired
	private UserService userService;
	// 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static int onlineCount = 0;
	// concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	private static CopyOnWriteArraySet<WebSocketSession> webSocketSet = new CopyOnWriteArraySet<WebSocketSession>();
	private static Map<String, WebSocketSession> webSocketMap = new LinkedHashMap<String, WebSocketSession>();
	private static Map<String, User> sessionId2UserMap = new LinkedHashMap<String, User>();

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		// 接收到客户端消息时调用
		String receiveMsg = message.getPayload();
		dealReceveMsg(receiveMsg, session);
	}

	/**
	 * 上线的用户 id 和 sessioin绑定
	 * 
	 * @param receiveMsg
	 * @param session
	 */
	private void dealReceveMsg(String receiveMsg, WebSocketSession session) {
		JSONObject obj = JSONObject.parseObject(receiveMsg);
		String currentUserUid = obj.getString("currentUserUid");
		webSocketMap.put(currentUserUid, session);
		String sessionId = session.getId();
		User user = userService.findUserByUid(currentUserUid);
		if (user == null) {
			user = new User();
			user.setUid(currentUserUid);
		} else {
			sendUserOnline(user);
		}
		sessionId2UserMap.put(sessionId, user);
	}

	public void sendMessage(Message msg, User fromUser) {
		if (msgService != null) {
			String returnMsg = msgService.dealMsg(msg, fromUser);
			String toUserSNNO = msg.getToUserSNNO();
			if ("00000000-0000-0000-0000-000000000000".equals(toUserSNNO)) {
				sendPublicMessage(returnMsg);
			} else {
				sendPirateMssage(toUserSNNO, returnMsg);
			}
		} else {
			System.out.println("msgService is null ");
		}
	}

	/**
	 * 广播
	 */
	private void sendPublicMessage(String sendMsg) {
		TextMessage returnMessage = new TextMessage(sendMsg);
		for (WebSocketSession item : webSocketSet) {
			try {
				item.sendMessage(returnMessage);
			} catch (IOException e) {
				logger.error(e);
			}
		}
	}

	/**
	 * 私聊
	 */
	private void sendPirateMssage(String toUserSNNO, String sendMsg) {
		WebSocketSession session = webSocketMap.get(toUserSNNO);
		//TODO 如果用户不在线  保存到队列 等用户上线 再发送   并具有时效性
		if (session != null) {
			TextMessage returnMessage = new TextMessage(sendMsg);
			try {
				session.sendMessage(returnMessage);
			} catch (IOException e) {
				logger.error(e);
			}
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("初始化连接  getId=" + session.getId());
		webSocketSet.add(session);
		addOnlineCount();
		System.out.println("连接数量 onlineCount=" + getOnlineCount() + "  webSocketSet.size=" + webSocketSet.size());
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// 消息传输出错时调用
		System.out.println("消息传输出错 " + exception.getMessage());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		// 一个客户端连接断开时关闭
		System.out.println("连接断开 session.id=" + session.getId());
		String sessionId = session.getId();
		User user = sessionId2UserMap.get(sessionId);
		if (user != null) {
			sendUserDownline(user);
			webSocketMap.remove(user.getUid());
			sessionId2UserMap.remove(sessionId);
		}
		webSocketSet.remove(session);
		subOnlineCount();
		System.out.println("连接数量 onlineCount=" + getOnlineCount() + "  webSocketSet.size=" + webSocketSet.size());
	}

	@Override
	public boolean supportsPartialMessages() {
		System.out.println("supportsPartialMessages");
		return false;
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		onlineCount--;
	}

	/**
	 * 通知用户上线
	 */
	private void sendUserOnline(User user) {
		// TODO
	}

	/**
	 * 通知用户下线
	 */
	private void sendUserDownline(User user) {
		// TODO
	}
}
