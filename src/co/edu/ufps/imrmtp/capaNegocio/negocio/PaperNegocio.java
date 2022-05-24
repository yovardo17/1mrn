/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ufps.imrmtp.capaNegocio.negocio;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import co.edu.ufps.imrmtp.capaDatos.dao.EstadoDAO;
import co.edu.ufps.imrmtp.capaDatos.dao.PaperDAO;
import co.edu.ufps.imrmtp.capaDatos.dao.TipoPresentacionDAO;
import co.edu.ufps.imrmtp.capaDatos.dto.Asistente;
import co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper;
import co.edu.ufps.imrmtp.capaDatos.dto.Paper;
import co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.EmailService;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.ServicioEmail;

/**
 *
 * @author FH Vera-Rivera
 */
public class PaperNegocio {

    PaperDAO paperDao = new PaperDAO();
    public PaperNegocio() {
    }
    
    public boolean registrarPaper(Paper pp, Asistente aa) throws Exception{
        boolean rta = paperDao.registrar(pp, aa);
        return rta;
    }
    
    public boolean editarPaper(Paper pp, Asistente aa) throws Exception{
        boolean rta = paperDao.editar(pp, aa);
        return rta;
    }
    
    public boolean borrarPaper(int idPaper) throws Exception{
        boolean rta = paperDao.borrar(idPaper);
        return rta;
    }
    
    public List<EstadoPaper> cargarEstado() throws Exception{

    	List<EstadoPaper> list = new ArrayList<EstadoPaper>();
        EstadoDAO tp = new EstadoDAO();
        list = tp.cargarEstado();
        return list;
        
    }
    
    public List<TipoPresentacion> getTiposPresentacion()throws Exception{
    	
    	List<TipoPresentacion> lista = new ArrayList<TipoPresentacion>();
    	TipoPresentacionDAO tipoDao = new TipoPresentacionDAO();
    	lista = tipoDao.cargarTipos();
    	return lista;
    	
    }
    
    public List<Paper> getPapers(Asistente asistente) throws Exception {

    	List<Paper> papers = new ArrayList<Paper>();
    	papers = paperDao.getPapers(asistente.getId(), asistente.getTipoAsistente().getId());
    	return papers;
    	
    }
    
    public List<Paper> getPapers( int idPaper, int idEstado, int idTopico, int idTipo) throws Exception {

    	List<Paper> papers = new ArrayList<Paper>();
    	papers = paperDao.getPapers(idPaper, idEstado, idTopico, idTipo);
    	return papers;
    	
    }
    
    public Paper getPaper(int id) throws Exception{
    	Paper paper = paperDao.getPaper(id);
    	return paper;
    }
    
    public String revisarPaper(int idPaper, short tipoPresentacion, short estado, String observaciones) throws Exception{
    	String msg="";
    	boolean rta=false;
    	Paper paper = new Paper();
    	rta = paperDao.revisarPaper(idPaper, tipoPresentacion, estado, observaciones);
    	if (rta) {
    		paper = paperDao.getPaper(idPaper);
    		msg = enviarEvaluacion(paper);
    		if (msg.equals("")) rta=true;
    		//else msg = "Error. The email could not be sent ";
    	} else msg= "Error. The review was not saved.";
    	
    	return msg;
    }
    
