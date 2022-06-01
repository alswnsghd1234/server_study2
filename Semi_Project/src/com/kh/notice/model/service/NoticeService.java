package com.kh.notice.model.service;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {
	
	//공지사항 목록 조회 메소드
	public ArrayList<Notice> selectNoticeList() {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
		
	}



	public ArrayList<Notice> selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> n=new NoticeDao().selectNotice(conn,noticeNo);
		
		close(conn);
		
		return n;
	}


}
