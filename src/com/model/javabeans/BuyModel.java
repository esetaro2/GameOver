package com.model.javabeans;

import java.sql.SQLException;

public interface BuyModel {

	public  void doDelete(int idOrdine) throws SQLException;
	
	public  void doSave(BuyBean bean) throws SQLException;
}
