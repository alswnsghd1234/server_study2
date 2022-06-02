package com.kh.notice.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {
	
	//공지사항 목록 조회 메소드
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn,pi);
		
		close(conn);
		
		return list;
		
	}


	//공지사항 세부 조회
	public ArrayList<Notice> selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> n=new NoticeDao().selectNotice(conn,noticeNo);
		
		close(conn);
		
		return n;
	}



	public int NoticeCount() {
		
		Connection conn = getConnection();
		
		int n=new NoticeDao().NoticeCount(conn);
		
		close(conn);
		
		return n;
	}


}
