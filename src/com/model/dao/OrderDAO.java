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

import com.model.javabeans.OrderBean;
import com.model.javabeans.OrderModel;

public class OrderDAO implements OrderModel {

	private static DataSource ds;
	private static final String TABLE_NAME = "ordine";
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/dbtsw2");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	public synchronized void doSave(OrderBean order) throws SQLException{
		 	Connection connection = null;
	        PreparedStatement preparedStatement = null;


	        String insertSQL = "INSERT INTO " + TABLE_NAME + "(`idUtente`, `idPagamento`, `quantitaArticoli`, `importoTotale`, `dataAcquisto`, `dataSpedizione`,`statoOrdine`) "+
	            "VALUES (?, ?, ?, ?, ?, ?, ?)";

	        try {
	            connection = ds.getConnection();
	            preparedStatement = connection.prepareStatement(insertSQL);
	            
	            preparedStatement.setInt(1, order.getIdUtente());
	            preparedStatement.setInt(2, order.getIdPagamento());
	            preparedStatement.setInt(3,order.getQuantitaArticoli()); 
	            preparedStatement.setDouble(4, order.getImportoTotale());
	            preparedStatement.setDate(5, order.getDataAcquisto());
	            preparedStatement.setDate(6, order.getDataSpedizione());
	            preparedStatement.setString(7, order.getStatoOrdine());
	            
	            preparedStatement.executeUpdate();
	           

	        } finally {
	            try {
	                if (preparedStatement != null)
	                    preparedStatement.close();
	            } finally {
	                if (connection != null)
	                    connection.close();
	            }
	        }
	    }
	public synchronized void doDelete(int id) throws SQLException {
		  	Connection connection = null;
	        PreparedStatement preparedStatement = null;

	        

	        String deleteSQL = "DELETE * FROM " + TABLE_NAME + "where idOrdine = ? ";

	        try {
	            connection = ds.getConnection();
	            preparedStatement = connection.prepareStatement(deleteSQL);
	            preparedStatement.setInt(1, id);

	            preparedStatement.executeUpdate();
	            connection.commit();

	        } finally {
	            try {
	                if (preparedStatement != null)
	                    preparedStatement.close();
	            } finally {
	                if (connection != null)
	                    connection.close();
	            }
	        }
	        
	    }
	public synchronized Collection<OrderBean> doRetrieveAll()throws SQLException{
		Connection con = null;
		PreparedStatement statement = null;
		
		Collection<OrderBean> ordine = new LinkedList<OrderBean>();
		
		String query = "Select * from "+TABLE_NAME;
		
		try {
			con = ds.getConnection();
			
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				
				OrderBean bean = new OrderBean();
				
				bean.setIdOrdine(result.getInt("idOrdine"));
				bean.setIdUtente(result.getInt("idUtente"));
				bean.setIdPagamento(result.getInt("idPagamento"));
				bean.setImportoTotale(result.getDouble("importoTotale"));
				bean.setQuantitaArticoli(result.getInt("quantitaArticoli"));
				bean.setDataAcquisto(result.getDate("dataAcquisto"));
				bean.setDataSpedizione(result.getDate("dataSpedizione"));
				bean.setStatoOrdine(result.getString("statoOrdine"));
				
				ordine.add(bean);
				
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
		
		return ordine;
	}
	public synchronized Collection<OrderBean> doRetrieveByDates(String dataInizio, String dataFine) throws SQLException{
		Connection con = null;
		PreparedStatement statement = null;
		
		Collection<OrderBean> ordine = new LinkedList<OrderBean>();
		
		String query= 
				"select ordine.* from "+TABLE_NAME+" where dataAcquisto and dataSpedizione between ? and ?";
		try {
			con = ds.getConnection();
			
			statement = con.prepareStatement(query);
			statement.setString(1,dataInizio);
			statement.setString(2,dataFine);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				
				OrderBean bean = new OrderBean();
				
				bean.setIdOrdine(result.getInt("idOrdine"));
				bean.setIdUtente(result.getInt("idUtente"));
				bean.setIdPagamento(result.getInt("idPagamento"));
				bean.setImportoTotale(result.getDouble("importoTotale"));
				bean.setQuantitaArticoli(result.getInt("quantitaArticoli"));
				bean.setDataAcquisto(result.getDate("dataAcquisto"));
				bean.setDataSpedizione(result.getDate("dataSpedizione"));
				bean.setStatoOrdine(result.getString("statoOrdine"));
				
				ordine.add(bean);
				
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
		
		return ordine;
	}
	public synchronized Collection<OrderBean> doRetrieveByUser(String username) throws SQLException{
		Connection con = null;
		PreparedStatement statement = null;
		
		Collection<OrderBean> ordine = new LinkedList<OrderBean>();
		String query="select ordine.* from "+TABLE_NAME+" join utente where ordine.idUtente=utente.idUtente and username=?";
		
		try {
			con = ds.getConnection();
			
			statement = con.prepareStatement(query);
			statement.setString(1,username);
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				
				OrderBean bean = new OrderBean();
				
				bean.setIdOrdine(result.getInt("idOrdine"));
				bean.setIdUtente(result.getInt("idUtente"));
				bean.setIdPagamento(result.getInt("idPagamento"));
				bean.setImportoTotale(result.getDouble("importoTotale"));
				bean.setQuantitaArticoli(result.getInt("quantitaArticoli"));
				bean.setDataAcquisto(result.getDate("dataAcquisto"));
				bean.setDataSpedizione(result.getDate("dataSpedizione"));
				bean.setStatoOrdine(result.getString("statoOrdine"));
				
				ordine.add(bean);
				
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
		
		return ordine;
	}
	@Override
	public int doGetLastKey() throws SQLException {
		
		Connection con = null;
		PreparedStatement statement = null;
		
		int id = 0;
		
		String querySel= "select * from "+TABLE_NAME ;
		
		try {
			con = ds.getConnection();
			statement = con.prepareStatement(querySel);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				
				id = result.getInt("idOrdine");
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
		
		return id;
		
	}
		
	}
	
	


	

