package com.model.javabeans;

import java.io.Serializable;

public class AddressBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String via,cap,citta,provincia;
	private int ncivico;
	private int id_utente;
	
	public AddressBean(int id,String via, String cap, String citta, String provincia, int ncivico, int id_utente) {
		super();
		this.id=id;
		this.via = via;
		this.cap = cap;
		this.citta = citta;
		this.provincia = provincia;
		this.ncivico = ncivico;
		this.id_utente = id_utente;
	}

	public AddressBean() {
		super();
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public int getNcivico() {
		return ncivico;
	}

	public void setNcivico(int ncivico) {
		this.ncivico = ncivico;
	}

	public int getId_utente() {
		return id_utente;
	}

	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	

}
