package com.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.model.javabeans.PlatformBean;
import com.model.javabeans.ProductBean;
import com.model.javabeans.ProductModel;



public class ProductDAO implements ProductModel {
	
	private static DataSource ds;
	private static final String TABLE_NAME = "articolo"; 
	private static final String TABLE_NAME2= "piattaforma";
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/dbtsw2");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	public synchronized void doSaveAdmin(ProductBean product,PlatformBean plat) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		doSave(product);
		String insertSQL="INSERT INTO "+TABLE_NAME2+"(`descrizione`, `tipoPiattaforma`, `idArticoloRef`)"
				+ " VALUES (?, ?, ?)";  
		
		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, plat.getDescr());
			preparedStatement.setString(2, plat.getTipoPiattaforma());
		    preparedStatement.setInt(3, plat.getIdArticoloRef());

			preparedStatement.executeUpdate(); 
		}
		
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public synchronized void doSave(ProductBean product) throws SQLException{

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		
		String insertSQL = "INSERT INTO " + TABLE_NAME+" (`nome`, `prezzo`, `iva`, `descrizione`, `quantitaTot`, `disponibilita`,`immagine`,`genere`)"
		+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
		
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1,product.getNome());
			preparedStatement.setDouble(2,product.getPrezzo());
			preparedStatement.setDouble(3, product.getIva());
			preparedStatement.setString(4, product.getDescr());
			preparedStatement.setInt(5, product.getQuanTot());
			preparedStatement.setString(6, product.getDisp());
			preparedStatement.setString(7, product.getImg());
			preparedStatement.setString(8, product.getGenere());
			
			preparedStatement.executeUpdate(); 
			
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	public synchronized int doRetrieveMaxID() throws SQLException {
		Connection con = null;
		PreparedStatement statement=null;
		int MaxId=0;
		String query = "select idArticolo from articolo where idArticolo=(select max(idArticolo) from articolo)";
		try {
			con=ds.getConnection();
			statement=con.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				MaxId= result.getInt("idArticolo");
			}
			
	}finally {
		try {
			if (statement != null)
			statement.close();
	} finally {
		if (con != null)
			con.close();
	}
	}
		return MaxId;
}
	public synchronized void doDelete(int id) throws SQLException{
		
		Connection con = null;
		PreparedStatement statement=null;
		
		String query = "delete x,j from "+TABLE_NAME+" x join "+TABLE_NAME2+" j on x.idArticolo=j.idArticoloRef and x.idArticolo = ?";
		
		try {
			con=ds.getConnection();
			statement=con.prepareStatement(query);
			statement.setInt(1,id);
			statement.executeUpdate();
			
			
		}
		finally {
			try {
					if (statement != null)
					statement.close();
			} finally {
				if (con != null)
					con.close();
			}
		}
	}
	public synchronized Collection<ProductBean> doRetrieveByPlatform(String tipoPiattaforma) throws SQLException {
		
		Connection con = null;
		PreparedStatement statement = null;
		
		Collection <ProductBean> articoli = new LinkedList<ProductBean>();
		
		String querySelection = "select distinct articolo.* from "+TABLE_NAME+" join piattaforma where tipoPiattaforma = ? "
				+ "and articolo.idArticolo=piattaforma.idArticoloRef";
		
		try {
			con= ds.getConnection();
			statement= con.prepareStatement(querySelection);
			statement.setString(1, tipoPiattaforma);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(result.getInt("idArticolo"));
				bean.setNome(result.getString("nome"));
				bean.setPrezzo(result.getDouble("prezzo"));
				bean.setIva(result.getDouble("iva"));
				bean.setDescr(result.getString("descrizione"));
				bean.setQuanTot(result.getInt("quantitaTot"));
				bean.setDisp(result.getString("disponibilita"));
				bean.setImg(result.getString("immagine"));
				bean.setGenere(result.getString("genere"));
				bean.setBack_image(result.getString("back_image"));
				articoli.add(bean);
				
			}
		}finally {
			try {
				if(statement != null) {
					statement.close();
				}
				
			}finally{
					if(con!=null)
						con.close();
				}
			}
		return articoli;
			}
	public synchronized Collection<ProductBean> doRetrieveAll() throws SQLException{
		Connection con = null;
		PreparedStatement statement = null;
		
		Collection<ProductBean> articoli = new LinkedList<ProductBean>();
		
		String querySel= "Select * from "+TABLE_NAME;
		try {
			con = ds.getConnection();
			statement = con.prepareStatement(querySel);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				
				ProductBean bean = new ProductBean();
				
				bean.setId(result.getInt("idArticolo"));
				bean.setDescr(result.getString("descrizione"));
				bean.setNome(result.getString("nome"));
				bean.setPrezzo(result.getDouble("prezzo"));
				bean.setDisp(result.getString("disponibilita"));
				bean.setQuanTot(result.getInt("quantitaTot"));
				bean.setIva(result.getDouble("iva"));
				bean.setImg(result.getString("immagine"));
				bean.setGenere(result.getString("genere"));
				bean.setBack_image(result.getString("back_image"));
				articoli.add(bean);
				
			}
			
			
		}finally {
			try {
				if(statement != null) {
					statement.close();
				}
				
			}finally{
					if(con!=null)
						con.close();
				}
			}
		return articoli;
	}
	public synchronized ProductBean doRetrieveByKey(int id) throws SQLException{
		Connection con = null;
		PreparedStatement statement = null;
		
		ProductBean bean = new ProductBean();
		
		String querySel= "Select * from "+TABLE_NAME+" where idArticolo = ? " ;
		
		try {
			con =ds.getConnection();
			statement = con.prepareStatement(querySel);
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				bean.setId(result.getInt("idArticolo"));
				bean.setDescr(result.getString("descrizione"));
				bean.setNome(result.getString("nome"));
				bean.setIva(result.getDouble("iva"));
				bean.setPrezzo(result.getDouble("prezzo"));
				bean.setImg(result.getString("immagine"));
				bean.setQuanTot(result.getInt("quantitaTot"));
				bean.setDisp(result.getString("disponibilita"));
				bean.setGenere(result.getString("genere"));
				bean.setBack_image(result.getString("back_image"));
				
			}
			
		}finally {
			try {
				if(statement != null) {
					statement.close();
				}
				
			}finally{
					if(con!=null)
						con.close();
				}
			}
		return bean;
	}
	
	public synchronized void updateName (int id, String newName) throws SQLException {  

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET nome = ? WHERE idArticolo = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, newName);
			preparedStatement.setInt(2, id);

			preparedStatement.executeUpdate(); 
		
			//connection.commit();
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public synchronized void updateQuantity (int id, int newQuantity) throws SQLException {  

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET quantitaTot = ? WHERE idArticolo = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, newQuantity);
			preparedStatement.setInt(2, id);

			preparedStatement.executeUpdate(); 
		
			//connection.commit();
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
		}
	
	public synchronized void updatePrice (int id, double newPrice) throws SQLException {  

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET prezzo = ? WHERE idArticolo = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setDouble(1, newPrice);
			preparedStatement.setInt(2, id);

			preparedStatement.executeUpdate(); 
		
			//connection.commit(); 
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}	
	
	public synchronized void updateIva (int id, double newIva) throws SQLException {  

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET iva = ? WHERE idArticolo = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setDouble(1, newIva);
			preparedStatement.setInt(2, id);

			preparedStatement.executeUpdate(); 
		
			//connection.commit();
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public synchronized void updateDescription (int id, String newDescription) throws SQLException {  

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET descrizione = ? WHERE idArticolo = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, newDescription);
			preparedStatement.setInt(2, id);

			preparedStatement.executeUpdate(); 
		
			//connection.commit();
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public synchronized void updateImage (int id, String uploadPath) throws SQLException {  

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET immagine = ? WHERE idArticolo = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, uploadPath);
			preparedStatement.setInt(2, id);

			preparedStatement.executeUpdate(); 
		
			//connection.commit();
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
		}
	
	public synchronized void updateGenere (int id, String genere) throws SQLException {  

		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET genere = ? WHERE idArticolo = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, genere);
			preparedStatement.setInt(2, id);

			preparedStatement.executeUpdate(); 
		
			//connection.commit();
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			
			finally {
				if (connection != null)
					connection.close();
			}
		}
		}
	
	public synchronized Collection<ProductBean> doRetrieveByGenere(String genere) throws SQLException{
		Connection con = null;
		PreparedStatement statement = null;
		
		Collection<ProductBean> articoli = new LinkedList<ProductBean>();
		
		String querySel= "Select * from "+TABLE_NAME+" where genere = ?";
		try {
			con = ds.getConnection();
			statement = con.prepareStatement(querySel);
			statement.setString(1,genere);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				
				ProductBean bean = new ProductBean();
				
				bean.setId(result.getInt("idArticolo"));
				bean.setDescr(result.getString("descrizione"));
				bean.setNome(result.getString("nome"));
				bean.setPrezzo(result.getDouble("prezzo"));
				bean.setDisp(result.getString("disponibilita"));
				bean.setQuanTot(result.getInt("quantitaTot"));
				bean.setIva(result.getDouble("iva"));
				bean.setImg(result.getString("immagine"));
				bean.setGenere(result.getString("genere"));
				bean.setBack_image(result.getString("back_image"));
				articoli.add(bean);
				
			}
				
		}finally {
			try {
				if(statement != null) {
					statement.close();
				}
				
			}finally{
					if(con!=null)
						con.close();
				}
			}
		return articoli;
}

	@Override
	public Collection<ProductBean> searchBar(String search) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		Collection<ProductBean> articoli = new LinkedList<ProductBean>();
		
		String querySel= "Select * from "+TABLE_NAME+" where nome like '" +search + "%' ";
		try {
			
			con = ds.getConnection();
			statement = con.prepareStatement(querySel);
			//statement.setString(1,search);
			
			ResultSet result = statement.executeQuery();
			
			System.out.println(querySel);
			while(result.next()) {
				
				ProductBean bean = new ProductBean();
				
				bean.setId(result.getInt("idArticolo"));
				bean.setDescr(result.getString("descrizione"));
				bean.setNome(result.getString("nome"));
				bean.setPrezzo(result.getDouble("prezzo"));
				bean.setDisp(result.getString("disponibilita"));
				bean.setQuanTot(result.getInt("quantitaTot"));
				bean.setIva(result.getDouble("iva"));
				bean.setImg(result.getString("immagine"));
				bean.setGenere(result.getString("genere"));
				bean.setBack_image(result.getString("back_image"));
				articoli.add(bean);
				
			}
				
		}finally {
			try {
				if(statement != null) {
					statement.close();
				}
				
			}finally{
					if(con!=null)
						con.close();
				}
			}
		return articoli;
}
	}





