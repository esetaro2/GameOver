package com.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dao.ProductDAO;
import com.model.javabeans.ProductBean;
import com.model.javabeans.ProductModel;


/**
 * Servlet implementation class GenericServlet
 */
@WebServlet("/ProductsServlet")
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 static ProductModel model;
	 static boolean isDataSource = true;
		
		static {
			if(isDataSource) {
				model = new ProductDAO();
			}
		}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action =  request.getParameter("action");
		try {
			if(action!=null && action.equalsIgnoreCase("dettagli")) {
				int id = Integer.parseInt(request.getParameter("id"));
				request.removeAttribute("descrizione");
				ProductBean prodotto = (ProductBean) model.doRetrieveByKey(id);
				request.setAttribute("descrizione" ,prodotto);
				RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
				dispatcher1.forward(request, response);
		}
		
			else {
			request.removeAttribute("prodotti");
			Collection<?> prodotti = model.doRetrieveAll();
			request.getSession().setAttribute("prodotti", prodotti);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
			}
		}
		
			
		
		catch (SQLException e) {
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
