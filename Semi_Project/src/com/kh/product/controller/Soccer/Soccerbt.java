package com.kh.product.controller.Soccer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.product.model.service.Soccer.SoccerService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class Soccerbt
 */
@WebServlet("/soccerbt.pg")
public class Soccerbt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Soccerbt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// --------------------페이징 처리------------------------
		int listCount;
		int currentPage; 
		int pageLimit;
		int boardLimit; 
		
		int maxPage; 
		int startPage; 
		int endPage; 
		
		
		listCount = new SoccerService().SoccertpCount(); 
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		//p
		pageLimit = 10;
	
		boardLimit = 10;

		maxPage = (int)(Math.ceil((double)listCount/boardLimit));	

		startPage = (currentPage-1)/pageLimit * pageLimit + 1;

		endPage = startPage+pageLimit - 1;
		

		if(endPage>maxPage) {
			endPage=maxPage;
		}

		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit
												,maxPage,startPage,endPage);
				
				
				
		ArrayList<Product> list = new SoccerService().SoccerbtProduct(pi);
		request.setAttribute("category", "soccer");
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/semi/categoryPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
