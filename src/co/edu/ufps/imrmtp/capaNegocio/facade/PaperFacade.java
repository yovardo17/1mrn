/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ufps.imrmtp.capaNegocio.facade;

import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dao.EstadoDAO;
import co.edu.ufps.imrmtp.capaDatos.dao.TipoPresentacionDAO;
import co.edu.ufps.imrmtp.capaDatos.dto.Asistente;
import co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper;
import co.edu.ufps.imrmtp.capaDatos.dto.Paper;
import co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion;
import co.edu.ufps.imrmtp.capaDatos.dto.Topico;
import co.edu.ufps.imrmtp.capaNegocio.negocio.PaperNegocio;
import co.edu.ufps.imrmtp.capaNegocio.negocio.TopicoNegocio;

/**
 *
 * @author FH Vera-Rivera
 */
public class PaperFacade {
	
	PaperNegocio paperNegocio = new PaperNegocio();
	TipoPresentacionDAO tipoDao = new TipoPresentacionDAO();
	EstadoDAO estadoDao = new EstadoDAO();
    
    public boolean registrarPaper(Paper pp, Asistente aa) throws Exception{
        return paperNegocio.registrarPaper(pp, aa);
    }
    
    public boolean editarPaper(Paper pp, Asistente aa) throws Exception{
        return paperNegocio.editarPaper(pp, aa);
    }
    
    public boolean borrarPaper(int idPaper) throws Exception{
        return paperNegocio.borrarPaper(idPaper);
    }
    
    public List<Topico> cargar() throws Exception{
        return new TopicoNegocio().cargarTopicos();
    }
    
    public List<EstadoPaper> cargarestado() throws Exception {
        return paperNegocio.cargarEstado();
    }
    
    public List<TipoPresentacion> cargarTipos() throws Exception {
    	return paperNegocio.getTiposPresentacion();
    }
    
    public List<Paper> getPapers(Asistente asistente )throws Exception{
    	return paperNegocio.getPapers(asistente);
    }
    
    public List<Paper> getPapers(int idPaper, int idEstado, int idTopico, int idTipo )throws Exception{
    	return paperNegocio.getPapers(idPaper, idEstado, idTopico, idTipo);
    }
    
    public Paper getPaper(int id) throws Exception{
    	return paperNegocio.getPaper(id);
    }
    
    public String revisarPaper(int id, short tipoPresentacion, short estado, String observaciones)throws Exception{
    	return paperNegocio.revisarPaper(id, tipoPresentacion, estado, observaciones);
    }
    
    public TipoPresentacion getTipoPresentacion(int id)throws Exception{
    	return tipoDao.getTipo(id);
    }
    
    public EstadoPaper getEstadoPaper(short id)throws Exception{
    	return estadoDao.getEstadoPaper(id);
    }
    
    public int numeroPonencias(String ponente)throws Exception{
    	return paperNegocio.numeroPonencias(ponente);
    }
    
    public int numeroPonencias(Asistente ponente)throws Exception{
    	return paperNegocio.numeroPonencias(ponente);
    }
    
    public int numeroPapers(int idAsistente)throws Exception{
    	return paperNegocio.numeroPapers(idAsistente);
    }
    
    public List<Paper> getAbstractBook() throws Exception{
    	return paperNegocio.getAbstractBook();
    }
    public List<Paper> getPapersPresentar() throws Exception{
    	return paperNegocio.getPapersPresentar();
    }       
    
    public boolean cambiarEstadoPaper(int idPaper, short estado) throws Exception{
    	return paperNegocio.cambiarEstadoPaper(idPaper, estado);
    }
}
