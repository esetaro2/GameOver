package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.dao.ProductDAO;
import com.model.javabeans.ProductBean;
import com.model.javabeans.ProductModel;

/**
 * Servlet implementation class EditItemServlet
 */
@WebServlet("/EditItemServlet")
public class EditItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model = new ProductDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		
		
		if(action!=null && action.equalsIgnoreCase("edit-titolo")) {
			
			try {
				int id = Integer.parseInt(request.getParameter("idBean"));
				String titolo =request.getParameter("titolo"); System.out.println(titolo);
				model.updateName(id, titolo);
				ProductBean bean = model.doRetrieveByKey(id);
				request.removeAttribute("descrizione");
				request.setAttribute("descrizione",bean);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
				dispatcher.forward(request, response);
			}
			catch (SQLException e) 
			{
				System.out.println("Error:" + e.getMessage());
				}
			}
		
		if(action!=null && action.equalsIgnoreCase("edit-prezzo")) {
					
					try {
						int id = Integer.parseInt(request.getParameter("idBean"));
						double prezzo =Double.parseDouble(request.getParameter("prezzo")); System.out.println(prezzo);
						model.updatePrice(id, prezzo);
						ProductBean bean = model.doRetrieveByKey(id);
						request.removeAttribute("descrizione");
						request.setAttribute("descrizione",bean);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
						dispatcher.forward(request, response);
					}
					catch (SQLException e) 
					{
						System.out.println("Error:" + e.getMessage());
						}
					}
		
		
		if(action!=null && action.equalsIgnoreCase("edit-iva")) {
			
			try {
				int id = Integer.parseInt(request.getParameter("idBean"));
				double iva =Double.parseDouble(request.getParameter("iva")); System.out.println(iva);
				model.updateIva(id, iva);
				ProductBean bean = model.doRetrieveByKey(id);
				request.removeAttribute("descrizione");
				request.setAttribute("descrizione",bean);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
				dispatcher.forward(request, response);
			}
			catch (SQLException e) 
			{
				System.out.println("Error:" + e.getMessage());
				}
			}
		
		if(action!=null && action.equalsIgnoreCase("edit-descrizione")) {
					
					try {
						int id = Integer.parseInt(request.getParameter("idBean"));
						String descr =request.getParameter("descr");
						model.updateDescription(id, descr);
						ProductBean bean = model.doRetrieveByKey(id);
						request.removeAttribute("descrizione");
						request.setAttribute("descrizione",bean);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
						dispatcher.forward(request, response);
					}
					catch (SQLException e) 
					{
						System.out.println("Error:" + e.getMessage());
						}
					}
		
		if(action!=null && action.equalsIgnoreCase("edit-quant")) {
					
					try {
						int id = Integer.parseInt(request.getParameter("idBean"));
						int quant =Integer.parseInt(request.getParameter("quant")); System.out.println(quant);
						model.updateQuantity(id, quant);
						ProductBean bean = model.doRetrieveByKey(id);
						request.removeAttribute("descrizione");
						request.setAttribute("descrizione",bean);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
						dispatcher.forward(request, response);
					}
					catch (SQLException e) 
					{
						System.out.println("Error:" + e.getMessage());
						}
					}
		
		if(action!=null && action.equalsIgnoreCase("edit-genere")) {
					
					try {
						int id = Integer.parseInt(request.getParameter("idBean"));
						String genere =request.getParameter("generes"); System.out.println(genere);
						model.updateGenere(id, genere);
						ProductBean bean = model.doRetrieveByKey(id);
						request.removeAttribute("descrizione");
						request.setAttribute("descrizione",bean);
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
						dispatcher.forward(request, response);
					}
					catch (SQLException e) 
					{
						System.out.println("Error:" + e.getMessage());
						}
					}
		
		if(action!=null && action.equalsIgnoreCase("edit-image")) {
			
			try {
				Part file = request.getPart("image");
				String uploadPath = "C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\" + file.getSubmittedFileName();
				int id = Integer.parseInt(request.getParameter("idBean"));
				
				model.updateImage(id, uploadPath);
				
				//Salvo immagine nella cartella
				FileOutputStream fos = new FileOutputStream(uploadPath);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				
				ProductBean bean = model.doRetrieveByKey(id);
				request.removeAttribute("descrizione");
				request.setAttribute("descrizione",bean);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
				dispatcher.forward(request, response);
			}
			catch (SQLException e) 
			{
				System.out.println("Error:" + e.getMessage());
				}
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
