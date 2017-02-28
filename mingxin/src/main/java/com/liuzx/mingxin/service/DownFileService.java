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
			file.setFileName("中瑞达PC版客户端.zip");
			file.setTitle("中瑞达PC版客户端");
			file.setFileSize(20.);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("中瑞达PC版客户端");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("中瑞达安卓手机版安装包.zip");
			file.setTitle("中瑞达安卓手机版安装包");
			file.setFileSize(10.6);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("中瑞达安卓手机版安装包");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("中瑞达商品交易服务行情.rar");
			file.setTitle("中瑞达商品交易服务行情");
			file.setFileSize(8.47);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("中瑞达商品交易服务行情");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("兴蜀大宗交易软件.exe");
			file.setTitle("兴蜀大宗交易软件");
			file.setFileSize(1.44);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("兴蜀大宗交易软件");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("兴蜀.exe");
			file.setTitle("兴蜀");
			file.setFileSize(3.62);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("兴蜀交易软件");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
		{
			DownFile file = new DownFile();
			file.setFileNo(UUIDGenerator.getUUID());
			file.setFileName("兴蜀大宗产品规则表.jpg");
			file.setTitle("兴蜀大宗产品规则表");
			file.setFileSize(1.44);
			file.setFileSizeUnit("MB");
			file.setUploadDate(new Date());
			file.setFileDesc("兴蜀大宗产品规则表");
			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
			list.add(file);
		}
//		{
//			DownFile file = new DownFile();
//			file.setFileNo(UUIDGenerator.getUUID());
//			file.setFileName("大贵中心-行情分析软件.exe");
//			file.setTitle("大贵中心-行情分析软件");
//			file.setFileSize(8.71);
//			file.setFileSizeUnit("MB");
//			file.setUploadDate(new Date());
//			file.setFileDesc("");
//			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
//			list.add(file);
//		}
//		{
//			DownFile file = new DownFile();
//			file.setFileNo(UUIDGenerator.getUUID());
//			file.setFileName("大贵中心-模拟盘交易客户端（Win7版）.exe");
//			file.setTitle("大贵中心-模拟盘交易客户端（Win7版）");
//			file.setFileSize(2.76);
//			file.setFileSizeUnit("MB");
//			file.setUploadDate(new Date());
//			file.setFileDesc("");
//			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
//			list.add(file);
//		}
//		{
//			DownFile file = new DownFile();
//			file.setFileNo(UUIDGenerator.getUUID());
//			file.setFileName("大贵中心-模拟盘交易客户端（WinXP版）.exe");
//			file.setTitle("大贵中心-模拟盘交易客户端（WinXP版）");
//			file.setFileSize(13.0);
//			file.setFileSizeUnit("MB");
//			file.setUploadDate(new Date());
//			file.setFileDesc("");
//			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
//			list.add(file);
//		}
//		{
//			DownFile file = new DownFile();
//			file.setFileNo(UUIDGenerator.getUUID());
//			file.setFileName("大贵中心-实盘交易客户端（Win7版）.exe");
//			file.setTitle("大贵中心-实盘交易客户端（Win7版）");
//			file.setFileSize(2.76);
//			file.setFileSizeUnit("MB");
//			file.setUploadDate(new Date());
//			file.setFileDesc("");
//			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
//			list.add(file);
//		}
//		{
//			DownFile file = new DownFile();
//			file.setFileNo(UUIDGenerator.getUUID());
//			file.setFileName("大贵中心-实盘交易客户端（WinXP版）.exe");
//			file.setTitle("大贵中心-实盘交易客户端（WinXP版）");
//			file.setFileSize(13.0);
//			file.setFileSizeUnit("MB");
//			file.setUploadDate(new Date());
//			file.setFileDesc("");
//			file.setFilePath("/File/DownLoadFiles/"+file.getFileName());
//			list.add(file);
//		}
	}
	public List<DownFile> selectDownFile(){
		return list;
	}
	
}
