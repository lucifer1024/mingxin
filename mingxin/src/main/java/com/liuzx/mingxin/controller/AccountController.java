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
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.liuzx.mingxin.domain.Role;
import com.liuzx.mingxin.domain.User;
import com.liuzx.mingxin.service.RoleService;
import com.liuzx.mingxin.service.UserService;
import com.liuzx.mingxin.utils.HttpRequestUtils;

@Controller
@RequestMapping("/Account")
public class AccountController {
	private static Log logger = LogFactory.getLog(AccountController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	

	@RequestMapping("/UserManager")
	@ResponseBody
	String UserManager(ModelMap model, @RequestParam String Method, @RequestParam(required = false) String RoomId,
			@RequestParam(required = false) String QQCount, @RequestParam(required = false) String SubLink , @RequestParam(required = false) String userName) {
		
		// return WRONG_ROOM_ID 房间号不正确
		// return LOGIN_EXPIRED 登录过期 重新登录
		if("CheckUserId".equals(Method)){
			//TODO 检验userName 是否已经存在
			logger.info(Method+" userName="+userName);
			//如果已经存在 返回false
		}
		return "ok";
	}

	@RequestMapping("/Login")
	String Login(ModelMap model, HttpSession session, HttpServletRequest request,@RequestParam(required = false) String userName,
			@RequestParam(required = false) String password, @RequestParam(required = false) String eventTarget) {
		logger.info("eventTarget :" + eventTarget);
		String registerIp = HttpRequestUtils.getRemortIP(request);
		// 根据eventTarget 判断是用户登录 还是游客登录
		if ("lnkLogin".equals(eventTarget)) {
			logger.info("用户名 密码登录");
			// 验证用户名和密码
			User user =userService.checkUser(userName, password);
			if(user != null){
				//登录成功
				session.setAttribute(User.SESSION_ID, user);
				session.setAttribute(Role.SESSION_ID, roleService.selectById(user.getRoleId()));
				return "redirect:/Room/CommunityHome";
			}else{
				//登录失败
				model.put("userName", userName);
				model.put("divLoginError", "用户名或密码错误，请重新登录。");
				// 登录失败
				return "/Login.jsp";
			}
		} else if ("SignOut".equals(eventTarget)) {
			// 注销
			logger.info("用户名 注销");
			session.removeAttribute(User.SESSION_ID);
			session.removeAttribute(Role.SESSION_ID);
			return "/Login.jsp";
		} else if ("lkbtnGuestLogin".equals(eventTarget)) {
			logger.info("游客登录");
			// 生成游客信息
			// 保存到session
			User user = userService.checkGuestUser(registerIp);
			session.setAttribute(User.SESSION_ID, user);
			session.setAttribute(Role.SESSION_ID, roleService.selectById(user.getRoleId()));
			// 登录成功
			return "redirect:/Room/CommunityHome";
		} else {
			model.put("userName", "");
			return "/Login.jsp";
		}
	}

	@RequestMapping(value = "/UserOnline", produces = "text/html;charset=UTF-8")
	@ResponseBody
	String UserOnline(ModelMap model, String RoomId, String SearchCondition, String Method, Integer CurrentPageIndex,
			Integer PageSize) {
		JSONArray userArray = userService.findOnlineUser();
		/**
		 * return
		 *  WRONG_ROOM_ID  房间号不正确
		 *  LOGIN_EXPIRED 登录过期
		 *  CANNOT_ENTER_ROOM  当前房间 只允许 实盘用户
		 *  WRONG_PARAMETER 分页参数不正确
		 */
		
		return userArray.toJSONString();
	}

	@RequestMapping("/Login4Mobile")
	@ResponseBody
	String Login4Mobile(ModelMap model, @RequestParam String Method, @RequestParam String RoomId,
			@RequestParam String QQCount, @RequestParam String SubLink) {
		logger.info("info  index");
		model.put("projectName", "jinrong");
		return "ok";
	}
	/**
	 * 注册用户
	 * @param model
	 * @param session
	 * @param userName
	 * @param password
	 * @param eventTarget
	 * @return
	 */
	@RequestMapping("/UserRegister")
	String UserRegister(ModelMap model, HttpSession session,HttpServletRequest request, @RequestParam(required = false) String eventTarget,
			User user) {
		logger.info("UserRegister action  eventTarget="+eventTarget);
		if(eventTarget == null){
			return "/UserRegister.jsp";
		}else if("lnkRegister".equals(eventTarget)){
			//注册用户
			String registerIp = HttpRequestUtils.getRemortIP(request);
			//TODO 判断 ip是否已经注册用户
			user.setRegisterIp(registerIp);
			//同一个ip 只能注册一个账号    提示信息： 同一个IP只能注册一个账号(您的IP:60.194.65.154)
			//注册完 到 登录页 or 首页
			if(userService.insertUser(user)){
				//登录成功
				session.setAttribute(User.SESSION_ID, user);
				return "redirect:/Room/CommunityHome";
			}else{
				model.put("divRegisterError", "密码错误");
			}
		}
		return "/UserRegister.jsp";
	}
	

}
