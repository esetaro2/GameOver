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

import org.apache.tomcat.util.log.UserDataHelper.Mode;

import com.model.dao.PaymentDAO;
import com.model.dao.ProductDAO;
import com.model.dao.UserDAO;
import com.model.javabeans.ProductModel;
import com.model.javabeans.UserBean;
import com.model.javabeans.UserModel;
import com.model.javabeans.Cart;
import com.model.javabeans.PaymentModel;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	static ProductModel model;
	static UserModel model1;
	static PaymentModel model2;
	
	static boolean isDataSource = true;

	static {
		if(isDataSource) {
			model = new ProductDAO();
			model1 = new UserDAO();
			model2 = new PaymentDAO();
		}
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	

		
		String action = (String) request.getParameter("action");
		 Cart cart = (Cart)request.getSession().getAttribute("cart");
			if(cart == null) {
				cart = new Cart();
				request.getSession().setAttribute("cart", cart);
				
			}
			try {
				
			
			if(action!=null && action.equalsIgnoreCase("addCart")) {
				int id = Integer.parseInt(request.getParameter("id"));
				
				// aggiungi al carrello
				if(model.doRetrieveByKey(id).getDisp().equalsIgnoreCase("SI"))// && model.prendiPerId(id).getQuant()<quantita)
				cart.addProduct(id);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
				}
			else if (action.equalsIgnoreCase("deletefromcart")) {
				int id = Integer.parseInt(request.getParameter("id"));
				// eliminiamo dal carrello
				cart.deleteAllProduct(id);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cart.jsp");
				dispatcher.forward(request, response);
			}	
			
			}catch (SQLException e) {
				System.out.println("Error:" + e.getMessage());
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
