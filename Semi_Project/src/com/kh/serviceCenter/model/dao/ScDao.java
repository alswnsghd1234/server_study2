package com.kh.serviceCenter.model.dao;
import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.PageInfo;
import com.kh.memManage.model.vo.Member;
import com.kh.serviceCenter.model.vo.FAQ;
import com.kh.serviceCenter.model.vo.QNA;

public class ScDao {
	Properties prop = new Properties();
	public ScDao() {
		String fileName = ScDao.class.getResource("/db/ServiceCenter/serviceCenter-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int selectFAQListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = prop.getProperty("selectFAQListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) listCount = rset.getInt("COUNT");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	public ArrayList<FAQ> selectFAQList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FAQ> FAQList = new ArrayList<>();
		String sql = prop.getProperty("selectFAQList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage()-1)*pi.getBoardLimit()+1);
			pstmt.setInt(2, pi.getCurrentPage()*pi.getBoardLimit());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				FAQList.add(new FAQ(rset.getInt("FAQ_NO"),
						rset.getString("CATE_NAME"),
						rset.getString("FAQ_TITLE"),
						rset.getString("FAQ_CONTENT"),
						rset.getString("FAQ_STATUS")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return FAQList;
	}
	public int ajaxHideSc(Connection conn, int[] fnoArr) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("ajaxHideSc");
		try {
			for(int i=0;i<fnoArr.length;i++) {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, fnoArr[i]);
				result = result * pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertFAQ(Connection conn, FAQ faq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertFAQ");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, faq.getFaqCate());
			pstmt.setString(2, faq.getFaqTitle());
			pstmt.setString(3, faq.getFaqContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateFAQ(Connection conn, FAQ faq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateFAQ");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, faq.getFaqCate());
			pstmt.setString(2, faq.getFaqTitle());
			pstmt.setString(3, faq.getFaqContent());
			pstmt.setInt(4, faq.getFaqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int searchFAQCount(Connection conn, String faqCate, String searchFaq) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = "";
		switch(faqCate) {
		case "title" : sql = prop.getProperty("searchFAQCountTitle"); break;
		case "faq-select" :  sql = prop.getProperty("searchFAQCountselect"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchFaq);
			rset = pstmt.executeQuery();
			if(rset.next())
			listCount = rset.getInt("COUNT");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	public ArrayList<FAQ> searchFAQ(Connection conn, String faqCate, String searchFaq, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FAQ> fList = new ArrayList<>();
		String sql = "";
		switch(faqCate) {
		case "title" : sql = prop.getProperty("searchFAQTitle"); break;
		case "faq-select" :  sql = prop.getProperty("searchFAQselect"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchFaq);
			pstmt.setInt(2, (pi.getCurrentPage()-1)*pi.getBoardLimit()+1);
			pstmt.setInt(3, pi.getCurrentPage()*pi.getBoardLimit());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				fList.add(new FAQ(rset.getInt("FAQ_NO"),
						rset.getString("CATE_NAME"),
						rset.getString("FAQ_TITLE"),
						rset.getString("FAQ_CONTENT"),
						rset.getString("FAQ_STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return fList;
	}
	public int selectQNAListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = prop.getProperty("selectQNAListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) listCount = rset.getInt("COUNT");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<QNA> selectQNAList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QNA> QNAList = new ArrayList<>();
		String sql = prop.getProperty("selectQNAList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pi.getCurrentPage()-1)*pi.getBoardLimit()+1);
			pstmt.setInt(2, pi.getCurrentPage()*pi.getBoardLimit());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QNAList.add(new QNA(rset.getInt("QNA_NO"),
						rset.getString("CATE_NAME"),
						rset.getString("QNA_ID"),
						rset.getDate("QNA_ENTERDATE"),
						rset.getString("QNA_TITLE"),
						rset.getString("QNA_CONTENT"),
						rset.getDate("QNA_ANSWERDATE"),
						rset.getString("QNA_ANSWER"),
						rset.getString("QNA_STATUS")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return QNAList;
	}
	public QNA ajaxSelectQNA(Connection conn, int qnaNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQNA");
		QNA q = new QNA();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				q = new QNA(rset.getInt("QNA_NO"),
						rset.getString("CATE_NAME"),
						rset.getString("QNA_ID"),
						rset.getDate("QNA_ENTERDATE"),
						rset.getString("QNA_TITLE"),
						rset.getString("QNA_CONTENT"),
						rset.getDate("QNA_ANSWERDATE"),
						rset.getString("QNA_ANSWER"),
						rset.getString("QNA_STATUS"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}
	public int ajaxEnrollAnswer(Connection conn, int qnaNo, String qnaAnswer) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("ajaxEnrollAnswer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qnaAnswer);
			pstmt.setInt(2, qnaNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public int searchQNACount(Connection conn, String qnaCate, String searchQna) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = "";
		switch(qnaCate) {
		case "title" : sql = prop.getProperty("searchQNACountTitle"); break;
		case "qna-select" :  sql = prop.getProperty("searchQNACountselect"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchQna);
			rset = pstmt.executeQuery();
			if(rset.next())
			listCount = rset.getInt("COUNT");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	public ArrayList<QNA> searchQNA(Connection conn, String qnaCate, String searchQna, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QNA> qList = new ArrayList<>();
		String sql = "";
		switch(qnaCate) {
		case "title" : sql = prop.getProperty("searchQNATitle"); break;
		case "qna-select" :  sql = prop.getProperty("searchQNAselect"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchQna);
			pstmt.setInt(2, (pi.getCurrentPage()-1)*pi.getBoardLimit()+1);
			pstmt.setInt(3, pi.getCurrentPage()*pi.getBoardLimit());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				qList.add (new QNA(rset.getInt("QNA_NO"),
						rset.getString("CATE_NAME"),
						rset.getString("QNA_ID"),
						rset.getDate("QNA_ENTERDATE"),
						rset.getString("QNA_TITLE"),
						rset.getString("QNA_CONTENT"),
						rset.getDate("QNA_ANSWERDATE"),
						rset.getString("QNA_ANSWER"),
						rset.getString("QNA_STATUS")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return qList;
	}

}
