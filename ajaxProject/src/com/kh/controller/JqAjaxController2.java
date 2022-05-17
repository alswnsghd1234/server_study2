package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class JqAjaxController2
 */
@WebServlet("/jqAjax2.do")
public class JqAjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		//ajax는 결과를 한개만 응답할 수 있다.
		//방법 1
		//요청처리를 다 했다는 가정하에 응답할 데이터(문자열)
		/*
		String responseData = "이름 "+name+" 나이 "+age;
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseData);
		*/
		
		//ajax로 결과를 여러개 응답하고 싶을 경우
		//요청처리를 다 했다는 가정하에 문자열 응답
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print(name);
//		response.getWriter().print(age);
		//하나의 문자열로 이어져서 응답됨
		
		//방법2 - 응답데이터 여러개 응답하기 - JSON방식 사용
		/*
		 * JSON (JavaScript Object Notation : 자바스크립트 객체 표기법)
		 * -ajax 통신시 데이터 전송에 사용되는 포멧형식중 하나
		 * 
		 * -JSON 기본적으로 제공하지 않아서 외부 라이브러리 사용 
		 * - https://code.google.com/archive/p/json-simple/downloads
		 * - json-simple-1.1.1.jar 다운받아서 lib에 넣기
		 * 
		 * 1.JSONArray[value, value, value] - 배열 형태
		 * 2.JSONObject{key:value,key:value} - 객체 형태
		 * */
		
//		JSONArray jArr = new JSONArray(); // []
//		jArr.add(name); //["김철수"]
//		jArr.add(age); // ["김철수",33]
//		
//		//응답할 데이터의 content타입을 제대로 지정해야 기존처럼 문자열로 나오지 않고 json처리되어 나옴
//		response.setContentType("application/json; charset=UTF-8");
//
//		response.getWriter().print(jArr);
		
		//JSONObject 방식으로 응답하기
		JSONObject jobj = new JSONObject(); // {}
		jobj.put("name", name); //{name:"김철수"}
		jobj.put("age",age);  // {name:"김철수",age:20}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jobj);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
