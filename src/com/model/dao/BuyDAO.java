package com.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.model.javabeans.BuyBean;
import com.model.javabeans.BuyModel;


public class BuyDAO implements BuyModel{

	private static DataSource ds;
	private static final String TABLE_NAME = "acquisto"; 

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/dbtsw2");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	public synchronized void doSave(BuyBean bean) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		
		String insertSQL = "INSERT INTO " + TABLE_NAME +"(`idOrdine`, `idArticolo`)"
		+ " VALUES (?, ?)";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, bean.getIdOrdine());
			preparedStatement.setInt(2, bean.getIdArticolo());
		    

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
	public synchronized void doDelete(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	
		
	
		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idOrdine = ?";
	
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, idOrdine);
		
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
}
