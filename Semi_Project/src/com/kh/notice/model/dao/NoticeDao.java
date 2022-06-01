package com.kh.notice.model.dao;
import static com.kh.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.notice.model.vo.Notice;
import com.kh.product.model.vo.Product;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/db/notice/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Notice> selectNoticeList(Connection conn) {
		
		//SELECT문 - > ResultSet 객체 (여러 행)
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NOTICE_NO")
									,rset.getString("NOTICE_TITLE")
									,rset.getDate("NOTICE_DATE")
									));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	

	public ArrayList<Notice> selectNotice(Connection conn, int noticeNo) {
		//select문으로 noticeNo에 해당하는 글 1개 or 0개 조회
		ArrayList<Notice> nt = new ArrayList<>();
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		System.out.println(noticeNo);
		String sql=prop.getProperty("noticedetailmain");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				nt.add(new Notice(rset.getInt("NOTICE_NO")
							,rset.getString("NOTICE_TITLE")
							,rset.getString("NOTICE_CONTENT")
							,rset.getDate("NOTICE_DATE")
							,rset.getString("NOTICE_WRITER")
							,rset.getString("NOTICE_STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return nt;
	}
}
