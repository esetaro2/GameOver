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

import com.model.javabeans.PaymentBean;
import com.model.javabeans.PaymentModel;
import com.model.javabeans.UserBean;
import com.model.dao.PaymentDAO;
import com.model.dao.UserDAO;
import com.model.javabeans.UserModel;

/**
 * Servlet implementation class UserSignupServlet
 */
@WebServlet("/UserSignupServlet")
public class UserSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UserModel model;
	static PaymentModel model1;
	static boolean isDataSource = true;
	
	static {
		if(isDataSource) {
			model = new UserDAO();
			model1 = new PaymentDAO();
		}
	}
    public UserSignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out= response.getWriter();
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String username= request.getParameter("user");
		String password = request.getParameter("pwd");
		String email = request.getParameter("email");
		String telefono = request.getParameter("telefono");
		String via = request.getParameter("via");
		String citta = request.getParameter("citta");
		String provincia = request.getParameter("provincia");
		String cap = request.getParameter("cap");
		int civico = Integer.parseInt(request.getParameter("civico"));
		String nCarta = request.getParameter("ncarta");
		int meseScad = Integer.parseInt(request.getParameter("mesescadenza"));
		int annoScad = Integer.parseInt(request.getParameter("annoscadenza"));
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		
		String prime4= nCarta.substring(0, 4);
		String seconde4 = nCarta.substring(4,8);
		String terze4 = nCarta.substring(8,12);
		String quarte4 = nCarta.substring(12,16);
		
		System.out.println("Nome:"+ nome + " Cognome:" + cognome + " Username:" + username + " Password:" + password + " Email:" + email + " Telefono:"+  telefono + " Via:" + via + " Citta:" + citta + " Provincia:" + provincia +"  cap:" + cap);

		UserBean bean = new UserBean();
		bean.setAdmin(0);
		bean.setNome(nome);
		bean.setCognome(cognome);
		bean.setUsername(username);
		bean.setPassword(password);
		bean.setEmail(email);
		bean.setTelefono(telefono);
		bean.setVia(via);
		bean.setCitta(citta);
		bean.setProvincia(provincia);
		bean.setnCivico(civico);
		bean.setCap(cap);
		
		PaymentBean payBean = new PaymentBean();
		System.out.println("Ncarta:"+nCarta + " Cvv:" + cvv + " Mese:" + meseScad + " Anno:" + annoScad );
		
		try {
			request.setAttribute("utente_signup_check", "true");
			model.doSave(bean);
			int id = model.doGetLastKey();
			System.out.println(id);
			
			payBean.setNcarta(prime4+" "+seconde4+" "+terze4+" "+quarte4);
			payBean.setIdUtenteRef(id);
			payBean.setCvv(cvv);
			payBean.setAnnoScad(annoScad);
			payBean.setMeseScad(meseScad);
			model1.doSave(payBean);
			
			out.print("Ok");
		} catch (SQLException e) {
			
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
