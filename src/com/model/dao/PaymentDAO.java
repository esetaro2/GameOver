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


import com.model.javabeans.PaymentBean;
import com.model.javabeans.PaymentModel;



public class PaymentDAO implements PaymentModel{

	private static DataSource ds;
	private static final String TABLE_NAME = "metodopagamento"; 

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/dbtsw2");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	public synchronized void doSave(PaymentBean bean) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		
		String insertSQL = "INSERT INTO " + TABLE_NAME +"(`numeroCarta`, `cvv`, `anno`, `mese`, `idUtenteRef`)"
		+ " VALUES (?, ?, ?, ?, ?)";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, bean.getNcarta());
			preparedStatement.setInt(2, bean.getCvv());
		    preparedStatement.setInt(3, bean.getAnnoScad());
		    preparedStatement.setInt(4, bean.getMeseScad());
		    preparedStatement.setInt(5,bean.getIdUtenteRef());
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
	public synchronized void doDelete(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	
		
	
		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idPagamento = ?";
	
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
	public synchronized Collection<PaymentBean> doRetrieveByUser(int idUtente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		Collection<PaymentBean> metodi = new LinkedList<PaymentBean>();
		String SQL ="select distinct metodopagamento.idPagamento,metodopagamento.idUtenteRef ,metodopagamento.numeroCarta,metodopagamento.cvv,metodopagamento.mese, metodopagamento.anno "
				+ "from metodopagamento join utente where idUtenteRef=?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setInt(1, idUtente);
			ResultSet result = preparedStatement.executeQuery();
			 while(result.next()) {
				 PaymentBean bean = new PaymentBean();
				 bean.setIdPagamento(result.getInt("idPagamento"));
				 bean.setCvv(result.getInt("cvv"));
				 bean.setMeseScad(result.getInt("mese"));
				 bean.setAnnoScad(result.getInt("anno"));
				 bean.setNcarta(result.getString("numeroCarta"));
				 metodi.add(bean);
			 }
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
		return metodi;
	}
}
