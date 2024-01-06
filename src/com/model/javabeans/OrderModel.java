package com.model.javabeans;

import java.sql.SQLException;
import java.util.Collection;

public interface OrderModel {

	public void doSave(OrderBean order) throws SQLException;
	public void doDelete(int id) throws SQLException;
	public Collection<OrderBean> doRetrieveAll() throws SQLException;
	public Collection<OrderBean> doRetrieveByDates(String dataInizio, String dataFine) throws SQLException;
	public Collection<OrderBean> doRetrieveByUser(String username) throws SQLException;
	public int doGetLastKey() throws SQLException;
	
}
