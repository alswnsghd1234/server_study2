package com.kh.board.model.vo;

public class Reply {
	
	//REPLY_NO,REPLY_CONTENT,USER_ID,TO_CHAR(CREATE_DATE,'YY/MM/DD/ HH:MI:SS') CREATE_DATE
	
	private int replyNo;
	private String replyContent;
	private int refBno;
	private String replyWriter;
	private String creatDate;
	private String status;
	
	public Reply() {
		super();
	}

	public Reply(int replyNo, String replyContent, int refBno, String replyWriter, String creatDate, String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.creatDate = creatDate;
		this.status = status;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(String creatDate) {
		this.creatDate = creatDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refBno=" + refBno + ", replyWriter="
				+ replyWriter + ", creatDate=" + creatDate + ", status=" + status + "]";
	}
	
	
	
}
