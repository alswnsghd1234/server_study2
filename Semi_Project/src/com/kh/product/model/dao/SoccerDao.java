package com.kh.product.model.dao;
import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.product.model.vo.Product;

public class SoccerDao {
	
	private Properties prop = new Properties();
	
	public SoccerDao() {
		String fileName = SoccerDao.class.getResource("/db/product/product-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public ArrayList<Product> selectProduct(Connection conn) {
		
		
		ArrayList<Product> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectsoccer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
									,rset.getString("PRO_NAME")
									,rset.getInt("PRO_PRICE")
									,rset.getString("PRO_IMAGE")
									,rset.getInt("CATE_BNO")
									,rset.getInt("CATE_SNO")));
			}
			System.out.println(list);
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

