package com.kh.member_2.model.dao;
import static com.kh.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.memManage.model.dao.memManageDao;
import com.kh.member_2.model.vo.MemberUser;

public class MemberUserDao {
	private Properties prop = new Properties();
	public MemberUserDao() {
		String fileName = memManageDao.class.getResource("/db/memberUser/memberUser-mapper.xml").getPath();
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
		MemberUser mu = null;
		String sql = prop.getProperty("loginMemberUser");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mu = new MemberUser(rset.getInt("USER_NO"),
						rset.getString("USER_NNAME"),
						rset.getString("U_STATUS"),
						rset.getDate("BAN_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mu;
	}

}
