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
	
	public int increaseCount(Connection conn,int boardNo) {
		//update 문 => 처리된 행의 수 
		int result = 0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate(); //처리된 행 수 
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Board selectBoard(Connection conn,int boardNo) {
		//select 문 -> ResultSet (한 행) 
		
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("CATEGORY_NAME")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getString("USER_ID")
							 ,rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
		
	public Attachment selectAttachment(Connection conn,int boardNo) {
		
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("FILE_NO")
								   ,rset.getString("ORIGIN_NAME")
								   ,rset.getString("CHANGE_NAME")
								   ,rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}

	public int updateBoard(Connection conn, Board b, Attachment newAttachment) {
			
		//update문 = > 처리된 행수 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getCategory()));
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getContent());
			pstmt.setInt(4, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
		public int updateAttachment(Connection conn,Attachment newAttachment) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateAttachment");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, newAttachment.getOriginName());
				pstmt.setString(2, newAttachment.getChangename());
				pstmt.setString(3, newAttachment.getFilePath());
				pstmt.setInt(4, newAttachment.getFileNo());
			
				result=pstmt.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}

		public int insertNewAttachment(Connection conn,Attachment newAttachment) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertNewAttachment");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, newAttachment.getRefNo());
				pstmt.setString(2, newAttachment.getOriginName());
				pstmt.setString(3, newAttachment.getChangename());
				pstmt.setString(4, newAttachment.getFilePath());
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}

		public int deleteBoard(Connection conn, int boardNo) {
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteboard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
				
			}
			return result;
			
			
		}

		public int insertThumbnailBoard(Connection conn, Board b) {

			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertTumbnailBoard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b.getBoardTitle());
				pstmt.setString(2, b.getContent());
				pstmt.setInt(3, Integer.parseInt(b.getBoardWriter()));
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
				
			}
			return result;
		}
		
		public int insertAttachmentList(Connection conn,ArrayList<Attachment> list) {
			
			//insert문 여러번
			int result = 1;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertAttachmentList");
				
				try {
					System.out.println(list);
					for(Attachment at : list) {
						System.out.println("2");
						//반복문이 돌때마다 미완성된 sql문을 담은 pstmt 객체 생성
						pstmt=conn.prepareStatement(sql);
						//위치홀더 채워주기
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2,at.getChangename());
					pstmt.setString(3, at.getFilePath());
					pstmt.setInt(4, at.getFileLevel());
					
					result *= pstmt.executeUpdate();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
			}finally {
				close(pstmt);
				
			}
				return result;
		}

		public ArrayList<Board> selectThumbnailList(Connection conn) {

			ArrayList<Board> list = new ArrayList<>();
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectThumbnailList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Board b = new Board();
					b.setBoardNo(rset.getInt("BOARD_NO"));
					b.setBoardTitle(rset.getString("BOARD_TITLE"));
					b.setCount(rset.getInt("COUNT"));
					b.setTitleImg(rset.getString("TITLEIMG"));
					
					list.add(b);
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

		public ArrayList<Attachment> selectAttachmentList(Connection conn, int boardNo) {

			ArrayList<Attachment> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectAttachment");
			
			try {
				pstmt=conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				
				while(rset.next()) {
					Attachment at = new Attachment();
					
					at.setChangename(rset.getString("CHANGE_NAME"));
					at.setOriginName(rset.getString("ORIGIN_NAME"));
					at.setFilePath(rset.getString("FILE_PATH"));
					
					list.add(at);
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