    public String enviarEvaluacion(Paper paper)throws Exception{
    	boolean rta=false;
    	String emailEmisor = "foristom@gmail.com";
    	String claveEmail= "5ImrmpT5";    	
    	String emailEnviar = "";
    	String asunto="";
    	String msg="";
    	
    	try {
    		    	
	    	Date fechaActual = Calendar.getInstance().getTime();
	    	EmailService servicioEmail = new EmailService();
	    	
	    	DateFormat formato = new SimpleDateFormat("dd MMMMM yyyy");
	    	
	    	String mensaje = "Colombia, " + formato.format(fechaActual) + "\n\n<br><br>";
	    	mensaje += "Dear Authors, \n\n <br><br>";
	    	mensaje += "On behalf of the Organizing and Academic Committee of the 5+1 International Meeting for Researchers "
	    			+ "in Materials and Plasma Technology (5+1 IMRMPT), I inform you ";
	    	mensaje += "that your research work titled: "; 
	    	mensaje += "" + paper.getTituloEn().toUpperCase() + ". Authors:  ";
	    	
	    	for (Asistente asistente: paper.getAutores()) {
	    		mensaje +=  asistente.getNombre().toUpperCase() + " " + asistente.getApellido().toUpperCase() + ", ";
	    	}
	    	
	    	mensaje += " has been " + paper.getEstadoPaper().getNombre() + " for " +  paper.getTipoPresentacion().getNombre().toUpperCase() + "";
	    	mensaje += " at the " + paper.getTopico().getNombreEn() + " session during the 5+1 IMRMPT. \n\n <br><br>";
	    	
	    	if((paper.getEstadoPaper().getId()==2)||(paper.getEstadoPaper().getId()==4)){
	    	
		    	mensaje += "The 5+1 IMRMPT meeting will be held as an on-site and remote presentation from 2 to 4 June 2021 in Medellín, Colombia. \n\n <br><br>";		    	
		    	
		    	mensaje += "Hope to see you at the 5+1 IMRMPT meeting. \n\n <br><br> ";
	    	}
	    	
	    	if(paper.getObservaciones()!=null){
	    		if (!paper.getObservaciones().equals("")){
	    			mensaje += "Observations: \n\n <br><br> ";
	    			mensaje += paper.getObservaciones() + "\n\n <br><br> ";
	    		}
	    	}
	    	
	    	mensaje += "Best regards, \n\n <br><br>";
	    	
	    	mensaje += "Ely Dannier V. Niño \n <br>";
	    	mensaje += "Chairman 5+1 IMRMPT \n <br>";
	    	mensaje += "E-mail: imrmpt@foristom.org";
	    		    	
	    	
	    	if (paper.getEstadoPaper().getId()==1) 
	    		asunto= "[5+1 IMRMPT] Abstract id: " + paper.getId() + " has been revised. New status: " + paper.getEstadoPaper().getNombre(); 
	    	else 
	    		asunto= "[5+1 IMRMPT] Abstract id: " + paper.getId() + " has been " + paper.getEstadoPaper().getNombre();
	    	
	    	for (Asistente coautor: paper.getAutores()) {
	    		emailEnviar = coautor.getEmail();
	    		try {
	    			servicioEmail.generateAndSendEmail(asunto, emailEnviar, null , mensaje);
    	        } catch (MessagingException e) {
    	        	System.out.println("-----------  Registrar Paper - Error al enviar el email a: " + coautor.getEmail() + " paper Id: " + paper.getId());
    	        	System.out.println(e.toString());
    	        }   
	    	}
	    	rta=true;
    	} catch (Exception e){
    		msg= e.getMessage() + "   ------  \n\n  " + e.toString() ;
    	}
    	return msg;
    }
    
    public int numeroPonencias(String ponente)throws Exception{
    	int numero = paperDao.numeroPonencias(ponente);
    	return numero;
    }
    
    public int numeroPonencias(Asistente ponente)throws Exception{
    	int numero = paperDao.numeroPonencias(ponente);
    	return numero;
    }
    
    public int numeroPapers(int idAsistente)throws Exception{
    	int numero = paperDao.numeroPapers(idAsistente);
    	return numero;
    }
    
    public List<Paper> getAbstractBook() throws Exception{
    	List<Paper> papers = paperDao.getPapersBook();
    	return papers;
    }
    
    public List<Paper> getPapersPresentar() throws Exception{
    	List<Paper> papers = paperDao.getPapersPresentar();
    	return papers;
    }
    
    public boolean cambiarEstadoPaper(int idPaper, short estado) throws Exception{
    	boolean rta=false;
    	rta = paperDao.cambiarEstadoPaper(idPaper, estado);
    	return rta;
    }
}
