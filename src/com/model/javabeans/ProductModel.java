package com.model.javabeans;

import java.sql.SQLException;
import java.util.Collection;

public interface ProductModel {

	public  void doSave(ProductBean product) throws SQLException;
	public void doDelete(int id) throws SQLException;
	public  Collection<ProductBean> doRetrieveByPlatform(String tipoPiattaforma) throws SQLException;
	public  Collection<ProductBean> doRetrieveAll() throws SQLException;
	public 	ProductBean doRetrieveByKey(int id) throws SQLException;
	public  int doRetrieveMaxID() throws SQLException;

	public  void updateName (int id, String newName) throws SQLException;
	public  void updateQuantity (int id, int newQuantity) throws SQLException;
	public  void updatePrice (int id, double newPrice) throws SQLException;
	public  void updateIva (int id, double newIva) throws SQLException;
	public  void updateDescription (int id, String newDescription) throws SQLException;
	public  void updateImage (int id, String uploadPath) throws SQLException;
	public  void updateGenere (int id, String genere) throws SQLException;
	public  Collection<ProductBean> doRetrieveByGenere(String genere) throws SQLException;
	
	public Collection<ProductBean> searchBar(String search) throws SQLException;
	
}
