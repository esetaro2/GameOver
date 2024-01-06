package com.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.model.javabeans.PlatformBean;
import com.model.javabeans.PlatformModel;

public class PlatformDAO implements PlatformModel{

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/dbtsw2");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	private static final String TABLE_NAME = "piattaforma"; 
	
	
	public synchronized void doSave(PlatformBean bean) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		
		String insertSQL = "INSERT INTO " + TABLE_NAME +"(`descrizione`, `tipoPiattaforma`, `idArticoloRef`)"
		+ " VALUES (?, ?, ?)";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, bean.getDescr());
			preparedStatement.setString(2, bean.getTipoPiattaforma());
		    preparedStatement.setInt(3, bean.getIdArticoloRef());

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

	@Override
	public synchronized void doDelete(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	
		
	
		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idPiattaforma = ?";
	
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id);
		
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
