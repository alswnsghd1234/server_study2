package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.common.PageInfo;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ---------------------페이징 처리-----------------
		int listCount; //현재 총 게시글 개수
		int currentPage; //현재 페이지(사용자가 요청한 페이지)
		int pageLimit; //페이지 하단에 보이는 페이징 페이지 최대 개수
		int boardLimit; //한 페이지에서 보여질 게시글 개수
		
		int maxPage; //가장 마지막 페이지가 몇번페이지인지 (총 페이지수)
		int startPage; //페이지 하단에 보여질 페이징 시작 수
		int endPage; //페이지 하단에 보여질 페이징 끝 수
		
		listCount = new BoardService().selectListCount(); // listCount 현재 총 게시글 개수
		
//		System.out.println(listCount);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 10;
		
		//maxPage 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 수)
		//1)listCount 와 boardLimit의 영향을 받는다
		//2)listCount/boardLimit
		//3)결과를 올림처리 Math.ceil() 메소드 호출
		//4)결과값을 다시 int 자료형으로 형변환 시켜준다
		
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		//startPage 페이지 하단에 보여질 페이징 시작수
		//pageLimit와 currentPage 에 영향을 받는다
		
		//startPage = 1,11,21,31,41,51,61,71.....
		//만약 pageLimit을 5로 설정했을때 = 1,6,11,16.....5의 배수 +1
		// n * pageLimit+1
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		//endPage = 페이지 하단에 보여질 페이징 끝 수
		// startPage,pageLimit에 영향을 받는다
		//pageLimit을 10이라고 가정했을 때
		// startPage= 1 endPage=10
		// startPage=11 endPage=20
		// startPage=21 endPage=30
		
		endPage = startPage+pageLimit -1;
		
		//maxPage 13일 경우 기존대로 작성하면 endPage가 20이 나오기 때문에 변경해주는 처리가 필요함
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		//페이지 정보들을 요청 처리 보내면 된다.
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit
									,maxPage,startPage,endPage);
		
		//2. 사용자가 요청한 페이지(currentPage)에 보여질 게시글 리스트 요청하기
		ArrayList<Board> list = new BoardService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/board/boardListView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
