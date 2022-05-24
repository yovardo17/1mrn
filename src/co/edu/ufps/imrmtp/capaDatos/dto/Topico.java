package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;

public class Topico implements Serializable{
	
	private short id;
	private String nombreEs;
	private String nombreEn;
	private String descripcion;
	
	public Topico() {
		id=0;
		nombreEs="";
		descripcion="";
	}

	public short getId() {
		return id;
	}

	public void setId(short id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getNombreEs() {
		return nombreEs;
	}

	public void setNombreEs(String nombreEs) {
		this.nombreEs = nombreEs;
	}

	public String getNombreEn() {
		return nombreEn;
	}

	public void setNombreEn(String nombreEn) {
		this.nombreEn = nombreEn;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Topico other = (Topico) obj;
		if (id != other.getId())
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return this.id + " " + this.nombreEs;
	}
	
}
