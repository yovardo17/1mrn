package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

public class SesionPonencia implements Serializable{

	private int id;
	private Date fecha;
	private Time horaInicio;
	private Time horaFin;
	private String url;
	private int duracion;
	private String observaciones;	
	private Room room;
	private Paper paper;
	private String tipoSesion;
	
	
	public SesionPonencia() {
		super();
		id=-1;		
	}


	public SesionPonencia(int id, Date fecha, Time horaInicio, Time horaFin, String url, int duracion,
			String observaciones, Room room, Paper paper, String tipo) {
		super();
		this.id = id;
		this.fecha = fecha;
		this.horaInicio = horaInicio;
		this.horaFin = horaFin;
		this.url = url;
		this.duracion = duracion;
		this.observaciones = observaciones;
		this.room = room;
		this.paper = paper;
		this.tipoSesion = tipo;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Date getFecha() {
		return fecha;
	}


	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}


	public Time getHoraInicio() {
		return horaInicio;
	}


	public void setHoraInicio(Time horaInicio) {
		this.horaInicio = horaInicio;
	}


	public Time getHoraFin() {
		return horaFin;
	}


	public void setHoraFin(Time horaFin) {
		this.horaFin = horaFin;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public int getDuracion() {
		return duracion;
	}


	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}


	public String getObservaciones() {
		return observaciones;
	}


	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}


	public Room getRoom() {
		return room;
	}


	public void setRoom(Room room) {
		this.room = room;
	}


	public Paper getPaper() {
		return paper;
	}


	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public String getTipoSesion() {
		return tipoSesion;
	}


	public void setTipoSesion(String tipoSesion) {
		this.tipoSesion = tipoSesion;
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
		SesionPonencia other = (SesionPonencia) obj;
		if (id != other.id)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "SesionPonencia [fecha=" + fecha + ", horaInicio=" + horaInicio + ", horaFin=" + horaFin + ", room="
				+ room + ", paper=" + paper + "]";
	}
	
	
	
	
	
}
