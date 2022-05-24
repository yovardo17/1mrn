package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Clase que representa un asistente al congreso o conferencia. Pueden ser
 * organizadores y publico en general. 
 * @author Fredy
 *
 */
public class Asistente implements Serializable{
	
	private int id;
	private String tipoDocumento;
	private String numeroDocumento;
	private String apellido;
	private String nombre;
	private String email;
	private String pais;
	private String ciudad;
	private String institucion;
	private String password;
	private String tipoComida;
	private short idTipoCurso;
	private String telefono;
	private String emailsContacto;
	private String direccion;
	
	private TipoAsistente tipoAsistente;
	private EstadoAsistente estadoAsistente;
	private List<Paper> papers;
	
	public Asistente() {
		this.id = 0;
		this.tipoDocumento = "";
		this.numeroDocumento = "";
		this.apellido = "";
		this.nombre = "";
		this.email = "";
		this.pais = "";
		this.ciudad = "";
		this.institucion = "";
		this.password = "";
		this.tipoAsistente = new TipoAsistente();
		this.estadoAsistente = new EstadoAsistente();
		estadoAsistente.setId((short)1);
		this.telefono="";
		this.emailsContacto="";
		this.direccion="";
	}
	
	public Asistente(int id, String tipoDocumento, String numeroDocumento,
			String apellido, String nombre, String email, String pais,
			String ciudad, String institucion, String password,
			TipoAsistente tipoAsistente, String direccion
			) {
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
		this.password = password;
		this.tipoAsistente = tipoAsistente;
		this.estadoAsistente = new EstadoAsistente();
		estadoAsistente.setId((short)1);
		this.telefono="";
		this.emailsContacto="";
		this.direccion = direccion;
	}

	/**
	 * 
	 * @return
	 */
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

	public String getInstitucion() {
		return institucion;
	}

	public void setInstitucion(String institucion) {
		this.institucion = institucion;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}		

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmailsContacto() {
		return emailsContacto;
	}

	public void setEmailsContacto(String emailsContacto) {
		this.emailsContacto = emailsContacto;
	}

	public TipoAsistente getTipoAsistente() {
		return tipoAsistente;
	}

	public void setTipoAsistente(TipoAsistente tipoAsistente) {
		this.tipoAsistente = tipoAsistente;
	}

	public EstadoAsistente getEstadoAsistente() {
		return estadoAsistente;
	}

	public void setEstadoAsistente(EstadoAsistente estadoAsistente) {
		this.estadoAsistente = estadoAsistente;
	}
	
	public List<Paper> getPapers() {
		return papers;
	}

	public void setPapers(List<Paper> papers) {
		this.papers = papers;
	}

	public String getTipoComida() {
		return tipoComida;
	}

	public void setTipoComida(String tipoComida) {
		this.tipoComida = tipoComida;
	}

	public short getIdTipoCurso() {
		return idTipoCurso;
	}

	public void setIdTipoCurso(short idTipoCurso) {
		this.idTipoCurso = idTipoCurso;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
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
		Asistente other = (Asistente) obj;
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
