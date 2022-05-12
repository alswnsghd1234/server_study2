package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.common.PageInfo;


public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/db/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		
		int listCount = 0; 
		
		PreparedStatement pstmt = null;
		
		ResultSet rset=null;
		
		String sql= prop.getProperty("selectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT"); //나올 행이 하나뿐이기 때문에 while문이 아닌 if문 사용
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		//select문의 결과가 여러행이 나올수 있기때문에 리스트 만들어둠
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//위치홀더에 넣어줄 범위를 구해야함 
			//boardLimit = 10; 10개씩 
			//currentPage= 1 => 시작값 1 끝 10
			//currentPage= 2 => 시작값 11 끝 20
			//currentPage= 3 => 시작값 21 끝 30
			
			//시작값 = (currentPage-1)*boardLimit + 1
			//끝값 = currntPage*boardLimit
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			//BOARD_NO,CATEGORY_NAME,BOARD_TITLE,USER_NAME,COUNT,CREATE_DATE
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								   ,rset.getString("CATEGORY_NAME")
								   ,rset.getString("BOARD_TITLE")
								   ,rset.getString("USER_NAME")
								   ,rset.getInt("COUNT")
								   ,rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public ArrayList<Category> selectCategoryList(Connection conn) {
		
		//select문 준비물
		ArrayList<Category> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("CATEGORY_NO")
									 ,rset.getString("CATEGORY_NAME")));
				
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public int insertBoard(Connection conn, Board b) {
		//insert문 -> 처리된 행의 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getCategory()));
			pstmt.setString(2,b.getBoardTitle());
			pstmt.setString(3, b.getContent());
			pstmt.setInt(4, Integer.parseInt(b.getBoardWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangename());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	

}
