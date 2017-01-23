package com.liuzx.mingxin.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.liuzx.mingxin.domain.DownFile;
import com.liuzx.mingxin.service.DownFileService;

@Controller
@RequestMapping("/Content")
public class ContentController {
	private static Log logger = LogFactory.getLog(ContentController.class);
	@Autowired
	DownFileService downFileService;
	@RequestMapping("/DailyDiscuss")
	String DailyDiscuss(ModelMap model,@RequestParam String InformationType,@RequestParam String RoomId) {
		logger.info("info  index");
		model.put("projectName", "jinrong");
		return "/RoomDetail.jsp";
	}
	
	@RequestMapping("/DownloadFilePage")
	String DownloadFilePage(ModelMap model,@RequestParam(required = false) String RoomId) {
		logger.info("info  index");
		List<DownFile> fileList = downFileService.selectDownFile();
		model.put("fileList", fileList);
		return "/DownloadFilePage.jsp";
	}
	
}
