package com.liuzx.mingxin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/Content")
public class ContentController {
	private static Log logger = LogFactory.getLog(ContentController.class);

	@RequestMapping("/DailyDiscuss")
	String DailyDiscuss(ModelMap model,@RequestParam String InformationType,@RequestParam String RoomId) {
		logger.info("info  index");
		model.put("projectName", "jinrong");
		return "/CommunityHome.jsp";
	}
	
	
}
