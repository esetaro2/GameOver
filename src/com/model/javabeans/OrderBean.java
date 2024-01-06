package com.model.javabeans;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

public class OrderBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int idOrdine;
	private int idUtente;
	private int idPagamento;
	private int quantitaArticoli;
	private double importoTotale;
	private Date dataAcquisto;
	private Date dataSpedizione;
	private String statoOrdine;
	
	public OrderBean(int idOrdine, int idUtente, int idPagamento, int quantitaArticoli, double importoTotale,
			Date dataAcquisto, Date dataSpedizione, String statoOrdine) {
		super();
		this.idOrdine = idOrdine;
		this.idUtente = idUtente;
		this.idPagamento = idPagamento;
		this.quantitaArticoli = quantitaArticoli;
		this.importoTotale = importoTotale;
		this.dataAcquisto = dataAcquisto;
		this.dataSpedizione = dataSpedizione;
		this.statoOrdine = statoOrdine;
	}
	
	public OrderBean() {
		super();
	}

	public int getIdOrdine() {
		return idOrdine;
	}

	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public int getIdPagamento() {
		return idPagamento;
	}

	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}

	public int getQuantitaArticoli() {
		return quantitaArticoli;
	}

	public void setQuantitaArticoli(int quantitaArticoli) {
		this.quantitaArticoli = quantitaArticoli;
	}

	public double getImportoTotale() {
		return importoTotale;
	}

	public void setImportoTotale(double importoTotale) {
		this.importoTotale = importoTotale;
	}

	public Date getDataAcquisto() {
		return dataAcquisto;
	}

	public void setDataAcquisto(Date dataAcquisto) {
		this.dataAcquisto = dataAcquisto;
	}

	public Date getDataSpedizione() {
		return dataSpedizione;
	}

	public void setDataSpedizione(Date randomBirthDate) {
		this.dataSpedizione = randomBirthDate;
	}

	public String getStatoOrdine() {
		return statoOrdine;
	}

	public void setStatoOrdine(String statoOrdine) {
		this.statoOrdine = statoOrdine;
	}
	
	
	

}
