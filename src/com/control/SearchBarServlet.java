package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.BuyDAO;
import com.model.dao.OrderDAO;
import com.model.dao.ProductDAO;
import com.model.javabeans.BuyModel;
import com.model.javabeans.OrderModel;
import com.model.javabeans.ProductModel;

/**
 * Servlet implementation class SearchBarServlet
 */
@WebServlet("/SearchBarServlet")
public class SearchBarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 static boolean isDataSource = true;
	 static ProductModel model;
		
		static {
			if(isDataSource) {
				model = new ProductDAO();
			}
		}
    public SearchBarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String search = request.getParameter("searchBar");
		PrintWriter out = response.getWriter() ;
		

		try {
		Collection<?> searchProdotti = (Collection<?>)	model.searchBar(search);
		System.out.println(searchProdotti.size());
		request.getSession().setAttribute("search_prodotti", searchProdotti);
		
		out.print("Ok");
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
