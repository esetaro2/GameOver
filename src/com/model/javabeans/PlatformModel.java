package com.model.javabeans;

import java.sql.SQLException;

public interface PlatformModel {

	public void doSave(PlatformBean bean) throws SQLException;
	public void doDelete(int id) throws SQLException;
	
}
