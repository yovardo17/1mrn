package co.edu.ufps.imrmtp.capaNegocio.negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dao.SolicitudDao;
import co.edu.ufps.imrmtp.capaDatos.dao.AsistenteDao;
import co.edu.ufps.imrmtp.capaDatos.dto.Asistente;
import co.edu.ufps.imrmtp.capaDatos.dto.Solicitud;
import co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente;

public class AsistenteNegocio implements Serializable {
	
	AsistenteDao asistenteDao = new AsistenteDao();
	SolicitudDao solicitudDao = new SolicitudDao();
        
	public List<TipoAsistente> getTiposAsistente(){
		List<TipoAsistente> tipos = new ArrayList<TipoAsistente>();
		try {
			tipos = asistenteDao.getTipoAsistente();
		} catch (Exception e) {
			e.printStackTrace();
			tipos=null;
		}
		 
		return tipos;
	}
	
	public String registrarAsistente(Asistente asistente){
		String msg="";
		try {
			msg = asistenteDao.validarAsistente(asistente, true);
			if(msg.equals("")){
				boolean rta = asistenteDao.registrarAsistente(asistente);
				if (rta) msg="";
				else msg="Registration was not Successful";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg="Registration was not Successful";
		}
		return msg;
	}
        
        //registrar solicitud de ayuda economica
        public String registrarSolicitud(Solicitud solicitud){
		String msg="";
		try {
			msg = solicitudDao.validarSolicitud(solicitud, true);
			if(msg.equals("")){
				boolean rta = solicitudDao.registrarSolicitud(solicitud);
				if (rta) msg="";
				else msg="Registration was not Successful";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg="Registration was not Successful";
		}
		return msg;
	}
	
	public Asistente verificarUsuario(String email, String password){
		Asistente asistente;
		
		try {
			asistente= asistenteDao.verificarUsuario(email, password);
		} catch (Exception e) {
			e.printStackTrace();
			asistente=null;
			
		}
		return asistente;
	}
        
    //para la recuperacion de la clave
    public String verificarUsuario(String email){
		String mensaje="";
		boolean rta=false;
		
		try {
			rta= asistenteDao.verificarUsuario(email);
			if (rta) mensaje = "A new password has been sent to your email. Please login and change it.";
			else mensaje="Error: Your password could not be recovered, please contact the chair. ";
		} catch (Exception e) {
			e.printStackTrace();
			mensaje="Error: Your password could not be recovered, please contact the chair. ";			
		}
		return mensaje;
	}
	
	public String editarAsistente(Asistente asistente){
		String msg="";
		try {
			msg = asistenteDao.validarAsistente(asistente, false);
			if(msg.equals("")){
				boolean rta = asistenteDao.editarAsistente(asistente);
				if (rta) msg="";
				else msg="Error. Your information was not updated.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg="Error. Your information was not updated.";
		}
		return msg;
	}
	
	public String guardarTipoComida(String tipoComida, int curso, int idAsistente){
		String msg="";
		try {
			msg = asistenteDao.guardarTipoComida(tipoComida, curso, idAsistente);			
		} catch (Exception e) {
			e.printStackTrace();
			msg="Error. Your information was not saved.";
		}
		return msg;
	}
	
	public int inscritosCurso(int idCurso) {
		int inscritos=0;
		try {
			inscritos = asistenteDao.inscritosCurso(idCurso);			
		} catch (Exception e) {
			e.printStackTrace();
			inscritos=-1;
		}
		return inscritos;
	}
	
	public List<Asistente> listadoInscritosCurso(int idCurso) {
		List<Asistente> inscritos= new ArrayList<Asistente>();
		try {
			inscritos = asistenteDao.listadoInscritosCurso(idCurso);			
		} catch (Exception e) {
			e.printStackTrace();
			inscritos=null;
		}
		return inscritos;
	}
	
	public Asistente getAsistente(String tipoDoc, String numDoc) {
		Asistente asistente = new Asistente();
		try {
			asistente = asistenteDao.getAsistente(tipoDoc, numDoc);
		} catch (Exception e) {
			e.printStackTrace();
			asistente= null;
		}
		return asistente;
	}
	
	public int getCursoAsistido(int idAsistente){
		int idCurso=-1;
		try {
			idCurso = asistenteDao.getCursoAsistido(idAsistente);
		} catch (Exception e) {
			e.printStackTrace();
			idCurso=-1;
		}
		return idCurso;
	}
	
	public List<Asistente> getAsistentesPendientes() {
		List<Asistente> asistentes= new ArrayList<Asistente>();
		try {
			asistentes = asistenteDao.listadoPendientes();			
		} catch (Exception e) {
			e.printStackTrace();
			asistentes=null;
		}
		return asistentes;
	}
	
	public boolean cambiarEstadoAsistente(int idAsistente, int estado){
		boolean rta= false;
		try {
			rta = asistenteDao.cambiarEstadoAsistente(idAsistente, estado);						
		} catch (Exception e) {
			e.printStackTrace();
			rta=false;
		}
		return rta;
	}
	
	public List<Asistente> getAsistentes() {
		List<Asistente> asistentes= new ArrayList<Asistente>();
		try {
			asistentes = asistenteDao.getAsistentes();			
		} catch (Exception e) {
			e.printStackTrace();
			asistentes=null;
		}
		return asistentes;
	}
	
	public Asistente getAsistente(int id) {
		Asistente asistente = new Asistente();
		try {
			asistente = asistenteDao.getAsistente(id);
		} catch (Exception e) {
			e.printStackTrace();
			asistente= null;
		}
		return asistente;
	}
}
