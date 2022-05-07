package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userNo = request.getParameter("userNo");
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		//방법 1) 매개변수 생성자 만들어서 해당 위치에 값 잘 넣기
//		Notice n = new Notice(noticeTitle,noticeContent,userNo);
		
		//방법2) 매개변수 생성자는 매개변수 위치 신경써야하니 헷갈릴수 있다 setter메소드 사용해서 넣기
		Notice n = new Notice();
		
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setNoticeWriter(userNo);
		
		int result=new NoticeService().insertNotice(n);
		
		if(result>0) {//성공했다면
			request.getSession().setAttribute("alertMsg", "공지사항 등록 완료");
			response.sendRedirect(request.getContextPath()+"/list.no");
		}else { //실패했다면 
			request.setAttribute("errorMsg", "공지사항 등록 실패");
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
