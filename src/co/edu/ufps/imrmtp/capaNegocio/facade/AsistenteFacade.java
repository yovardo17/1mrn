package co.edu.ufps.imrmtp.capaNegocio.facade;

import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dto.Asistente;
import co.edu.ufps.imrmtp.capaDatos.dto.Solicitud;
import co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente;
import co.edu.ufps.imrmtp.capaNegocio.negocio.AsistenteNegocio;

public class AsistenteFacade {
	
	AsistenteNegocio negocio = new AsistenteNegocio();
	
	public List<TipoAsistente> getTipoAsistente(){
		return negocio.getTiposAsistente();
	}
	
	public String registrarAsistente(String tipoDocumento, 
			String numeroDocumento, String apellido, String nombre, 
			String email, String pais, String ciudad, String institucion, 
			String password, short idTipo, String direccion){
		TipoAsistente tipoAsistente = new TipoAsistente();
		tipoAsistente.setId(idTipo);
		
		Asistente asistente = new Asistente(0, tipoDocumento, numeroDocumento, 
				apellido, nombre, email, pais, ciudad, institucion, 
				password, tipoAsistente, direccion);
		return negocio.registrarAsistente(asistente);
	}
        
        //Esta es para solicitar a la fundacion la solicitud de ayuda economica
        public String registrarSolicitud(String ubico,String fecha,String apellidos,
                String nombres,String motivo,int cantidad, String soporte){
            
		Solicitud solicitud = new Solicitud(ubico,fecha,apellidos,nombres,
                        motivo,cantidad,soporte);
		return negocio.registrarSolicitud(solicitud);
        }
	
	public Asistente verificarUsuario(String email, String password){
		return negocio.verificarUsuario(email, password);
	}
        
        //para recuperar el correo verifica que exista correo
    public String verificarUsuario(String email){
		return negocio.verificarUsuario(email);
	}
	
	public String editarAsistente(Asistente asistente){
		return negocio.editarAsistente(asistente);
	}
	
	public String guardarTipoComida(String tipoComida, int curso, int idAsistente){
		return negocio.guardarTipoComida(tipoComida, curso, idAsistente);
	}
	
	public int inscritosCurso(int idCurso) throws Exception {
		return negocio.inscritosCurso(idCurso);
	}
	
	public List<Asistente> listadoIncritosCurso(int idCurso) throws Exception {
		return negocio.listadoInscritosCurso(idCurso);
	}
	
	public Asistente getAsistente(String tipoDoc, String numDoc) throws Exception {
		return negocio.getAsistente(tipoDoc, numDoc);
	}
	
	public int getCursoAsistido(int idAsistente){
		return negocio.getCursoAsistido(idAsistente);
	}
	
	public List<Asistente> getAsistentesPendientes(){
		return negocio.getAsistentesPendientes();
	}
	
	public boolean cambiarEstadoAsistente(int idAsistente, int estado){
		return negocio.cambiarEstadoAsistente(idAsistente, estado);
	}
	
	public List<Asistente> getAsistentes(){
		return negocio.getAsistentes();
	}
	
	public Asistente getAsistente(int id) throws Exception {
		return negocio.getAsistente(id);
	}
}
