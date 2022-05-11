package com.kh.board.model.vo;

import java.sql.Date;

public class Board {

	
					private int boardNo;	//	BOARD_NO	NUMBER
					private int boardType;	//	BOARD_TYPE	NUMBER
					private String category;	//	CATEGORY_NO	NUMBER
					private String boardTitle;	//	BOARD_TITLE	VARCHAR2(100 BYTE)
					private String content;	//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
					private String baordwriter;	//	BOARD_WRITER	NUMBER
					private int count;	//	COUNT	NUMBER
					private Date createDate;	//	CREATE_DATE	DATE
					private String status;	//	STATUS	VARCHAR2(1 BYTE)
					
					

					public Board(int boardNo, int boardType, String category, String boardTitle, String content,
							String baordwriter, int count, Date createDate, String status) {
						super();
						this.boardNo = boardNo;
						this.boardType = boardType;
						this.category = category;
						this.boardTitle = boardTitle;
						this.content = content;
						this.baordwriter = baordwriter;
						this.count = count;
						this.createDate = createDate;
						this.status = status;
					}
					public Board() {
						super();
					}
					
					
					public Board(int boardNo, String category, String boardTitle, String baordwriter, int count,
							Date createDate) {
						super();
						this.boardNo = boardNo;
						this.category = category;
						this.boardTitle = boardTitle;
						this.baordwriter = baordwriter;
						this.count = count;
						this.createDate = createDate;
					}
					public int getBoardNo() {
						return boardNo;
					}
					public void setBoardNo(int boardNo) {
						this.boardNo = boardNo;
					}
					public int getBoardType() {
						return boardType;
					}
					public void setBoardType(int boardType) {
						this.boardType = boardType;
					}
					public String getCategory() {
						return category;
					}
					public void setCategory(String category) {
						this.category = category;
					}
					public String getBoardTitle() {
						return boardTitle;
					}
					public void setBoardTitle(String boardTitle) {
						this.boardTitle = boardTitle;
					}
					public String getContent() {
						return content;
					}
					public void setContent(String content) {
						this.content = content;
					}
					public String getBaordwriter() {
						return baordwriter;
					}
					public void setBaordwriter(String baordwriter) {
						this.baordwriter = baordwriter;
					}
					public int getCount() {
						return count;
					}
					public void setCount(int count) {
						this.count = count;
					}
					public Date getCreateDate() {
						return createDate;
					}
					public void setCreateDate(Date createDate) {
						this.createDate = createDate;
					}
					public String getStatus() {
						return status;
					}
					public void setStatus(String status) {
						this.status = status;
					}
					

					@Override
					public String toString() {
						return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", category=" + category
								+ ", boardTitle=" + boardTitle + ", content=" + content + ", baordwriter=" + baordwriter
								+ ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
					}
}

