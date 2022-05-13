package com.kh.board.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int fileNo;						//	FILE_NO	NUMBER
	private int refNo;						//	REF_BNO	NUMBER
	private String originName;						//	ORIGIN_NAME	VARCHAR2(255 BYTE)
	private String changename;						//	CHANGE_NAME	VARCHAR2(255 BYTE)
	private String filePath;						//	FILE_PATH	VARCHAR2(1000 BYTE)
	private Date uploadDate;						//	UPLOAD_DATE	DATE
	private int fileLevel;						//	FILE_LEVEL	NUMBER
	private String status;						//	STATUS	VARCHAR2(1 BYTE)
	
	public Attachment() {
		super();
	}

	public Attachment(int fileNo, int refNo, String originName, String changename, String filePath, Date uploadDate,
			int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.originName = originName;
		this.changename = changename;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}
	
	

	public Attachment(int fileNo, String originName, String changename, String filePath) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changename = changename;
		this.filePath = filePath;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refNo=" + refNo + ", originName=" + originName + ", changename="
				+ changename + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", status=" + status + "]";
	}

	
	
	
	
	
}
