package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;			//	NOTICE_NO	NUMBER
	private String noticeTitle;//	NOTICE_TITLE	VARCHAR2(100 BYTE)
	private String noticeContent;//	NOTICE_CONTENT	VARCHAR2(4000 BYTE) 
	private Date createDate;//	CREATE_DATE	DATE
	private int noticeViewNo;
	private String noticeWriter;
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	private int userNo;
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date createDate, int noticeViewNo,
			String noticeWriter, String status, int userNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.noticeViewNo = noticeViewNo;
		this.noticeWriter = noticeWriter;
		this.status = status;
		this.userNo = userNo;
	}
	
	

	public Notice(int noticeNo, String noticeTitle, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
	}
	
	

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date createDate, String noticeWriter,
			String status) {
		super();
		this.noticeNo = noticeNo; //NOTICE_NO
		this.noticeTitle = noticeTitle; //NOTICE_TITLE
		this.noticeContent = noticeContent; // NOTICE_CONTENT
		this.createDate = createDate; //NOTICE_DATE
		this.noticeWriter = noticeWriter; //NOTICE_WRITER
		this.status = status; //NOTICE_STATUS
	}



	public Notice(int noticeNo, String noticeTitle) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getNoticeViewNo() {
		return noticeViewNo;
	}

	public void setNoticeViewNo(int noticeViewNo) {
		this.noticeViewNo = noticeViewNo;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", createDate=" + createDate + ", noticeViewNo=" + noticeViewNo + ", noticeWriter=" + noticeWriter
				+ ", status=" + status + ", userNo=" + userNo + "]";
	}
	


	
	

}
