package co.edu.ufps.imrmtp.capaDatos.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Paper implements Serializable{
	private int id;
	private String tituloEs;
	private String palabrasClaveEs;
	private String resumenEs;
	private String tituloEn;
	private String palabrasClaveEn;
	private String resumenEn;
	private String archivo;
	private Date fechaRegistro;
	private Date fechaEstado;
	private String observaciones;
	
	private Topico topico;
	private EstadoPaper estadoPaper;
	private TipoPresentacion tipoPresentacion;
	private List<Asistente> autores;
	private List<Coautor> coautores;
	
	private String ponente;
	
	public Paper() {
		id=0;
		autores = new ArrayList<Asistente>();
		coautores = new ArrayList<Coautor>();
		ponente = "";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;		
	}

	public String getTituloEs() {
		return tituloEs;
	}

	public void setTituloEs(String tituloEs) {
		this.tituloEs = tituloEs;
	}

	public String getPalabrasClaveEs() {
		return palabrasClaveEs;
	}

	public void setPalabrasClaveEs(String palabrasClaveEs) {
		this.palabrasClaveEs = palabrasClaveEs;
	}

	public String getResumenEs() {
		return resumenEs;
	}

	public void setResumenEs(String resumenEs) {
		this.resumenEs = resumenEs;
	}

	public String getTituloEn() {
		return tituloEn;
	}

	public void setTituloEn(String tituloEn) {
		this.tituloEn = tituloEn;
	}

	public String getPalabrasClaveEn() {
		return palabrasClaveEn;
	}

	public void setPalabrasClaveEn(String palabrasClaveEn) {
		this.palabrasClaveEn = palabrasClaveEn;
	}

	public String getResumenEn() {
		return resumenEn;
	}

	public void setResumenEn(String resumenEn) {
		this.resumenEn = resumenEn;
	}

	public String getArchivo() {
		return archivo;
	}

	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}

	public Topico getTopico() {
		return topico;
	}

	public void setTopico(Topico topico) {
		this.topico = topico;
	}

	public EstadoPaper getEstadoPaper() {
		return estadoPaper;
	}

	public void setEstadoPaper(EstadoPaper estadoPaper) {
		this.estadoPaper = estadoPaper;
	}

	public List<Asistente> getAutores() {
		return autores;
	}

	public void setAutores(List<Asistente> autores) {
		this.autores = autores;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public Date getFechaEstado() {
		return fechaEstado;
	}

	public void setFechaEstado(Date fechaEstado) {
		this.fechaEstado = fechaEstado;
	}
	
	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public TipoPresentacion getTipoPresentacion() {
		return tipoPresentacion;
	}

	public void setTipoPresentacion(TipoPresentacion tipoPresentacion) {
		this.tipoPresentacion = tipoPresentacion;
	}	

	public String getPonente() {
		return ponente;
	}

	public void setPonente(String ponente) {
		this.ponente = ponente;
	}

	public List<Coautor> getCoautores() {
		return coautores;
	}

	public void setCoautores(List<Coautor> coautores) {
		this.coautores = coautores;
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
		Paper other = (Paper) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return this.id +"";
	}
	

}
