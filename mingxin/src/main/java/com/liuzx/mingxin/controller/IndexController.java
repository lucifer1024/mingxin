package com.liuzx.mingxin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONArray;
import com.liuzx.mingxin.domain.Role;
import com.liuzx.mingxin.domain.Room;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.service.RoleService;
import com.liuzx.mingxin.service.RoomService;
import com.liuzx.mingxin.service.UserService;
import com.liuzx.mingxin.service.VideoService;
import com.liuzx.mingxin.utils.HttpRequestUtils;

@Controller
public class IndexController {
	private static Log logger = LogFactory.getLog(IndexController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private VideoService videoService;
//	@RequestMapping(value="/")
//	String index(ModelMap model,HttpServletRequest request, HttpSession session) {
//		logger.info("入口");
//		return "redirect:/Room/RoomDetail";
//	}
	@RequestMapping("/")
	String RoomDetail(ModelMap model,HttpSession session, HttpServletRequest request,@RequestParam(required = false) String RoomId,@RequestParam(required = false) String eventTarget) {
		logger.info("RoomId  " + RoomId);
		User loginUser = (User)session.getAttribute(User.SESSION_ID);
		Role loginRole = (Role)session.getAttribute(Role.SESSION_ID);
		if("lbSignOut".equals(eventTarget)){
			//注销
			logger.info("注销");
			loginUser = null;
			loginRole = null;
			model.put("eventTarget", "");
			
		}
		if(loginUser==null){
			// 生成游客信息
			//注册用户
			String registerIp = HttpRequestUtils.getRemortIP(request);
			// 保存到session
			loginUser = userService.checkGuestUser(registerIp);
			session.setAttribute(User.SESSION_ID, loginUser);
			loginRole = roleService.selectById(loginUser.getRoleId());
			session.setAttribute(Role.SESSION_ID, loginRole);
		}
		//根据roomId 查询room信息
		Room room = roomService.selectById(RoomId);
		JSONArray userArray = userService.findOnlineUser(); //用户列表
		model.put("room", room);
		model.put("user", loginUser);
		model.put("role", loginRole); 
		model.put("userArray", userArray);
		model.put("video", videoService.getVideo());
		String userAuths = "1000001101100100";
		userAuths = "1111111111111111";
		String foreignProductUrl = "http://115.29.249.68/";
		String foreignProductEncypt = "0a4df49f380e019b734099ace31c5ea4";
		model.put("userAuths", userAuths);
		model.put("foreignProductUrl", foreignProductUrl);
		model.put("foreignProductEncypt", foreignProductEncypt);
//		model.put("eventTarget", eventTarget);
		return "/RoomDetail.jsp";
	}
}
