package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Room implements Serializable {
	private int id;
	private String link;
	private String password;
	private String meetingId;
	private String hostName;
	private boolean estado;
	private boolean mostrarLink;
	private String chair;
	private List<SesionPonencia> sesiones;
	private String linkYoutube;
	private String linkFacebook;
	private short orden;
	private String imagen;
	
	public Room() {
		super();
		this.sesiones = new ArrayList<SesionPonencia>();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMeetingId() {
		return meetingId;
	}
	public void setMeetingId(String meetingId) {
		this.meetingId = meetingId;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}	
	public boolean isMostrarLink() {
		return mostrarLink;
	}
	public void setMostrarLink(boolean mostrarLink) {
		this.mostrarLink = mostrarLink;
	}	
	public String getChair() {
		return chair;
	}
	public void setChair(String chair) {
		this.chair = chair;
	}	
	public List<SesionPonencia> getSesiones() {
		return sesiones;
	}

	public void setSesiones(List<SesionPonencia> sesiones) {
		this.sesiones = sesiones;
	}
	
	public String getLinkYoutube() {
		return linkYoutube;
	}

	public void setLinkYoutube(String linkYoutube) {
		this.linkYoutube = linkYoutube;
	}

	public String getLinkFacebook() {
		return linkFacebook;
	}

	public void setLinkFacebook(String linkFacebook) {
		this.linkFacebook = linkFacebook;
	}
	
	public short getOrden() {
		return orden;
	}

	public void setOrden(short orden) {
		this.orden = orden;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((meetingId == null) ? 0 : meetingId.hashCode());
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
		Room other = (Room) obj;
		if (meetingId == null) {
			if (other.meetingId != null)
				return false;
		} else if (!meetingId.equals(other.meetingId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Room [meetingId=" + meetingId + ", hostName=" + hostName + ",password=" + password +"]";
	}	
}
