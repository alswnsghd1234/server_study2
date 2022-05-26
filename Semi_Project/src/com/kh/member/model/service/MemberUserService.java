package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.member.model.dao.MemberUserDao;
import com.kh.member.model.vo.MemberUser;
public class MemberUserService {

	public MemberUser loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		MemberUser m = new MemberUserDao().loginUser(conn, userId, userPwd);
		close(conn);
		return m;
	}

}
