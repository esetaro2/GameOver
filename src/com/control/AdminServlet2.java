package com.control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.dao.OrderDAO;
import com.model.dao.PlatformDAO;
import com.model.dao.ProductDAO;
import com.model.javabeans.OrderModel;
import com.model.javabeans.PlatformBean;
import com.model.javabeans.PlatformModel;
import com.model.javabeans.ProductBean;
import com.model.javabeans.ProductModel;



/**
 * Servlet implementation class AdminServlet2
 */
@MultipartConfig
@WebServlet("/AdminServlet2")
public class AdminServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static OrderModel model2 = new OrderDAO();
    static ProductModel model = new ProductDAO();
    static PlatformModel model3 = new PlatformDAO();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

    
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
		try {
		
		
		if(action!=null && action.equalsIgnoreCase("mostra")) {
			
			Collection<?> articoli = model.doRetrieveAll();
			request.removeAttribute("articoli");
			request.setAttribute("articoli", articoli);
			
			Collection<?> ordini = model2.doRetrieveAll();
			request.removeAttribute("ordini");
			request.setAttribute("ordini",ordini);
			RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/AdminPage2.jsp");
			dispatcher1.forward(request, response);
			
			}
		else if (action!=null && action.equalsIgnoreCase("removeFromDB")) {
				int id= Integer.parseInt(request.getParameter("IdBean"));	
				model.doDelete(id);
				request.getSession().removeAttribute("prodotti");
				Collection<?> prodotti = model.doRetrieveAll();
				request.getSession().setAttribute("prodotti", prodotti);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
				System.out.println("articolo id:"+id+"rimosso");
		}
		else if(action!=null && action.equalsIgnoreCase("insert")){
			
			try {
				
				String Titolo = request.getParameter("Titolo_Gioco");System.out.println(Titolo);
				double prezzo =Double.parseDouble(request.getParameter("Prezzo"));System.out.println(prezzo);
				double iva = Double.parseDouble(request.getParameter("IVA"));System.out.println(iva);
				String descrizione = request.getParameter("descrizione");System.out.println(descrizione);
				int quant = Integer.parseInt(request.getParameter("Quantita"));System.out.println(quant);
				String disp = request.getParameter("Disponibilita");System.out.println(disp);
				Part file = request.getPart("image");
				String platname = request.getParameter("platform");
				String generes = request.getParameter("generes");
				System.out.println(platname);
				String uploadPath = "C:\\Users\\emanu\\Desktop\\GameOver\\WebContent\\img\\" + file.getSubmittedFileName();
				/*
				 *--> Emanuele P. Path String uploadPath = "C:\Users\emanu\Desktop\GameOver\WebContent\img\\" + file.getSubmittedFileName();
				 *--> Thomas String uploadPath = "C:\\Users\\Cosmo\\OneDrive\\Desktop\\Universita\\TSW\\WorkSpaceTSW\\GameOver\\WebContent\\img\\" + file.getSubmittedFileName();
				 *--> Emanuele S. AGGIORNALO String uploadPath = "C:\\Users\\Windows-PC\\Desktop\\sitoWeb2022TSW\\repository\\GameOver\\WebContent\\img\\" + file.getSubmittedFileName();
				 * */
				System.out.println(uploadPath);
				ProductBean bean = new ProductBean();
				PlatformBean bean2= new PlatformBean();
				
				bean.setNome(Titolo);
				bean.setPrezzo(prezzo);
				bean.setIva(iva);
				bean.setDescr(descrizione);
				bean.setQuanTot(quant);
				bean.setDisp(disp);
				bean.setImg(uploadPath);
				bean.setGenere(generes);
				model.doSave(bean);
				
				bean2.setDescr("Steam");
				bean2.setTipoPiattaforma(platname);
				bean2.setIdArticoloRef(model.doRetrieveMaxID());
				model3.doSave(bean2);
				
				//Salvo immagine nella cartella
				FileOutputStream fos = new FileOutputStream(uploadPath);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();

				Collection<?> articoli = model.doRetrieveAll();
				request.removeAttribute("articoli");
				request.setAttribute("articoli", articoli);
				
				Collection<?> ordini = model2.doRetrieveAll();
				request.removeAttribute("ordini");
				request.setAttribute("ordini",ordini);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminPage2.jsp");
				dispatcher.forward(request, response);
			
		}
		catch (SQLException e) 
		{
			System.out.println("Error:" + e.getMessage());
			}
	}
		else if(action!=null && action.equalsIgnoreCase("searchByDate")) {
			String dataInizio = request.getParameter("DataInizio");
			String dataFine = request.getParameter("DataFine");
			
				try {
					Collection<?> articoli = model.doRetrieveAll();
					request.removeAttribute("articoli");
					request.setAttribute("articoli", articoli);
					
					Collection<?> ordini2 = model2.doRetrieveAll();
					request.removeAttribute("ordini");
					request.setAttribute("ordini",ordini2);

					Collection<?> ordini = model2.doRetrieveByDates(dataInizio,dataFine);
					System.out.println(dataInizio +"    x   "+ dataFine);
					request.setAttribute("ordiniPerData",ordini);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminPage2.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		else if (action!=null && action.equalsIgnoreCase("searchByUser")) {
				String user = request.getParameter("Cliente");
				Collection<?> articoli = model.doRetrieveAll();
				request.removeAttribute("articoli");
				request.setAttribute("articoli", articoli);
				
				Collection<?> ordini = model2.doRetrieveAll();
				request.removeAttribute("ordini");
				request.setAttribute("ordini",ordini);

				Collection<?> ordini2 = model2.doRetrieveByUser(user);
				request.setAttribute("ordiniPerCliente",ordini2);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminPage2.jsp");
				dispatcher.forward(request, response);
		}
		}catch (SQLException e) 
		{
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
