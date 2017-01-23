package com.liuzx.mingxin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/ueditor")
public class UEditorController {
	private static Log logger = LogFactory.getLog(UEditorController.class);

	@RequestMapping(value = "/netController", produces = "text/html;charset=UTF-8")
	@ResponseBody
	String netController(ModelMap model,@RequestParam String action) {
		logger.info(" action "+action);
		JSONObject resultObj = new JSONObject();
		resultObj.put("imageActionName", "uploadimage");
		resultObj.put("imageFieldName", "upfile");
		resultObj.put("imageMaxSize", 2048000);
		{
			JSONArray array = new JSONArray();
			array.add(".png");
			array.add(".jpg");
			array.add(".jpeg");
			array.add(".gif");
			array.add(".bmp");
			resultObj.put("imageAllowFiles", array);
		}
		resultObj.put("imageCompressEnable", true);
		resultObj.put("imageCompressBorder", 1600);
		resultObj.put("imageInsertAlign", "none");
		resultObj.put("imageUrlPrefix", "/ueditor/net/");
		resultObj.put("imagePathFormat", "upload/image/{yyyy}{mm}{dd}/{time}{rand:6}");
		
		resultObj.put("scrawlActionName", "uploadscrawl");
		resultObj.put("scrawlFieldName", "upfile");
		resultObj.put("scrawlPathFormat", "upload/image/{yyyy}{mm}{dd}/{time}{rand:6}");
		resultObj.put("scrawlMaxSize", 2048000);
		resultObj.put("scrawlUrlPrefix", "/ueditor/net/");
		resultObj.put("scrawlInsertAlign", "none");
		
		resultObj.put("snapscreenActionName", "uploadimage");
		resultObj.put("snapscreenPathFormat", "upload/image/{yyyy}{mm}{dd}/{time}{rand:6}");
		resultObj.put("snapscreenUrlPrefix", "/ueditor/net/");
		resultObj.put("snapscreenInsertAlign", "none");
		{
			JSONArray array = new JSONArray();
			array.add("127.0.0.1");
			array.add("localhost");
			array.add("img.baidu.com");
			resultObj.put("catcherLocalDomain", array);
		}
		
		resultObj.put("catcherActionName", "catchimage");
		resultObj.put("catcherFieldName", "source");
		resultObj.put("catcherPathFormat", "upload/image/{yyyy}{mm}{dd}/{time}{rand:6}");
		resultObj.put("catcherMaxSize", 2048000);
		resultObj.put("catcherUrlPrefix", "/ueditor/net/");
		{
			JSONArray array = new JSONArray();
			array.add(".png");
			array.add(".jpg");
			array.add(".jpeg");
			array.add(".gif");
			array.add(".bmp");
			resultObj.put("catcherAllowFiles", array);
		}
		
		
		resultObj.put("videoActionName", "uploadvideo");
		resultObj.put("videoFieldName", "upfile");
		resultObj.put("videoPathFormat", "upload/image/{yyyy}{mm}{dd}/{time}{rand:6}");
		resultObj.put("videoMaxSize", 102400000);
		resultObj.put("videoUrlPrefix", "/ueditor/net/");
		{
			JSONArray array = new JSONArray();
			array.add(".flv");
			array.add(".swf");
			array.add(".mkv");
			array.add(".avi");
			array.add(".rm");
			array.add(".rmvb");
			array.add(".mpeg");
			array.add(".mpg");
			array.add(".ogg");
			array.add(".ogv");
			array.add(".mov");
			array.add(".wmv");
			array.add(".mp4");
			array.add(".webm");
			array.add(".mp3");
			array.add(".wav");
			array.add(".mid");
			resultObj.put("videoAllowFiles", array);
		}
		
		resultObj.put("fileActionName", "uploadfile");
		resultObj.put("fileFieldName", "upfile");
		resultObj.put("filePathFormat", "upload/image/{yyyy}{mm}{dd}/{time}{rand:6}");
		resultObj.put("fileMaxSize", 51200000);
		resultObj.put("fileUrlPrefix", "/ueditor/net/");
		{
			JSONArray array = new JSONArray();
			
			array.add(".png");
			array.add(".jpg");
			array.add(".jpeg");
			array.add(".gif");
			array.add(".bmp");
			
			array.add(".flv");
			array.add(".swf");
			array.add(".mkv");
			array.add(".avi");
			array.add(".rm");
			array.add(".rmvb");
			array.add(".mpeg");
			array.add(".mpg");
			array.add(".ogg");
			array.add(".ogv");
			array.add(".mov");
			array.add(".wmv");
			array.add(".mp4");
			array.add(".webm");
			array.add(".mp3");
			array.add(".wav");
			array.add(".mid");
			
			array.add(".rar");
			array.add(".zip");
			array.add(".tar");
			array.add(".gz");
			array.add(".7z");
			array.add(".bz2");
			array.add(".cab");
			array.add(".iso");
			array.add(".doc");
			array.add(".docx");
			array.add(".xls");
			array.add(".xlsx");
			array.add(".ppt");
			array.add(".pptx");
			array.add(".pdf");
			array.add(".txt");
			array.add(".md");
			array.add(".xml");
			resultObj.put("fileAllowFiles", array);
		}
		
		resultObj.put("imageManagerActionName", "listimage");
		resultObj.put("imageManagerListPath", "upload/image");
		resultObj.put("imageManagerInsertAlign", "none");
		resultObj.put("imageManagerListSize", 20);
		resultObj.put("imageManagerUrlPrefix", "/ueditor/net/");
		{
			JSONArray array = new JSONArray();
			array.add(".png");
			array.add(".jpg");
			array.add(".jpeg");
			array.add(".gif");
			array.add(".bmp");
			resultObj.put("imageManagerAllowFiles", array);
		}
		
		
		resultObj.put("fileManagerActionName", "listfile");
		resultObj.put("fileManagerListPath", "upload/file");
		resultObj.put("fileManagerListSize", 20);
		resultObj.put("fileManagerUrlPrefix", "/ueditor/net/");
		{
			JSONArray array = new JSONArray();
			
			array.add(".png");
			array.add(".jpg");
			array.add(".jpeg");
			array.add(".gif");
			array.add(".bmp");
			
			array.add(".flv");
			array.add(".swf");
			array.add(".mkv");
			array.add(".avi");
			array.add(".rm");
			array.add(".rmvb");
			array.add(".mpeg");
			array.add(".mpg");
			array.add(".ogg");
			array.add(".ogv");
			array.add(".mov");
			array.add(".wmv");
			array.add(".mp4");
			array.add(".webm");
			array.add(".mp3");
			array.add(".wav");
			array.add(".mid");
			
			array.add(".rar");
			array.add(".zip");
			array.add(".tar");
			array.add(".gz");
			array.add(".7z");
			array.add(".bz2");
			array.add(".cab");
			array.add(".iso");
			array.add(".doc");
			array.add(".docx");
			array.add(".xls");
			array.add(".xlsx");
			array.add(".ppt");
			array.add(".pptx");
			array.add(".pdf");
			array.add(".txt");
			array.add(".md");
			array.add(".xml");
			resultObj.put("fileManagerAllowFiles", array);
		}
		return resultObj.toJSONString();
	}
}
