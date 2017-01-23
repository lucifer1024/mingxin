package com.liuzx.mingxin.service;

import org.springframework.stereotype.Service;

import com.liuzx.mingxin.domain.Video;

@Service
public class VideoService {
	private static Video video = new Video();
	static{
		video.setHfVideoNO("50456861");
		video.setHfSubVideoNO("50456861");
	}
	public Video getVideo(){
		return video;
	}
	
}
