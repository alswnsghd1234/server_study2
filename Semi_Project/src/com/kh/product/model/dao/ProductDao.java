package com.kh.product.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.product.model.vo.Product;
import com.sun.corba.se.pept.transport.Connection;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ArrayList<Product> selectProduct(Connection conn) {
		ArrayList<Product> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectproduct");
		
		return list;
	}

}
