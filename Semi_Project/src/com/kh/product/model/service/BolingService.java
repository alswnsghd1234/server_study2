package com.kh.product.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.BolingDao;
import com.kh.product.model.vo.Product;


public class BolingService {

	public ArrayList<Product> selectProduct() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new BolingDao().selectProduct(conn);
		System.out.println(list);
		close(conn);
		
		return list;
		
	}

	
	
}
