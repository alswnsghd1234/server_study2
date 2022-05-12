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
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setCharacterEncoding("UTF-8");
			
//			String category = request.getParameter("category");
//			String title = request.getParameter("title");
//			form전송을 일반방식이 아닌 multipart/form-data로 전송하는 경우
//			request에서 값을 꺼낼수 없다. multipart라는 객체에 값을 넣어서 꺼내줘야한다.
			//enctype이 multipart/form-data라는 형식이냐? 
			if(ServletFileUpload.isMultipartContent(request)) {
//				System.out.println("실행되나요..?");
				
				//파일 업로드를 위한 라이브러리 cos.jar
				
				//1. 전송되는 파일을 처리할 작업 내용(전송되는 파일의 용량제한,전달된 파일을 저장할 폴더 경로)
				//1_1. 전송파일 용량제한 (int maxSize => byte값을 기술)
				/*
				 * 단위 정리
				 * byte ->kbyte->mbyte->gbyte->tbyte ...
				 * 1kbyte = 1024 byte 2의 10제곱
				 * 1mbyte = 1024 kbyte 1024 * 1024 2의 20제곱 
				 */

				//10mbyte로 제한
				int maxSize = 10 * 1024 * 1024; 
				
				/*
				 * 1_2 전달된 파일을 저장할 서버의 폴더 경로 알아내기 (String savePath)
				 * 세션객체에서 제공하는 getRealPath 메소드를 통해서 알아내기
				 * WebContent 폴더로부터 board_upfiles폴더까지의 경로를 제시해야한다.
				 * 경로 마지막에 / 추가해야한다 board_upfiles/ 왜냐하면 board_upfiles 내부에 저장될것이니까.
				 * 
				 * */
				//상대경로 구하는 방법 
				String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
				//결과값 = 절대경로주소
				//System.out.println(savePath);
				/*
				 * 2. 전달된 파일명 수정과 서버에 업로드 작업 
				 * -HttpServletRequest request -> MultipartRequest multiRequest 로 변환 
				 * 
				 * 매개변수 생성자로 생성 (cos.jar 에서 제공)
				 * MultipartRequest multiRequest = new MultipartRequest(request,저장될폴더경로,용량제한,인코딩값,파일명수정객체);
				 * 
				 * 위에 구문 한줄로 첨부파일이 해당 폴더에 업로드 된다.
				 * 보통 사용자가 올린 파일명을 그대로 사용하지 않고 변경해서 사용함 (그래서 있는게 파일명 수정객체 )
				 * 같은 파일명일 경우 덮어씌워질수 있고 한글/특수문자/띄어쓰기가 포함된경우 서버에 따라서 문제가 생길 여지가 있음. 
				 * 
				 * 기본제공되는 파일명 수정 객체 
				 * DefaultFileRenamePolicy 객체 (cos.jar에서 제공하는 객체)
				 * 내부적으로 rename() 메소드가 실행이 되면서 파일명 수정이 진행된다.
				 * 만약 동일한 파일명을 가진 파일 업로드되면 파일명 뒤에 숫자를 카운트해서 붙여준다.
				 * dog.jpg,dog1.jpg,dog2.jpg ....
				 * 
				 * 우리의 마음대로 rename설정을 해서 객체를 넣어보자
				 * com.kh.common.MyFileRenamePolicy 만들기 
				 * */
				MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
				
				/*
				 * 3. DB에 기록할 데이터들을 뽑아서 Attachment객체에 담기
				 * -카테고리,제목,내용,작성자번호 가져와서 board테이블에 넣기
				 * -만약 첨부파일도 넘어왔다면 원본명,수정명,경로 뽑아서 Attachment테이블에 넣기
				 * */
				String category = multiRequest.getParameter("category");
				String boardTitle = multiRequest.getParameter("title");
				String content = multiRequest.getParameter("content");
				String boardWriter = multiRequest.getParameter("userNo");
				
				Board b = new Board();
				b.setCategory(category);
				b.setBoardTitle(boardTitle);
				b.setContent(content);
				b.setBoardWriter(boardWriter);
				
				Attachment at = null; //처음에는 null로 초기화 있을때 객체생성해서 가져가기 
				//multiRequest.getOriginalFileName("키");
				//첨부파일이 있으면 원본명 / 없으면 null 
				if(multiRequest.getOriginalFileName("upfile")!=null) { //첨부파일이 있으면
					
					at=new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName("upfile")); //원본명
					at.setChangename(multiRequest.getFilesystemName("upfile")); //수정명 (실제 서버에 업로드 되어있는 파일명)
					at.setFilePath("resources/board_upfiles/");
				}
				
				
				//4.서비스 요청
				int result = new BoardService().insertBoard(b,at);
				
				if(result>0) {//성공했다면 list.bo?cpage=1 (최신글 기준 정렬이라)
					
					request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
					response.sendRedirect(request.getContextPath()+"/list.bo?cpage=1");;
					
					
				}else {//실패 - 첨부파일이 있었을 경우 이미 업로드된 첨부파일이 있음으로 보관할 필요 없으니 삭제
					
					if(at!=null) { //첨부파일이 있을때
						//삭제시키고자하는 파일객체 생성 후 delete메소드 호출
						new File(savePath+at.getChangename()).delete();
					}
					request.setAttribute("errorMsg", "게시글 작성 실패");
					request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
					
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
