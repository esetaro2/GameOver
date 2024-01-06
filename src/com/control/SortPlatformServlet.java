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
import com.model.javabeans.ProductModel;


/**
 * Servlet implementation class SortPlatformServlet
 */
@WebServlet("/SortPlatformServlet")
public class SortPlatformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static ProductModel model;
	static boolean isDataSource = true;
	
	static {
		if(isDataSource) {
			model = new ProductDAO();
		}
	}
    public SortPlatformServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//A SECONDA DELLA STRINGA ACTION PRESA IN INPUT LA SERVLET RESTITUISCE UNA COLLECTION DI ELEMENTI ALLA PAGINA ELENCOPIATTAFORMA
		
		String action = request.getParameter("action");
		try {
			if(action!=null && action.equalsIgnoreCase("Pc")) {
				Collection<?> piattaforma = model.doRetrieveByPlatform("Pc");
				request.setAttribute("articoliPiattaforma",piattaforma);
				RequestDispatcher dispatcher1= getServletContext().getRequestDispatcher("/ElencoPiattaforma.jsp");
				dispatcher1.forward(request, response);
			}
			
			else if(action!=null && action.equalsIgnoreCase("Ps")) {
				Collection<?> piattaforma = model.doRetrieveByPlatform("Ps5");
				request.setAttribute("articoliPiattaforma",piattaforma);
				RequestDispatcher dispatcher1= getServletContext().getRequestDispatcher("/ElencoPiattaforma.jsp");
				dispatcher1.forward(request, response);
			}
			else if(action!=null && action.equalsIgnoreCase("Nint")) {
				Collection<?> piattaforma = model.doRetrieveByPlatform("Nintendo Switch");
				request.setAttribute("articoliPiattaforma",piattaforma);
				RequestDispatcher dispatcher1= getServletContext().getRequestDispatcher("/ElencoPiattaforma.jsp");
				dispatcher1.forward(request, response);
			}
			
			else if(action!=null && action.equalsIgnoreCase("Xbox")) {
				Collection<?> piattaforma = model.doRetrieveByPlatform("Xbox");
				request.setAttribute("articoliPiattaforma",piattaforma);
				RequestDispatcher dispatcher1= getServletContext().getRequestDispatcher("/ElencoPiattaforma.jsp");
				dispatcher1.forward(request, response);
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
