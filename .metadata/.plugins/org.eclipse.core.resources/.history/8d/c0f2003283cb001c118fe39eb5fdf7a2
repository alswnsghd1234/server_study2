package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	//로그인 요청 서비스
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn,userId,userPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
		
	}

	
	//회원가입 서비스
	public int insertMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	//회원 정보 수정용 메소드
	public Member updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		//갱신된 회원 정보 객체 담을 변수
		Member updateMem = null;
		int result = new MemberDao().updateMember(conn,m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			//db에는 데이터가 변경 되었지만 session에 담겨있는 loginUser 객체정보는
			//갱신 되지 않았기 때문에 해당 처리를 해줘야 한다.
			updateMem = new MemberDao().selectMember(conn,m.getUserId());
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
	}

}
