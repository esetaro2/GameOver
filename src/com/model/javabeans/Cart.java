package com.model.javabeans;

/**************************Cart è l'insieme di ProductBean che caratterizza il carrello************************/


import java.util.HashMap;
import java.util.Map;

public class Cart {

	public Cart() {
		products = new HashMap<Integer, Integer>();
	}
	
	public void addProduct(int id) {
		if(isPresent(id)) {
			int quantita = (int) products.get(id);
			products.put(id, quantita+1);
		}
		else
			products.put(id, 1);
	}
	
	public void setQuantity(int id, int newQuantity) {
		products.put(id, newQuantity);
	}
	

	//Rimuove un prodotto dal carrello indipendentemente dalla quantità
	public void deleteAllProduct(int id) {
		products.remove(id);
 	}
	public void deleteAll() {
		products.clear();
	}
	
	public boolean isPresent (int id) {
		if(products.containsKey(id))
			return true;
		else
			return false;
	}
	
	public HashMap<Integer, Integer> getProducts() {
		return  (HashMap<Integer, Integer>) products;
	}
		
	private Map<Integer, Integer> products;
}
