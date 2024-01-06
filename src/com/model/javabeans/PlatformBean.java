package com.model.javabeans;

import java.io.Serializable;

public class PlatformBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int idPiattaforma,idArticoloRef;
	private String descr,tipoPiattaforma;
	
	public PlatformBean(int idPiattaforma, int idArticoloRef, String descr, String tipoPiattaforma) {
		super();
		this.idPiattaforma = idPiattaforma;
		this.idArticoloRef = idArticoloRef;
		this.descr = descr;
		this.tipoPiattaforma = tipoPiattaforma;
	}
	
	public PlatformBean() {
		super();
	}
	public int getIdPiattaforma() {
		return idPiattaforma;
	}
	public void setIdPiattaforma(int idPiattaforma) {
		this.idPiattaforma = idPiattaforma;
	}
	public int getIdArticoloRef() {
		return idArticoloRef;
	}
	public void setIdArticoloRef(int idArticoloRef) {
		this.idArticoloRef = idArticoloRef;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getTipoPiattaforma() {
		return tipoPiattaforma;
	}
	public void setTipoPiattaforma(String tipoPiattaforma) {
		this.tipoPiattaforma = tipoPiattaforma;
	}
	
	

	
}
