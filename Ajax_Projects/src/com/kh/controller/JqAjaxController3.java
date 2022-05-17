package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.modle.vo.Member;

/**
 * Servlet implementation class JqAjaxController3
 */
@WebServlet("/jqAjax3.do")
public class JqAjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memberNo = Integer.parseInt(request.getParameter("no"));
		
		//데이터를 조회해왔다는 가정하에 member 객체에 해당 정보 담기
		Member m = new Member(1,"이민기",33,"남");
		
//		response.getWriter().print(m);
		
		//{속성:속성값, 속성:속성값...}
//		JSONObject jobj = new JSONObject(); ///{}
//	
//		jobj.put("memberNo",m.getMemberNo());
//		jobj.put("name",m.getName());
//		jobj.put("age",m.getAge());
//		jobj.put("gender",m.getGender());
//		
//		response.setContentType("application/json; charset=UTF-8");
//		response.getWriter().print(jobj);
		
		//GSON : Google JSON을 뜻한다.
		//GSON : 라이브러리 이용해야함
		//https://mvnrepository.com/artifact/com.google.code.gson/gson/2.8.5
		
		 response.setContentType("application/json; charset=UTF-8");
		 Gson gson = new Gson();
		 //toJson(응답할객체,응답할스트릠(연결통로))
		 //response.getWriter라는 통로로 m이라는 객체를 응답하겠다.
		 //변환시 자동으로 객체의키값이 정해진다
		 gson.toJson(m,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
