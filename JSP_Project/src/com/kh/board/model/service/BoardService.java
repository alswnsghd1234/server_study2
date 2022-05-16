package com.kh.board.model.service;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.common.PageInfo;

public class BoardService {

	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		
		ArrayList<Category> list = new BoardDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertBoard(Board b, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn,b);
		
		int result2 = 1;
		
		if(at != null) {
			
			result2 = new BoardDao().insertAttachment(conn,at);
			
			}
		
		//트랜잭션 처리
		if(result1>0 && result2 >0) {
			//첨부파일이 없는 경우에도 insert가 성공 했을때 result2는 여전히 0이라 rollback됨
			//그래서 미리 result2를 1로 초기화해놓고 
			//result1이 성공하면 commit 될수있도록 작업 
			commit(conn);
		}else {
			rollback(conn);
		}
		
		//하나라도 실패해서 0이되면 실패값을 반환할수있도록 곱셈연산 후 리턴 
		return result1 * result2;
	}
	
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo); //처리된 행수(성공/실패)
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo); //조회결과
		
		close(conn);
		
		return b;
	}
	public Attachment selectAttachment(int boardNo) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, boardNo);
		
		close(conn);
		
		return at;
	}

	public int updateBoard(Board b, Attachment newAttachment) {
		Connection conn = getConnection();
		
		
		
		int result1 = new BoardDao().updateBoard(conn,b,newAttachment);
		
		int result2 = 1;
		
		//파일이 있다면
		if(newAttachment != null) {
			
			//기존의 첨부파일이 있었을경우 -update
			if(newAttachment.getFileNo()!=0) {
				result2 = new BoardDao().updateAttachment(conn, newAttachment);
				
			}else {//기존의 첨부파일이 없었을 경우 -insert
				result2 = new BoardDao().insertNewAttachment(conn, newAttachment);
				
			}
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public int deleteBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn,boardNo);
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
			
		}
		close(conn);
		return result;
		
	}

	public int insertThumbnailBoard(Board b, ArrayList<Attachment> list) {

		Connection conn = getConnection();
		
		
		int result1 = new BoardDao().insertThumbnailBoard(conn, b);
		int result2 = new BoardDao().insertAttachmentList(conn, list);
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	return result1 * result2;
	}

	public ArrayList<Board> selectThumbnaiList() {

		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThumbnailList(conn);
		
		close(conn);
		
		return list;
	}
}
