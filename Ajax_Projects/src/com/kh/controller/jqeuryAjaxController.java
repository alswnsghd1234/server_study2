package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class jqeuryAjaxController
 */
@WebServlet("/jqAjax1.do")
public class jqeuryAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jqeuryAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청처리를 위해 이동해야함 404
		String str = request.getParameter("input");
//		System.out.println(str);
		String responseDate = "입력한 값:"+str+"길이"+str.length();
		//응답데이터에 한글이 포함될경우
		//응답데이터에 대한 type(text/html) charset(charset=UTF-8) 지정
		response.setContentType("text/html; charset=UTF-8");
		
		//getWriter() : jsp와의 연결 통로를 열어주는 메소드
		response.getWriter().print(responseDate);
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
