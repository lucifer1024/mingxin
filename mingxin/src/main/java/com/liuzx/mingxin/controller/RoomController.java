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
import com.liuzx.mingxin.utils.HttpRequestUtils;

@Controller
@RequestMapping("/Room")
public class RoomController {
	private static Log logger = LogFactory.getLog(RoomController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private RoleService roleService;

	@RequestMapping("/RiskRemind")
	String RiskRemind(ModelMap model, @RequestParam String RoomId, @RequestParam(required = false) String eventTarget) {
		logger.info("RoomId  " + RoomId);
		if (eventTarget == null) {
			return "/RiskRemind.jsp";
		} else {
			model.put("eventTarget", eventTarget);
			return "/RoomDetail.jsp";
		}
	}
	/**
	 * 首页
	 * @param model
	 * @param RoomId
	 * @param eventTarget
	 * @return
	 */
	@RequestMapping("/CommunityHome")
	String CommunityHome(ModelMap model, HttpSession session, @RequestParam(required = false) String eventTarget) {
		User loginUser = (User)session.getAttribute(User.SESSION_ID);
		Role loginRole = (Role)session.getAttribute(Role.SESSION_ID);
		
		//TODO 此处不再做是否登录判断  使用统一方法验证
		if(loginUser!=null){
			model.put("user", loginUser); //用户名称  游客是 游客的自动生成的名称
			model.put("role", loginRole); //用户名称  游客是 游客的自动生成的名称
			return "/CommunityHome.jsp";
		}else{
			return "redirect:/Account/Login";
		}
	}
	
	@RequestMapping("/RoomDetail")
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
//		model.put("eventTarget", eventTarget);
		return "/RoomDetail.jsp";
	}
	
//TopVisitRooms  人气榜单
}
