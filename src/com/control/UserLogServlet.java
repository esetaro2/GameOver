package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.javabeans.UserBean;
import com.model.dao.UserDAO;
import com.model.javabeans.UserModel;

/**
 * Servlet implementation class UserLogServlet
 */
@WebServlet("/UserLogServlet")
public class UserLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static UserModel model;
	static boolean isDataSource = true;
	
	static {
		if(isDataSource) {
			model = new UserDAO();
		}
	}

    public UserLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("user");
		String password = request.getParameter("pwd");
		PrintWriter out= response.getWriter();
		
		try {
			UserBean bean = model.searchUser(username, password); //verifyUser ci va qui
			System.out.println(bean);
			
			if(bean.getUsername()==null || bean.getPassword()==null || !bean.getUsername().equals(username) || (bean.getUsername().equals("") || bean.getPassword().equals("")) ) { /*se per qualunque caso nel DB sarà presente un utente con stringhe vuote, esso non sarà preso in considerazione*/
				// non esiste
				System.out.println("Utente Non Trovato");
				request.setAttribute("utente_non_trovato", "true");
					
				out.print("No");
			}
			else {
				// login avvenuto con successo
				request.getSession().setAttribute("current_user", bean);
				request.setAttribute("utente_non_trovato", "false");
					
				out.print("Ok");
			}
		} catch (SQLException e) {
			System.out.println("Utente Non Trovato, RIPROVARE!");
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
