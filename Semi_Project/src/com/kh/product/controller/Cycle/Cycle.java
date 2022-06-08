package com.kh.product.controller.Cycle;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.product.model.service.Cycle.CycleService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class Cycle
 */
@WebServlet("/cycle.pg")
public class Cycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cycle() {
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
		//2차 카테 분류 할 식별자 받을준비
		int cateNo =0;
		
		listCount = new CycleService().CycleCount(); 
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		//ul의 li 태그인 축구나 볼리은 2차 카테 값이 없으므로 따로 처리해줘야함
		//없을시 0으로 받는다
		
		if((request.getParameter("tp")!=null)) {
			cateNo = Integer.parseInt(request.getParameter("tp"));
			}else {
				cateNo=0;
			}
		// listCounttp 가 null이어도 아래에서 if문으로 cateNo이 0이냐 아니냐에 따라 처리할거임
		int listCounttp = new CycleService().CycletpCount(cateNo); 

		pageLimit = 10;

		boardLimit = 10;
	

		maxPage = (int)(Math.ceil((double)listCount/boardLimit));	
		int maxPagetp = (int)(Math.ceil((double)listCounttp/boardLimit));
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;

		endPage = startPage+pageLimit - 1;
		

		if(endPage>maxPage) {
			endPage=maxPage;
		}
		if(endPage>maxPagetp) {
			endPage=maxPagetp;
		}
		

		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit
				,maxPage,startPage,endPage);
		PageInfo pitp = new PageInfo(listCounttp,currentPage,pageLimit,boardLimit
		,maxPagetp,startPage,endPage);
		
		if((cateNo==0)) {
		ArrayList<Product> list = new CycleService().CycleProduct(pi);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("category", "cycle");
		}
		else {
		ArrayList<Product> listtp = new CycleService().CycletpProduct(pitp,cateNo);
		request.setAttribute("pi", pitp);
		request.setAttribute("list", listtp);
		request.setAttribute("category", "cycle");
		}
		
		request.getRequestDispatcher("/views/semi/categoryPage.jsp").forward(request, response);
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
