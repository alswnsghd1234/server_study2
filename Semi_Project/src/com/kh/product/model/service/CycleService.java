package com.kh.product.model.service;
import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.CycleDao;
import com.kh.product.model.vo.Product;


public class CycleService {

	public ArrayList<Product> selectProduct() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new CycleDao().selectProduct(conn);
		System.out.println(list);
		close(conn);
		
		return list;
		
	}

	
	
}
