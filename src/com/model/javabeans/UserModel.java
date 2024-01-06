package com.model.javabeans;


import java.sql.SQLException;
import java.util.Collection;


public interface UserModel {

	public void doSave(UserBean user) throws SQLException;
	public void doDelete(int id ) throws SQLException;
	public UserBean searchUser(String username,String password) throws SQLException;
	public UserBean doRetrieveByKey(int id) throws SQLException;
	public Collection<UserBean> doRetrieveAll(String order) throws SQLException;
	public int doGetLastKey() throws SQLException;
	
	void updatePassword(String email, String password) throws SQLException;
		
}
