package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
			private int boardNo;		//	BOARD_NO	NUMBER
			private int boardType;//	BOARD_TYPE	NUMBER
			private String category;	//	작성시 번호,조회시 카테고리명으로 조회    CATEGORY_NO	NUMBER
			private String boardTitle;//	BOARD_TITLE	VARCHAR2(100 BYTE)
			private String content;		//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
			private String boardWriter; //	작성시 번호, 조회시 이름 BOARD_WRITER	NUMBER
			private int count;//	COUNT	NUMBER
			private Date createDate;//	CREATE_DATE	DATE
			private String status; //	STATUS	VARCHAR2(1 BYTE)
			
			public Board() {
				super();
			}
			
			public Board(int boardNo, String category, String boardTitle, String boardWriter, int count,
					Date createDate) {
				super();
				this.boardNo = boardNo;
				this.category = category;
				this.boardTitle = boardTitle;
				this.boardWriter = boardWriter;
				this.count = count;
				this.createDate = createDate;
			}







			public Board(int boardNo, int boardType, String category, String boardTitle, String content,
					String boardWriter, int count, Date createDate, String status) {
				super();
				this.boardNo = boardNo;
				this.boardType = boardType;
				this.category = category;
				this.boardTitle = boardTitle;
				this.content = content;
				this.boardWriter = boardWriter;
				this.count = count;
				this.createDate = createDate;
				this.status = status;
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

			public String getBoardWriter() {
				return boardWriter;
			}

			public void setBoardWriter(String boardWriter) {
				this.boardWriter = boardWriter;
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
						+ ", boardTitle=" + boardTitle + ", content=" + content + ", boardWriter=" + boardWriter
						+ ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
			}
	
			
			
			
}
