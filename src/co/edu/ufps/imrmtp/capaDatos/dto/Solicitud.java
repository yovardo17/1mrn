package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * Clase que representa un asistente al congreso o conferencia. Pueden ser
 * organizadores y publico en general. 
 * @author victor
 *
 */
public class Solicitud implements Serializable{
	
	private String ubico;
	private String fecha;
	private String apellidos;
	private String nombres;
	private String motivo;
	private int cantidad;
	private String soporte;

	public Solicitud() {
		this.ubico = "";
		this.fecha = "";
		this.apellidos = "";
		this.nombres = "";
		this.motivo = "";
		this.cantidad = 0;
		this.soporte = "";
	}
	
	public Solicitud(String ubico,String fecha,String apellidos,
                String nombres,String motivo,int cantidad, String soporte) {
		super();
		this.ubico = ubico;
		this.fecha = fecha;
		this.apellidos = apellidos;
		this.nombres = nombres;
		this.motivo = motivo;
		this.cantidad = cantidad;
		this.soporte = soporte;
	}

	//conjunto de get y set

    public String getUbico() {
        return ubico;
    }

    public void setUbico(String ubico) {
        this.ubico = ubico;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getSoporte() {
        return soporte;
    }

    public void setSoporte(String soporte) {
        this.soporte = soporte;
    }
        
    //inserto hash

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + Objects.hashCode(this.apellidos);
        hash = 53 * hash + Objects.hashCode(this.nombres);
        return hash;
    }
    
    //inserto equals

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Solicitud other = (Solicitud) obj;
        if (!Objects.equals(this.apellidos, other.apellidos)) {
            return false;
        }
        if (!Objects.equals(this.nombres, other.nombres)) {
            return false;
        }
        return true;
    }
    
    //inserto toString

    @Override
    public String toString() {
        return "Solicitud{" + "apellidos=" + apellidos + ", nombres=" + nombres + '}';
    }
    
}
