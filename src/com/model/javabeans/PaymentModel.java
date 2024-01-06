package com.model.javabeans;


import java.sql.SQLException;
import java.util.Collection;

public interface PaymentModel {

	public void doSave(PaymentBean bean) throws SQLException;
		
	public void doDelete(int id) throws SQLException;
	
	public Collection<PaymentBean> doRetrieveByUser(int idUtente) throws SQLException;
}
