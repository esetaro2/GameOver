package com.model.javabeans;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface AddressModel {

	public  void doSave (AddressBean address) throws SQLException;
	
	public  ArrayList<AddressBean> userAddresses(int idUtente);
	
	public 	AddressBean doRetrieveByKey(int code) throws SQLException;
	
	public  boolean doDelete(int code) throws SQLException;
	
	public  Collection<AddressBean> doRetrieveAll() throws SQLException;
}
