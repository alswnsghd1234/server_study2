package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Person;

/**
 * Servlet implementation class ElServlet
 */
@WebServlet("/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * 데이터들을 담을 수 있는 JSP 내장 객체 종류 (scope == 영역)
		 * 1.ServletContext (Application scope)
		 * 한 애플리케이션 1개만 존재하는 객체 
		 * 이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능하다. 
		 * 공유범위가 가장 크다.
		 * 
		 * 2.HttpSession (session scope)
		 * 한 브라우저 당 하나씩 존재하는 객체
		 * 이 영역에 데이터를 담으면 jsp/servlet에서 사용가능
		 * 공유범위가 다소 제한적이다.
		 * 값이 담기면 브라우저가 닫히거나 서버가 종료되기 전까지 사용 가능
		 * 
		 * 3.HttpServletRequest (request scope)
		 * 요청 및 응답시 매번 생성되는 객체
		 * 이 영역에 데이터를 담으면 request 객체를 포워딩 받는 응답 jsp에서 사용 가능 (1회성)
		 * 공유범위가 해당 요청에 대한 응답 jsp 하나뿐
		 * 
		 * 4.PageContext (page Scope)
		 * 현재 그 jsp 페이지에서만 사용 가능
		 * 공유 범위가 가장 작다 (해당 페이지만)
		 * 
		 * 위에 객체에 데이터를 담을 때 .setAttribute("키","데이터");
		 *			           꺼낼 때 .getAttribute("키");
		 *				  지우고자 할때 .removeAttribute("키") 
		 * */
		
		//requestScope에 담기
		request.setAttribute("food", "점심메뉴");
		request.setAttribute("student",new Person("김날씨",20,"남자"));
		//sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("drink", "아이스아메리카노");
		session.setAttribute("teacher", new Person("어문경",20,"남자"));
		
		//request 와 session에 같은 키값으로 담기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		//applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		request.getRequestDispatcher("views/1_EL/01_el.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
