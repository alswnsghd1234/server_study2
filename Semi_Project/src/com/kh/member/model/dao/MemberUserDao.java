package com.kh.member.model.dao;
import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import com.kh.member.model.vo.MemberUser;

public class MemberUserDao {
	
	private Properties prop = new Properties();
	
	public MemberUserDao() {
		String fileName = MemberUserDao.class.getResource("/db/member/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public MemberUser loginUser(Connection conn, String userId, String userPw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberUser m = null;
		String sql = prop.getProperty("loginMemberUser");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new MemberUser(rset.getInt("USER_NO")
						   ,rset.getString("USER_ID")
						   ,rset.getString("USER_PWD")
						   ,rset.getString("USER_NAME")
						   ,rset.getString("USER_NNAME")
						   ,rset.getDate("USER_BIRTH")
						   ,rset.getString("GENDER")
						   ,rset.getString("EMAIL")
						   ,rset.getString("PHONE")
						   ,rset.getString("ADDRESS")
						   ,rset.getDate("ENTERDATE")
						   ,rset.getString("U_STATUS")
						   ,rset.getInt("USER_RPC"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

}
