package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ThumbnailInsertController
 */
@WebServlet("/insert.th")
public class ThumbnailInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//전달된 request객체가 multipart/form-data 형식인지 
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//1_1 전송 용량 제한
			int maxSize = 10 * 1024 * 1024;
			
			//1_2 저장할 물리 경로 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			
			//2. 파일명 수정객체까지 등록해서 서버업로드
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			//3. DB에 전달할 값을 받아오기
			//board에 들어갈 정보 
			Board b = new Board();
			
			b.setBoardWriter(multiRequest.getParameter("userNo"));
			b.setBoardTitle(multiRequest.getParameter("boardTitle"));
			b.setContent(multiRequest.getParameter("boardContent"));
			
			//Attachment에 들어갈 정보
			//하나 이상 나올것이기 때문에 list에 담아서 보내기 (대표이미지에 required)
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			//파일의 개수는 최대 4개이고 각 네임값은 file1~4 까지이니까 해당 키값 반복해서 꺼내어 넣기
			for(int i=1; i<=4; i++) {
				String key = "file"+i;
				
				if(multiRequest.getOriginalFileName(key)!=null) {
					//첨부파일이 존재할경우 Attachment객체에 값 넣고 list에 추가
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangename(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/thumbnail_upfiles/");
					
					if(i==1) {//대표이미지일 경우
						at.setFileLevel(1);
					}else {//상세이미지일 경우
						at.setFileLevel(2);
					}
					list.add(at);
				}
			}
			
			int result = new BoardService().insertThumbnailBoard(b,list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath()+"/list.th");
			}else {
				request.setAttribute("errorMsg", "사진게시판 작성 실패");
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
