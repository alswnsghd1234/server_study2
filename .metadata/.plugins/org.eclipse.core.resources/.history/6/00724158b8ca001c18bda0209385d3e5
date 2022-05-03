package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/db/member/member-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
			
		//SELECT 문 -> 결과행이 1개 또는 0개 왜? userId가 unique이기 때문에 (중복불가) 
		//결과값인 resultset을 member객체에 담아서 응답하기
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {//조회결과가 있으면
				m = new Member(rset.getInt("USER_NO")
							   ,rset.getString("USER_ID")
							   ,rset.getString("USER_PWD")
							   ,rset.getString("USER_NAME")
							   ,rset.getString("PHONE")
							   ,rset.getString("EMAIL")
							   ,rset.getString("ADDRESS")
							   ,rset.getString("INTEREST")
							   ,rset.getDate("ENROLL_DATE")
							   ,rset.getDate("MODIFY_DATE")
							   ,rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
		
	}
	
}
