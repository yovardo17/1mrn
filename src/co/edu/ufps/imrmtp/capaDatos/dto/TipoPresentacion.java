package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;

public class TipoPresentacion implements Serializable{
	
	private short id;
	private String nombre;
	private String descripcion;
	
	public TipoPresentacion() {
		id=0;
		nombre="";
		descripcion="";
	}

	public short getId() {
		return id;
	}

	public void setId(short id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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
		TipoPresentacion other = (TipoPresentacion) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return this.id + " " + this.nombre;
	}
	
}
