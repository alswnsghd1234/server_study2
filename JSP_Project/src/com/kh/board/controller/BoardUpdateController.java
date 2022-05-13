package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//1_1 전송파일 용량 제한 (int maxSize)
			int maxSize = 10*1024*1024;
			
			//1_2 전달된 파일을 저장 시킬 서버의 물리적인 경로 알아내기 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			//2. 전달된 파일명 수정 작업후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			//3. sql문 실행에 필요한 전달값 꺼내기
		
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setCategory(category);
			b.setBoardTitle(boardTitle);
			b.setContent(content);
			
			//새롭게 전달된 첨부파일이 있을경우 필요한 값 뽑기
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("reUpfile")!=null) {
				//reUpfile로 새로운 파일을 올렸을때
				
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangename(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("resources/board_upfiles/");
				
				//첨부파일이 있을경우 원본파일의 파일번호,수정명을 hidden으로 넘김
				if(multiRequest.getParameter("originFileNo")!=null) {
					int originFileNo = Integer.parseInt(multiRequest.getParameter("originFileNo"));
					//원래있던 파일이 있는데 새로운 첨부파일을 넣었을때
					at.setFileNo(originFileNo);
					//기존 파일 삭제
					new File(savePath+multiRequest.getParameter("originFileName")).delete();
					
				}else {
					//원래 첨부 파일이 없고 새로운 첨부파일만 있을때
					//Insert Attachment
					//+현재 게시글 번호
					at.setRefNo(boardNo);
					
				}
			}
			
			int result = new BoardService().updateBoard(b,at);
			
			if(result>0) { //성공
				request.getSession().setAttribute("alertMsg", "게시글 수정 성공");
				
				response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+boardNo);
			}else {//실패
				request.setAttribute("errorMsg", "게시글 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			
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
