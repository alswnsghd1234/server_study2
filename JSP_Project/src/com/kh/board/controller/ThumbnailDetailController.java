package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class ThumbnailDetailController
 */
@WebServlet("/detail.th")
public class ThumbnailDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		//일반게시판에서 사용했던 조회수 증가 메소드랑 select문을 다시 사용한다
		int result = new BoardService().increaseCount(boardNo);
		
		if(result>0) {
			//성공시
			//일반게시판 게시글 조회용 쿼리문 selectBoard를 활용할것인데 기존 내부조인의 경우 일치하는 컬럼만 가져오는 구조
			//사진게시판같은 경우는 카테고리가 NULL이기때문에 일치하는것이 없다 고로 조회 불가 
			//카테고리 컬럼을 기준으로 일치하는 컬럼,일치하지 않는 컬럼 다 가져오기 위해 외부 조인으로 변경
			//왼쪽 테이블(BOARD)을 기준으로 조인하겠다. 
			
			Board b = new BoardService().selectBoard(boardNo);
			
			ArrayList<Attachment> list= new BoardService().selectAttachmentList(boardNo);
			
			request.setAttribute("b",b);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/board/thumbnailDetailView.jsp").forward(request, response);
			
		}else {//실패 - 에러페이지
			request.setAttribute("errorMsg", "상세보기 실패");
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
