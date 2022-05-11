package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.common.PageInfo;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/db/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		

	public int selectListCount(Connection conn) {

		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");  // 나올 행이 하나뿐이기 때문에 while문이 아닌 if문 사용
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
		
		String sql = prop.getProperty("selectlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//위치홀더에 넣어줄 범위를 구해야함
			//boardLimit = 10; 10개씩
			//currentPage= 1 => 시작값 1 끝 10
			//currentPage= 2 => 시작값 11 끝 20
			//currentPage= 3 -> 시작값 21 끝 31
			
			
			//시작값 = (currenPage-1)*boardLimit +1
			//끝값  = 시작값 + boardLimit
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
									rset.getString("CATEGORY_NAME")
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

}
