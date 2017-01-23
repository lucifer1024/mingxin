package com.liuzx.mingxin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.liuzx.mingxin.domain.DownFile;
import com.liuzx.mingxin.utils.UUIDGenerator;

@Service
public class DownFileService {
	private static List<DownFile> list = new ArrayList<DownFile>();
	static{
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("大贵中心-行情分析软件.exe");
			file.setTitle("大贵中心-行情分析软件");
			file.setFileSize(8.71);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("大贵中心-模拟盘交易客户端（Win7版）.exe");
			file.setTitle("大贵中心-模拟盘交易客户端（Win7版）");
			file.setFileSize(2.76);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("大贵中心-模拟盘交易客户端（WinXP版）.exe");
			file.setTitle("大贵中心-模拟盘交易客户端（WinXP版）");
			file.setFileSize(13.0);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("大贵中心-实盘交易客户端（Win7版）.exe");
			file.setTitle("大贵中心-实盘交易客户端（Win7版）");
			file.setFileSize(2.76);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("大贵中心-实盘交易客户端（WinXP版）.exe");
			file.setTitle("大贵中心-实盘交易客户端（WinXP版）");
			file.setFileSize(13.0);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
	}
	public List<DownFile> selectDownFile(){
		return list;
	}
	
}
