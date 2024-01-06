package com.model.javabeans;

import java.io.Serializable;

public class UserBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String username;
	private int idUtente;
	private String email;
	private String password;
	private int admin;
	private String telefono;
	private String nome;
	private String cognome;
	private String via;
	private String cap;
	private String citta;
	private int nCivico;
	private String provincia;
	
	public UserBean(String username, String email, String password, int admin, String telefono, String nome,
			String cognome, String via, String cap,String citta, int nCivico, String provincia) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.admin = admin;
		this.telefono = telefono;
		this.nome = nome;
		this.cognome = cognome;
		this.via = via;
		this.cap = cap;
		this.citta=citta;
		this.nCivico = nCivico;
		this.provincia = provincia;
	}

	public UserBean(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public UserBean() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
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

	public int getnCivico() {
		return nCivico;
	}

	public void setnCivico(int nCivico) {
		this.nCivico = nCivico;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	@Override
	public String toString() {
		return "UserBean [username=" + username + ", email=" + email + ", password=" + password + ", admin=" + admin
				+ ", telefono=" + telefono + ", nome=" + nome + ", cognome=" + cognome + "]";
	}
	
	
	
	
	
}
