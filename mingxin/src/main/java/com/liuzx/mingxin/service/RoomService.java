package com.liuzx.mingxin.service;

import org.springframework.stereotype.Service;

import com.liuzx.mingxin.domain.Room;

@Service
public class RoomService {
	private static Room room = new Room();
	static{
		room.setId(1);
		room.setRoomId("100001");
		room.setName("铭鑫财富");
		room.setLineNum(0);
		room.setShowLineNum(1000);
		
	}
	public Room selectById(String roomId){
		return room;
	}
	
}
