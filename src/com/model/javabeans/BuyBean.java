package com.model.javabeans;

import java.io.Serializable;

public class BuyBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idOrdine,idArticolo;
	public BuyBean(int idOrdine, int idArticolo) {
		super();
		this.idOrdine = idOrdine;
		this.idArticolo = idArticolo;
	}
	public BuyBean() {
		super();
	}
	public int getIdOrdine() {
		return idOrdine;
	}
	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	public int getIdArticolo() {
		return idArticolo;
	}
	public void setIdArticolo(int idArticolo) {
		this.idArticolo = idArticolo;
	}
	
	
}
