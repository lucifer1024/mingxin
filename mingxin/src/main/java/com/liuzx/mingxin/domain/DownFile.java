package com.liuzx.mingxin.domain;

import java.util.Date;

public class DownFile {
	private String fileNo ;
	private String title;
	private String fileName;
	private double fileSize;
	private String fileSizeUnit;
	private Date uploadDate;
	private String fileDesc;
	private String filePath;
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileSizeUnit() {
		return fileSizeUnit;
	}
	public void setFileSizeUnit(String fileSizeUnit) {
		this.fileSizeUnit = fileSizeUnit;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}
