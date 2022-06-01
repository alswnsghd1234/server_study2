package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userPwd = request.getParameter("userPwd");
		//로그인한 회원의 아이디 정보 얻어오기 
		//방법 1) form에서 hidden으로 보내기 
		//String userId = request.getParameter("userId");
		
		//방법 2) session에 담겨있는 loginUser(로그인한 회원정보) 객체에 있는 아이디 꺼내오기
		HttpSession session = request.getSession();
		String userId=((Member)session.getAttribute("loginUser")).getUserId();
		
		int result = new MemberService().deleteMember(userId,userPwd);
		
		//성공 회원탈퇴 성공 메세지 alert창으로 띄우기  로그아웃 처리 해주기 페이지는 메인 페이지로 이동시키기.
		if(result>0) {
			session.setAttribute("alertMsg", "회원탈퇴에 성공하였읍니다. 안녕히 가십시오.");
			//invalidate() 메소드를 사용하면 세션이 초기화 되기때문에 alert 메세지까지 초기화된다.
			//removeAttribute() 를 사용해서 회원정보객체만 지워준다.
			session.removeAttribute("loginUser"); 
			response.sendRedirect(request.getContextPath());
			
		}else {//실패시 = 에러페이지로 보내서 에러 메세지 띄워주기
			request.setAttribute("errorMsg", "회원탈퇴에 실패하였읍니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
