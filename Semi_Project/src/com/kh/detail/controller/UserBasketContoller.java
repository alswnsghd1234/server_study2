package com.kh.detail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.detail.model.service.BasketService;
import com.kh.detail.model.vo.Basket;



/**
 * Servlet implementation class UserBasketContoller
 */
@WebServlet("/userBasket.bk")
public class UserBasketContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBasketContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		int pc = Integer.parseInt(request.getParameter("pc"));
		int lo = Integer.parseInt(request.getParameter("lo"));
		int po = Integer.parseInt(request.getParameter("po"));
	
		
		int result = new BasketService().insertBaskets(pc,lo,po);
		System.out.println(result);
		
		
		
		ArrayList<Basket> list = new BasketService().selectBaskets();
		System.out.println(list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/basket/userBasket.jsp").forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
