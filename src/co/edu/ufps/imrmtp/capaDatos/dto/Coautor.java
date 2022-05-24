package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;

public class Coautor implements Serializable {
	private int id;
	private String tipoDocumento;
	private String numeroDocumento;
	private String apellido;
	private String nombre;
	private String email;
	private String pais;
	private String ciudad;
	private String institucion;
	private boolean esPonente;
	private Paper paper;
	
	public Coautor(int id, String tipoDocumento, String numeroDocumento, String apellido, String nombre, String email,
			String pais, String ciudad, String institucion, boolean esPonente, Paper paper) {
		super();
		this.id = id;
		this.tipoDocumento = tipoDocumento;
		this.numeroDocumento = numeroDocumento;
		this.apellido = apellido;
		this.nombre = nombre;
		this.email = email;
		this.pais = pais;
		this.ciudad = ciudad;
		this.institucion = institucion;
		this.esPonente = esPonente;
		this.paper = paper;
	}
	
	public Coautor() {
		super();
		this.id = 0;
		this.tipoDocumento = "";
		this.numeroDocumento = "";
		this.apellido = "";
		this.nombre = "";
		this.email = "";
		this.pais = "";
		this.ciudad = "";
		this.institucion = "";
		this.esPonente = false;
		this.paper = new Paper();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public String getNumeroDocumento() {
		return numeroDocumento;
	}

	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getInstitucion() {
		return institucion;
	}

	public void setInstitucion(String institucion) {
		this.institucion = institucion;
	}

	public boolean isEsPonente() {
		return esPonente;
	}

	public void setEsPonente(boolean esPonente) {
		this.esPonente = esPonente;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((apellido == null) ? 0 : apellido.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Coautor other = (Coautor) obj;
		if (apellido == null) {
			if (other.apellido != null)
				return false;
		} else if (!apellido.equals(other.apellido))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return this.nombre + " " + this.apellido;
	}

	 
}
