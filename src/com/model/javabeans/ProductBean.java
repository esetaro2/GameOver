package com.model.javabeans;

import java.io.Serializable;

public class ProductBean implements Serializable{

	/**
	 * 
	 */
	private int id ;
	private String nome;
	private double prezzo;
	private double iva;
	private String descr;
	private String recensione;
	private int quanTot;
	private String disp;
	private String img;
	private String genere;
	private String back_image;
	
	private static final long serialVersionUID = 1L;
	

	public ProductBean() {
		super();
	}


	public ProductBean(String nome, double prezzo, double iva, String descr, String recensione, int quanTot,
			String disp, String img,String genere,String back_image) {
		super();
		this.nome = nome;
		this.prezzo = prezzo;
		this.iva = iva;
		this.descr = descr;
		this.recensione = recensione;
		this.quanTot = quanTot;
		this.disp = disp;
		this.img = img;
		this.genere=genere;
		this.back_image=back_image;
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public double getPrezzo() {
		return prezzo;
	}


	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}


	public double getIva() {
		return iva;
	}


	public boolean setIva(double iva) {
		if(iva<0) return false;
		else {
			this.iva=iva;
			return true;
		}
	}


	public String getDescr() {
		return descr;
	}


	public void setDescr(String descr) {
		this.descr = descr;
	}


	public String getRecensione() {
		return recensione;
	}


	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}


	public int getQuanTot() {
		return quanTot;
	}


	public void setQuanTot(int quanTot) {
		this.quanTot = quanTot;
	}


	public String getDisp() {
		return disp;
	}


	public void setDisp(String disp) {
		this.disp = disp;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}


	public String getGenere() {
		return genere;
	}


	public void setGenere(String genere) {
		this.genere = genere;
	}


	public String getBack_image() {
		return back_image;
	}


	public void setBack_image(String back_image) {
		this.back_image = back_image;
	}
	
	
}
