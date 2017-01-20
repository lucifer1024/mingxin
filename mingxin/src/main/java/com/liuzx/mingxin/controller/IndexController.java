package com.liuzx.mingxin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liuzx.mingxin.domain.User;

@Controller
public class IndexController {
	private static Log logger = LogFactory.getLog(IndexController.class);

	@RequestMapping("/index")
	String indexjsp(ModelMap model,HttpServletRequest request, HttpSession session) {
//		//TODO  拦截器 判断是否登录 
//		User loginUser = (User)session.getAttribute(User.SESSION_ID);
//		if(loginUser!=null){
//			return "redirect:/Room/CommunityHome";
//		}else{
//			return "redirect:/Account/Login";
//		}
		return "redirect:/Room/RoomDetail";
	}
}
