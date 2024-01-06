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

import com.model.javabeans.UserBean;
import com.model.javabeans.UserModel;

public class UserDAO implements UserModel {

	private static DataSource ds;
	private static final String TABLE_NAME = "utente";
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/dbtsw2");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	public synchronized void doSave(UserBean user) throws SQLException{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		
		String insertSQL = "INSERT INTO utente (username, email, password, telefono, nome, cognome,via,cap,citta,ncivico,provincia)"
		+ " VALUES ( ? , ? , ? , ? , ? , ? , ?, ?, ?, ?, ?)";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getEmail());
		    preparedStatement.setString(3, user.getPassword());
		    preparedStatement.setString(4, user.getTelefono());
		    preparedStatement.setString(5, user.getNome());
		    preparedStatement.setString(6, user.getCognome());
		    preparedStatement.setString(7, user.getVia());
		    preparedStatement.setString(8, user.getCap());
		    preparedStatement.setString(9, user.getCitta());
		    preparedStatement.setInt(10, user.getnCivico());
		    preparedStatement.setString(11, user.getProvincia());
		    
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
	public synchronized void doDelete(int id ) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	
	
		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idUtente = ?";
	
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id);
		
			preparedStatement.executeUpdate();
			connection.commit();
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
	public synchronized UserBean searchUser(String username,String password) throws SQLException{
		Connection con = null;
		PreparedStatement statement = null;
		
		
		
		UserBean bean = new UserBean();
		
		String querySel= "Select * from "+TABLE_NAME+" where username = ? AND password = ? " ;
		
		try {
			con = ds.getConnection();
			statement = con.prepareStatement(querySel);
			statement.setString(1, username);
			statement.setString(2, password);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				
				bean.setIdUtente(result.getInt("idUtente"));
				bean.setUsername(result.getString("username"));
				bean.setPassword(result.getString("password"));
				bean.setCognome(result.getString("cognome"));
				bean.setNome(result.getString("nome"));
				bean.setEmail(result.getString("email"));
				bean.setTelefono(result.getString("telefono"));
				bean.setAdmin(result.getInt("admin"));
				bean.setVia(result.getString("via"));
				bean.setCap(result.getString("cap"));
				bean.setCitta(result.getString("citta"));
				bean.setnCivico(result.getInt("ncivico"));
				bean.setProvincia(result.getString("provincia"));
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
	@Override
	public synchronized UserBean doRetrieveByKey(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	
		UserBean bean = new UserBean();
	
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idUtente = ?";
	
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);
			
		
			ResultSet result = preparedStatement.executeQuery();
		
			while(result.next()) {
				
				bean.setIdUtente(result.getInt("idUtente"));
				bean.setUsername(result.getString("username"));
				bean.setPassword(result.getString("password"));
				bean.setCognome(result.getString("cognome"));
				bean.setNome(result.getString("nome"));
				bean.setEmail(result.getString("email"));
				bean.setTelefono(result.getString("telefono"));
				bean.setAdmin(result.getInt("admin"));
				bean.setVia(result.getString("via"));
				bean.setCap(result.getString("cap"));
				bean.setCitta(result.getString("citta"));
				bean.setnCivico(result.getInt("ncivico"));
				bean.setProvincia(result.getString("provincia"));
			}
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
		return bean;
	
	
	}
	public synchronized Collection<UserBean> doRetrieveAll(String order) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	
		Collection<UserBean> users = new LinkedList<UserBean>();
	
		String selectSQL = "SELECT * FROM " + TABLE_NAME;
	
	
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
		
			ResultSet result = preparedStatement.executeQuery();
		
			while(result.next()) {
				UserBean bean = new UserBean();
				bean.setIdUtente(result.getInt("idUtente"));
				bean.setUsername(result.getString("username"));
				bean.setPassword(result.getString("password"));
				bean.setCognome(result.getString("cognome"));
				bean.setNome(result.getString("nome"));
				bean.setEmail(result.getString("email"));
				bean.setTelefono(result.getString("telefono"));
				bean.setAdmin(result.getInt("admin"));
				bean.setVia(result.getString("via"));
				bean.setCap(result.getString("cap"));
				bean.setCitta(result.getString("citta"));
				bean.setnCivico(result.getInt("ncivico"));
				bean.setProvincia(result.getString("provincia"));
				users.add(bean);
			}
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
		return users;
	}
	@Override
	public void updatePassword(String email,String password) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null; 

		String insertSQL = "UPDATE " + TABLE_NAME + " SET password = ? WHERE email = ?";  

		try {
			connection = ds.getConnection(); 
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, password);
			preparedStatement.setString(2, email);

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
				
				id = result.getInt("idUtente");
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
	

	
