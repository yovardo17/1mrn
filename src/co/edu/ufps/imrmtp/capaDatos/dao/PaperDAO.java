/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ufps.imrmtp.capaDatos.dao;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import co.edu.ufps.imrmtp.capaDatos.dto.Asistente;
import co.edu.ufps.imrmtp.capaDatos.dto.Paper;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.Conexion;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.EmailService;
/**
 *
 * @author FH Vera-Rivera
 */
public class PaperDAO implements Serializable {

    public PaperDAO() {
    }
    
    public boolean registrar(Paper pp, Asistente aa) throws SQLException{
        boolean rta = false;
        Conexion con = new Conexion();
        int idPaper=0;        
        int idAsistente=0;
        boolean es_nuevo=true;
        
        Connection c = con.conectar("PaperDAO.registrar()");
        c.setAutoCommit(false);
        
        PreparedStatement ps=null;
        PreparedStatement ps2=null;
        ResultSet rst=null;
        
        Date fechaActual = Calendar.getInstance().getTime();
    	EmailService servicioEmail = new EmailService();
    	DateFormat formato = new SimpleDateFormat("dd/MMM/yyyy");
                
        try {
        	// insertar el paper
        	String sql = "INSERT INTO paper  ( resumen_es, titulo_es, resumen_en, titulo_en, id_estado, id_topico, "
        			+ "fecha_registro, fecha_estado, id_tipo_presentacion, ponente ) "
                    + " VALUES (?,?,?,?,?,?, current_date, current_date, ?, ? )";
        	ps = c.prepareStatement(sql);
            ps.setString(1, pp.getResumenEs());
            ps.setString(2, pp.getTituloEs());
            ps.setString(3, pp.getResumenEn());
            ps.setString(4, pp.getTituloEn());
            ps.setInt(5, 1); // Estado pendiente
            ps.setInt(6, pp.getTopico().getId());
            ps.setShort(7, pp.getTipoPresentacion().getId());
            ps.setString(8, pp.getPonente());
            ps.execute();
            ps.close();
            ps = null;
            
            // obtener el id del paper que se acaba de guardar.
            sql ="SELECT max(id) FROM paper ";
            ps = c.prepareStatement(sql);
            rst= ps.executeQuery();
            
            if(rst.next()) idPaper= rst.getInt(1);
            else throw new Exception("Error");
            
            rst.close();
            rst=null;
            
            ps.close();
            ps = null;
            
            // actualizar los datos del asistente
            /*sql = "UPDATE asistente SET tipo_documento=?, numero_documento=?, "
    				+ "nombre=?, apellido=?, email=?, pais=?, ciudad=?, institucion=?, "
    				+ "telefono_contacto=?, emails_contacto=?  ";
            sql += " WHERE email=? ";
            
            ps = c.prepareStatement(sql);
    		ps.setString(1, aa.getTipoDocumento());
    		ps.setString(2, aa.getNumeroDocumento());
    		ps.setString(3, aa.getNombre());
    		ps.setString(4, aa.getApellido());
    		ps.setString(5, aa.getEmail());
    		ps.setString(6, aa.getPais());
    		ps.setString(7, aa.getCiudad());
    		ps.setString(8, aa.getInstitucion());
    		ps.setString(9, aa.getTelefono());
    		ps.setString(10, aa.getEmailsContacto());
    		ps.setString(11, aa.getEmail());
    		
    		ps.execute();
    		rta=true;
    		
    		ps.close();
    		ps=null;
            */                        
            boolean esPonente=false;
            
            // guardar o actualizar los autores 
            for(Asistente coautor: pp.getAutores()) {
            	
            	// Buscar si el asistente ya está registrado
            	sql = "SELECT * FROM asistente where email = ?";
            	ps = c.prepareStatement(sql);    
            	ps.setString(1, coautor.getEmail());
            	rst= ps.executeQuery();
            	
            	if (rst.next()) {
            		idAsistente = rst.getInt(1);
            		es_nuevo= false;
            	} else {
            		es_nuevo= true;
            		sql = "INSERT INTO asistente (nombre, apellido, email, institucion, ciudad, pais, password ) "
            			+ "VALUES (?,?,?,?,?,?, md5('Imrmpt-"+ idPaper +"'))";
            		
            		ps2 = c.prepareStatement(sql);
            		ps2.setString(1, coautor.getNombre());
            		ps2.setString(2, coautor.getApellido());
            		ps2.setString(3, coautor.getEmail());
            		ps2.setString(5, coautor.getPais());
            		ps2.setString(6, coautor.getCiudad());
            		ps2.setString(4, coautor.getInstitucion());
            		
            		ps2.execute();
            		
            		ps2.close();
            		ps2=null;
            	}
            	
            	rst.close();
                rst=null;
                
                ps.close();
                ps = null;
            	
                // Buscar el id del asistente
                sql = "SELECT * FROM asistente where email = ?";
            	ps = c.prepareStatement(sql);    
            	ps.setString(1, coautor.getEmail());
            	rst= ps.executeQuery();
            	
            	if (rst.next()) {
            		idAsistente = rst.getInt(1);
            	}
            	
            	rst.close();
                rst=null;
                
                ps.close();
                ps = null;
            	
            	// insertar el autor en la tabla asistente paper
        		sql="INSERT INTO asistente_paper (id_paper, id_asistente, es_ponente ) VALUES (?,?,?)";
        		
        		ps2 = c.prepareStatement(sql);
        		ps2.setInt(1, idPaper);
        		ps2.setInt(2, idAsistente);
        		
        		if (coautor.toString().equals(pp.getPonente()))  esPonente= true;
        		else esPonente= false;
        		ps2.setBoolean(3, esPonente);
        		
        		ps2.execute();
        		
        		ps2.close();
        		ps2=null;
        		
        		String msg="";
                String asunto="[5+1 IMRMPT] Abstract Id: " + idPaper + " has been submitted.  "; 
                
                // Enviar email al autor
                msg += "Dear Author. <br><br>";
                if (es_nuevo) {
    	        	msg += "\n\n The research work entitled \"" + pp.getTituloEn() + "\" and identified as ID:" + idPaper + 
    	        			" with you as an author has been sumbmitted to the 5+1 International Meeting for Researchers ";
    	        	msg += " in Materials and Plasma Technology (5+1 IMRMPT). <br><br>";
    	        	msg += "\n\n According to the above, you can log in with your email: " + coautor.getEmail() + " and password: 'Imrmpt-" +  idPaper  + "'  "
    	        			+ " \n\n <br> <br> We recommend you must change the password when you log in. \n\n <br><br>";
    	        } else {	
            	
    	        	msg += "Your research work entitled '" + pp.getTituloEn() + "' and identified as ID: " + idPaper + 
    	        			" has been submitted to the 5+1 International Meeting for Researchers "
    	        		+ "in Materials and Plasma Technology (5+1 IMRMPT). \n\n <br><br>";
    	        }
    	        
                msg += "The 5+1 IMRMPR meeting will be held in an on-site and remote presentation from 2 to 4 June 2021 in Medellín, Colombia. \n\n <br><br> ";	
                
    	        msg += "Hope to see you at the 5+1 IMRMPT meeting. \n\n <br><br> ";	        
    	        msg += "Best regards, <br><br>\n\n";
    	        
    	        msg += "Ely Dannier V. Niño, Chairman. <br>\n";
    	        msg += "International Meeting for Researchers in Materials and Plasma Technology (5+1 IMRMPT) <br> \n\n";
    	        msg += "Foundation of Researchers in Science and Technology of Materials (FORISTOM) <br> \n\n";
    	        msg += "https://foristom.org/6imrmpt/ <br>";
        	    
    	        try {
    	        	servicioEmail.generateAndSendEmail(asunto, coautor.getEmail(), null , msg); 
    	        } catch (MessagingException e) {
    	        	System.out.println("-----------  Registrar Paper - Error al enviar el email a: " + coautor.getEmail() + " paper Id: " + idPaper);
    	        	System.out.println(e.toString());
    	        }                        		
            }
            
            c.commit();
            rta = true;
            
		} catch (Exception e) {  
			e.printStackTrace();
			rta=false;
			c.rollback();
		}
        
        c.setAutoCommit(true);        
        
        c.close();
        c = null;
        
        return rta;
    }
    
    public boolean editar(Paper pp, Asistente aa) throws Exception{
        boolean rta = false;
        Conexion con = new Conexion();
        int idAsistente=0;
        
        Connection c = con.conectar("PaperDAO.editar()");
        c.setAutoCommit(false);
        
        PreparedStatement ps=null;
        PreparedStatement ps2=null;
        ResultSet rst=null;
        ResultSet rst2=null;
        try {
        	// actualizar el paper
        	String sql = "UPDATE paper SET resumen_es=?, titulo_es=?, resumen_en=?, titulo_en=?, id_topico=?, "
        			+ " id_tipo_presentacion=?, ponente=? "
                    + " WHERE id =  ? ";
        	ps = c.prepareStatement(sql);
            ps.setString(1, pp.getResumenEs());
            ps.setString(2, pp.getTituloEs());
            ps.setString(3, pp.getResumenEn());
            ps.setString(4, pp.getTituloEn());
            ps.setInt(5, pp.getTopico().getId());
            ps.setShort(6, pp.getTipoPresentacion().getId());
            ps.setString(7, pp.getPonente());
            ps.setInt(8, pp.getId());
            ps.execute();
            ps.close();
            ps = null;
            
            // actualizar los datos del asistente
            /*sql = "UPDATE asistente SET tipo_documento=?, numero_documento=?, "
    				+ "nombre=?, apellido=?, email=?, pais=?, ciudad=?, institucion=?, "
    				+ "telefono_contacto=?, emails_contacto=?  ";
            sql += " WHERE email=? ";
            
            ps = c.prepareStatement(sql);
    		ps.setString(1, aa.getTipoDocumento());
    		ps.setString(2, aa.getNumeroDocumento());
    		ps.setString(3, aa.getNombre());
    		ps.setString(4, aa.getApellido());
    		ps.setString(5, aa.getEmail());
    		ps.setString(6, aa.getPais());
    		ps.setString(7, aa.getCiudad());
    		ps.setString(8, aa.getInstitucion());
    		ps.setString(9, aa.getTelefono());
    		ps.setString(10, aa.getEmailsContacto());
    		ps.setString(11, aa.getEmail());
    		
    		ps.execute();
    		rta=true;
    		
    		ps.close();
    		ps=null;
            */                        
            boolean esPonente=false;
            boolean es_nuevo=false;
            
            //Borrar los autores que estaban antes de la edición
            sql = "DELETE FROM asistente_paper  WHERE id_paper =  ?  ";
        	ps = c.prepareStatement(sql);
        	ps.setInt(1, pp.getId());
            ps.execute();
            ps.close();
            ps = null;
            
            // guardar o actualizar los autores 
            for(Asistente coautor: pp.getAutores()) {
            	
            	// Buscar si el asistente ya está registrado
            	sql = "SELECT * FROM asistente where email = ?";
            	ps = c.prepareStatement(sql);    
            	ps.setString(1, coautor.getEmail());
            	rst= ps.executeQuery();
            	
            	if (rst.next()) {
            		idAsistente = rst.getInt(1);
            		es_nuevo= false;
            	} else {
            		es_nuevo= true;
            		sql = "INSERT INTO asistente (nombre, apellido, email, institucion, ciudad, pais, password ) "
            			+ "VALUES (?,?,?,?,?,?, md5('Imrmpt-"+ pp.getId() +"'))";
            		
            		ps2 = c.prepareStatement(sql);
            		ps2.setString(1, coautor.getNombre());
            		ps2.setString(2, coautor.getApellido());
            		ps2.setString(3, coautor.getEmail());
            		ps2.setString(5, coautor.getPais());
            		ps2.setString(6, coautor.getCiudad());
            		ps2.setString(4, coautor.getInstitucion());
            		
            		ps2.execute();
            		
            		ps2.close();
            		ps2=null;
            	}
            	
            	rst.close();
                rst=null;
                
                ps.close();
                ps = null;
            	
                // Buscar el id del asistente
                sql = "SELECT * FROM asistente where email = ?";
            	ps = c.prepareStatement(sql);    
            	ps.setString(1, coautor.getEmail());
            	rst= ps.executeQuery();
            	
            	if (rst.next()) {
            		idAsistente = rst.getInt(1);
            	}
            	
            	rst.close();
                rst=null;
                
                ps.close();
                ps = null;
            	
            	// insertar el autor en la tabla asistente paper
        		sql="INSERT INTO asistente_paper (id_paper, id_asistente, es_ponente ) VALUES (?,?,?)";
        		
        		ps2 = c.prepareStatement(sql);
        		ps2.setInt(1, pp.getId());
        		ps2.setInt(2, idAsistente);
        		
        		if (coautor.toString().equals(pp.getPonente()))  esPonente= true;
        		else esPonente= false;
        		ps2.setBoolean(3, esPonente);
        		
        		ps2.execute();
        		
        		ps2.close();
        		ps2=null;
            }
            
            c.commit();
            rta = true;
		} catch (Exception e) {
			e.printStackTrace();
			rta=false;
			c.rollback();
		}
        
        c.setAutoCommit(true);        
        
        c.close();
        c = null;
        
        return rta;
    }
    
    public boolean borrar(int idPaper) throws Exception{
        boolean rta = false;
        Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.editar()");
        c.setAutoCommit(false);
        PreparedStatement ps=null;
        try {
        	//Borrar los co-autores que estaban antes
        	/*String sql = "DELETE FROM coautor WHERE id_paper = ?";
        	ps = c.prepareStatement(sql);
            ps.setInt(1, idPaper);
            ps.execute();
            ps.close();
            ps = null;
            */
            //Borrar los datos de asistente_paper.
            String sql = "DELETE FROM asistente_paper  WHERE id_paper =  ?  ";
        	ps = c.prepareStatement(sql);
        	ps.setInt(1, idPaper);
            ps.execute();
            ps.close();
            ps = null;
            
            //Borrar los datos del paper.
            sql = "DELETE FROM paper  WHERE id =  ?  ";
        	ps = c.prepareStatement(sql);
        	ps.setInt(1, idPaper);
            ps.execute();
            ps.close();
            ps = null;
            
            c.commit();
            rta = true;
		} catch (Exception e) {
			e.printStackTrace();
			rta=false;
			c.rollback();
		}
        
        c.setAutoCommit(true);
        c.close();
        c = null;
        
        return rta;
    }
    
    /**
     * Metod que permite obtener los papers de un asistente o todos para el chair del congreso
     * @param id_asistente: short id del asistente. 
     * @param id_tipo_Asistente: short id del tipo de asistente para identificar cuando es el chair.
     * @return List<Paper> Listado de papers enviados.
     * @throws Exception
     */
    public List<Paper> getPapers(int id_asistente, short id_tipo_Asistente) throws Exception{
    	List<Paper> papers = new ArrayList<Paper>();
    	EstadoDAO estadoDao = new EstadoDAO();
    	TopicoDAO topicoDao = new TopicoDAO();
    	TipoPresentacionDAO tipoDao = new TipoPresentacionDAO();
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.getTipoAsistente()");
		String sql = "SELECT * FROM paper "
				+ " WHERE 1 = 1 ";
		if(id_tipo_Asistente!=5) sql+= " AND id IN (SELECT id_paper FROM asistente_paper WHERE id_asistente = ? )";
		else sql += " AND id_estado IN (1,4) "; // Estado 1: Pendiente, 4: Correcciones.
		
		sql += " ORDER BY id ASC";
				
		PreparedStatement ps = con.prepareStatement(sql);
		
		if(id_tipo_Asistente!=5) ps.setInt(1, id_asistente);
		
		ResultSet rst = ps.executeQuery();
		
		while (rst.next()){
			
			Paper paper = new Paper();
			paper.setId(rst.getInt(1));
			paper.setResumenEs(rst.getString(2));
			paper.setTituloEs(rst.getString(3));
			paper.setPalabrasClaveEs(rst.getString(4));
			paper.setResumenEn(rst.getString(5));
			paper.setTituloEn(rst.getString(6));
			paper.setPalabrasClaveEn(rst.getString(7));
			paper.setArchivo(rst.getString(8));
			
			paper.setEstadoPaper(estadoDao.getEstadoPaper(rst.getShort(9)));
			paper.setTopico(topicoDao.getTopico(rst.getShort(10)));
			
			paper.setFechaEstado(rst.getDate(11));
			paper.setFechaRegistro(rst.getDate(12));
			
			paper.setTipoPresentacion(tipoDao.getTipo(rst.getShort(13)));
			paper.setObservaciones(rst.getString(14));
			paper.setPonente(rst.getString(15));
			
			papers.add(paper);
		}
    	
		rst.close();
		rst=null;
		
		ps.close();
        ps = null;
        
        con.close();
        con = null;
        
    	return papers;
    }
    
    /**
     * Metodo que permite obtener los papers de un asistente o todos para el chair del congreso
     * @param id_asistente: short id del asistente. 
     * @param id_tipo_Asistente: short id del tipo de asistente para identificar cuando es el chair.
     * @return List<Paper> Listado de papers enviados.
     * @throws Exception
     */
    public List<Paper> getPapers(int idPaper, int idEstado, int idTopico, int idTipo) throws Exception{
    	List<Paper> papers = new ArrayList<Paper>();
    	EstadoDAO estadoDao = new EstadoDAO();
    	TopicoDAO topicoDao = new TopicoDAO();
    	TipoPresentacionDAO tipoDao = new TipoPresentacionDAO();
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.getTipoAsistente()");
		String sql = "SELECT * FROM paper "
				+ " WHERE 1 = 1 ";
		
		if(idPaper>0) sql+= " AND id = " +  idPaper;
		if(idEstado>0) sql+= " AND id_estado = " +  idEstado;
		if(idTopico>0) sql+= " AND id_topico = " +  idTopico;
		if(idTipo>0) sql+= " AND id_tipo_presentacion = " +  idTipo;
		
		sql += " ORDER BY id ASC";
				
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rst = ps.executeQuery();
		
		while (rst.next()){
			
			Paper paper = new Paper();
			paper.setId(rst.getInt(1));
			paper.setResumenEs(rst.getString(2));
			paper.setTituloEs(rst.getString(3));
			paper.setPalabrasClaveEs(rst.getString(4));
			paper.setResumenEn(rst.getString(5));
			paper.setTituloEn(rst.getString(6));
			paper.setPalabrasClaveEn(rst.getString(7));
			paper.setArchivo(rst.getString(8));
			
			paper.setEstadoPaper(estadoDao.getEstadoPaper(rst.getShort(9)));
			paper.setTopico(topicoDao.getTopico(rst.getShort(10)));
			
			paper.setFechaEstado(rst.getDate(11));
			paper.setFechaRegistro(rst.getDate(12));
			
			paper.setTipoPresentacion(tipoDao.getTipo(rst.getShort(13)));
			paper.setObservaciones(rst.getString(14));
			paper.setPonente(rst.getString(15));
			
			papers.add(paper);
		}
    	
		rst.close();
		rst=null;
		
		ps.close();
        ps = null;
        
        con.close();
        con = null;
        
    	return papers;
    }
    
    public Paper getPaper(int id) throws Exception{
    	Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.getPaper()");
        String sql = "SELECT * FROM paper WHERE id = ? ";
        EstadoDAO estadoDao = new EstadoDAO();
        TopicoDAO topicoDao = new TopicoDAO();
        TipoPresentacionDAO tipoDao = new TipoPresentacionDAO();
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        
        Paper p = new Paper();
        
        if(rs.next()){
        	p = new Paper();
        	p.setId(id);
        	p.setResumenEs(rs.getString(2));
        	p.setTituloEs(rs.getString(3));
        	p.setPalabrasClaveEs(rs.getString(4));
        	p.setResumenEn(rs.getString(5));
        	p.setTituloEn(rs.getString(6));
        	p.setPalabrasClaveEn(rs.getString(7));
        	p.setArchivo(rs.getString(8));
        	p.setEstadoPaper(estadoDao.getEstadoPaper(rs.getInt(9)));
        	p.setTopico(topicoDao.getTopico(rs.getInt(10)));
        	p.setFechaRegistro(rs.getDate(11));
        	p.setFechaEstado(rs.getDate(12));
        	p.setTipoPresentacion(tipoDao.getTipo(rs.getInt(13)));
        	p.setObservaciones(rs.getString(14));
        	p.setPonente(rs.getString(15));
        	
        	// buscar los autores
        	/*sql = "SELECT * FROM asistente WHERE id IN "
        			+ "(SELECT id_asistente FROM asistente_paper "
        			+ " WHERE id_paper = ? )";*/
        	
        	sql = "SELECT a.* FROM asistente a, asistente_paper ap "
        			+ "WHERE a.id = ap.id_asistente "
        			+ "AND id_paper = ? "
        			+ "ORDER BY ap.orden, ap.id_asistente ";
        	
        	PreparedStatement ps2 = c.prepareStatement(sql);
        	ps2.setInt(1, id);
        	ResultSet rs2 = ps2.executeQuery();
        	
        	while (rs2.next()){
        		Asistente asistente = new Asistente();
    			
    			asistente.setId(rs2.getInt(1));
    			asistente.setTipoDocumento(rs2.getString(2));
    			asistente.setNumeroDocumento(rs2.getString(3));
    			asistente.setNombre(rs2.getString(4));
    			asistente.setApellido(rs2.getString(5));
    			asistente.setEmail(rs2.getString(6));
    			asistente.setPais(rs2.getString(7));
    			asistente.setCiudad(rs2.getString(8));
    			asistente.setInstitucion(rs2.getString(9));
    			asistente.setPassword(rs2.getString(10));
    			asistente.getTipoAsistente().setId(rs2.getShort(11));
    			asistente.getEstadoAsistente().setId(rs2.getShort(12));
    			asistente.setTelefono(rs2.getString(15));
    			asistente.setEmailsContacto(rs2.getString(16));
    			
    			p.getAutores().add(asistente);
        	}
        	
        	rs2.close();
        	rs2=null;
        	
        	ps2.close();
        	ps2=null;
        	
        	// buscar los co-autores
        	        	
        } else p=null; 
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return p;
    }
    
    public boolean revisarPaper(int idPaper, short tipoPresentacion, short estado, String observaciones) throws Exception{
    	boolean rta=false;
    	Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.getPaper()");
        String sql = "UPDATE paper set id_tipo_presentacion=?, id_estado=?, observaciones_estado=?, fecha_estado= current_date WHERE id=? ";
        PreparedStatement ps;
        
        if (observaciones!= null) observaciones= observaciones.trim(); 
        
        ps = c.prepareStatement(sql);
        ps.setShort(1, tipoPresentacion);
        ps.setShort(2, estado);
        ps.setString(3, observaciones);
        ps.setInt(4, idPaper);
        
        
        ps.execute();
        rta=true;
        
    	return rta;
    }
    
    public Asistente getPonente(int idPaper) throws Exception{
    	Asistente asistente = new Asistente();
    	Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.getPonente()");
        String sql = "SELECT a.* FROM asistente a, asistente_paper ap "
        		+ "	WHERE a.id = ap.id_asistente "
        		+ "	AND ap.id_paper = ? "
        		+ " AND ap.es_ponente IS TRUE ";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, idPaper);
        ResultSet rs2 = ps.executeQuery();
        
        if(rs2.next()){
			asistente.setId(rs2.getInt(1));
			asistente.setTipoDocumento(rs2.getString(2));
			asistente.setNumeroDocumento(rs2.getString(3));
			asistente.setNombre(rs2.getString(4));
			asistente.setApellido(rs2.getString(5));
			asistente.setEmail(rs2.getString(6));
			asistente.setPais(rs2.getString(7));
			asistente.setCiudad(rs2.getString(8));
			asistente.setInstitucion(rs2.getString(9));
			asistente.setPassword(rs2.getString(10));
			asistente.getTipoAsistente().setId(rs2.getShort(11));
			asistente.getEstadoAsistente().setId(rs2.getShort(12));
        } else asistente = null;
        
        rs2.close();
    	rs2=null;
    	
    	ps.close();
    	ps=null;
        
    	c.close();
        c = null;
    	return asistente;
    }
    
    public int numeroPonencias(String ponente) throws Exception{
    	int numero=-1;
    	Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.getPonente()");
        String sql = " SELECT count(*) FROM asistente_paper app, asistente a "
        		+ " WHERE app.id_asistente = a.id "
        		+ " AND concat(concat(nombre,  ' '), apellido) LIKE ? AND app.es_ponente IS TRUE "
        		+ " AND id_paper NOT IN "
        		+ "	(SELECT p.id FROM paper p, asistente_paper ap "
        		+ "  WHERE p.id_estado = 3 AND ap.id_asistente = a.id ) ";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setString(1, ponente);
        ResultSet rs2 = ps.executeQuery();
        
        if(rs2.next()){
			numero= rs2.getInt(1);
        } else numero=0;
        
        rs2.close();
    	rs2=null;
    	
    	ps.close();
    	ps=null;
    	
    	/*sql = " SELECT count(*) FROM coautor c "
        	+ " WHERE concat(concat(c.nombre,  ' '), c.apellido) LIKE ? AND c.es_ponente IS TRUE "
        	+ " AND c.id_paper NOT IN "
        	+ "	(SELECT p.id FROM paper p, coautor cc "
        	+ "  WHERE p.id_estado = 3 AND cc.id = c.id ) ";
        
    	ps = c.prepareStatement(sql);
        ps.setString(1, ponente);
        rs2 = ps.executeQuery();
        
        if(rs2.next()){
			numero+= rs2.getInt(1);
        } else numero+=0;
        
        rs2.close();
    	rs2=null;
    	
    	ps.close();
    	ps=null;
    	*/
    	c.close();
        c = null;
        
        return numero;
    }
    
    public int numeroPonencias(Asistente ponente) throws Exception{
    	int numero=-1;
    	Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.getPonente()");
        String sql = " SELECT count(*) FROM asistente_paper ap, paper p " + 
        		"where id_asistente = ? and es_ponente = true " + 
        		"and p.id = ap.id_paper " + 
        		"and p.id_estado != 3";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, ponente.getId());
        ResultSet rs2 = ps.executeQuery();
        
        if(rs2.next()){
			numero= rs2.getInt(1);
        } else numero=0;
        
        rs2.close();
    	rs2=null;
    	
    	ps.close();
    	ps=null;
    	
    	/*sql = " SELECT count(*) FROM coautor c "
        	+ " WHERE concat(concat(c.nombre,  ' '), c.apellido) LIKE ? AND c.es_ponente IS TRUE "
        	+ " AND c.id_paper NOT IN "
        	+ "	(SELECT p.id FROM paper p, coautor cc "
        	+ "  WHERE p.id_estado = 3 AND cc.id = c.id ) ";
        
    	ps = c.prepareStatement(sql);
        ps.setString(1, ponente);
        rs2 = ps.executeQuery();
        
        if(rs2.next()){
			numero+= rs2.getInt(1);
        } else numero+=0;
        
        rs2.close();
    	rs2=null;
    	
    	ps.close();
    	ps=null;
    	*/
    	c.close();
        c = null;
        
        return numero;
    }
    
    public int numeroPapers(int idAsistente) throws Exception{
    	int numero=-1;
    	Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.getPonente()");
        String sql = " SELECT count(*) FROM asistente_paper app "
        		+ " WHERE id_asistente = ? ";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, idAsistente);
        ResultSet rs2 = ps.executeQuery();
        
        if(rs2.next()){
			numero= rs2.getInt(1);
        } else numero=0;
        
        rs2.close();
    	rs2=null;
    	
    	ps.close();
    	ps=null;    	    	
        
        return numero;
    }
    
    public List<Paper> getPapersBook() throws Exception{
    	List<Paper> papers = new ArrayList<Paper>();
    	
    	TopicoDAO topicoDao = new TopicoDAO();    	
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("PaperDao.getPapers()");
		String sql = "SELECT DISTINCT p.id, p.titulo_en, p.titulo_es, p.resumen_en, p.resumen_es, t.id, t.nombre_es, t.nombre_en "
				+ "  FROM paper p, asistente_paper ap, asistente a, topico t     "
				+ "  WHERE p.id = ap.id_paper and ap.id_asistente = a.id and t.id = p.id_topico "
				+ "  AND p.id_estado = 5 "
				+ "  ORDER BY t.nombre_es, p.titulo_en ";
						
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rst = ps.executeQuery();
		
		while (rst.next()){
			
			Paper paper = new Paper();
			paper.setId(rst.getInt(1));
			paper.setResumenEs(rst.getString(5));
			paper.setTituloEs(rst.getString(3));			
			paper.setResumenEn(rst.getString(4));
			paper.setTituloEn(rst.getString(2));											
			paper.setTopico(topicoDao.getTopico(rst.getShort(6)));
						
			sql = "SELECT a.*, ap.es_ponente FROM asistente a, asistente_paper ap "
	        		+ "	WHERE a.id = ap.id_asistente "
	        		+ "	AND ap.id_paper = ? "
	        		+ " ORDER BY ap.orden, ap.id_asistente ";	        		
	        
	        PreparedStatement ps2 = con.prepareStatement(sql);
	        ps2.setInt(1, paper.getId());
	        ResultSet rs2 = ps2.executeQuery();
	        
	        while(rs2.next()){
	        	Asistente asistente = new Asistente();
				asistente.setId(rs2.getInt(1));
				asistente.setTipoDocumento(rs2.getString(2));
				asistente.setNumeroDocumento(rs2.getString(3));
				asistente.setNombre(rs2.getString(4));
				asistente.setApellido(rs2.getString(5));
				asistente.setEmail(rs2.getString(6));
				asistente.setPais(rs2.getString(7));
				asistente.setCiudad(rs2.getString(8));
				asistente.setInstitucion(rs2.getString(9));
				asistente.setPassword(rs2.getString(10));
				asistente.getTipoAsistente().setId(rs2.getShort(11));
				asistente.getEstadoAsistente().setId(rs2.getShort(12));
				
				paper.getAutores().add(asistente);								
	        }
	        
	        rs2.close();
	        rs2= null;
	        
	        ps2.close();
	        ps2=null;
	        
	        // Buscar los coautores
	        /*sql = "SELECT * FROM coautor ca, paper p "
	        		+ "	WHERE ca.id_paper = p.id "
	        		+ "	AND p.id = ? ";	        		
	        
	        ps2 = con.prepareStatement(sql);
	        ps2.setInt(1, paper.getId());
	        rs2 = ps2.executeQuery();			
			
			while (rs2.next()){
        		Coautor coautor = new Coautor();
    			
        		coautor.setId(rs2.getInt(1));
        		coautor.setTipoDocumento(rs2.getString(2));
        		coautor.setNumeroDocumento(rs2.getString(3));
        		coautor.setNombre(rs2.getString(4));
        		coautor.setApellido(rs2.getString(5));
    			coautor.setEmail(rs2.getString(6));
    			coautor.setPais(rs2.getString(7));
    			coautor.setCiudad(rs2.getString(8));
    			coautor.setInstitucion(rs2.getString(9));    			
    			coautor.setEsPonente(rs2.getBoolean(11));    			
    			
    			paper.getCoautores().add(coautor);
        	}
        	
        	rs2.close();
        	rs2=null;
        	
        	ps2.close();
        	ps2=null;*/
        	
        	papers.add(paper);
		}
    	
		rst.close();
		rst=null;
		
		ps.close();
        ps = null;
        
        con.close();
        con = null;
        
    	return papers;
    }
    
    /**
     * Metodo que permite obtener los papers de un asistente o todos para el chair del congreso
     * @param id_asistente: short id del asistente. 
     * @param id_tipo_Asistente: short id del tipo de asistente para identificar cuando es el chair.
     * @return List<Paper> Listado de papers enviados.
     * @throws Exception
     */
    public List<Paper> getPapersPresentar() throws Exception{
    	List<Paper> papers = new ArrayList<Paper>();
    	EstadoDAO estadoDao = new EstadoDAO();
    	TopicoDAO topicoDao = new TopicoDAO();
    	TipoPresentacionDAO tipoDao = new TipoPresentacionDAO();
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.getTipoAsistente()");
		String sql = "SELECT * FROM paper "
				+ " WHERE id_estado IN (2, 4) ";
		sql += " ORDER BY id ASC";
				
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rst = ps.executeQuery();
		
		while (rst.next()){
			
			Paper paper = new Paper();
			paper.setId(rst.getInt(1));
			paper.setResumenEs(rst.getString(2));
			paper.setTituloEs(rst.getString(3));
			paper.setPalabrasClaveEs(rst.getString(4));
			paper.setResumenEn(rst.getString(5));
			paper.setTituloEn(rst.getString(6));
			paper.setPalabrasClaveEn(rst.getString(7));
			paper.setArchivo(rst.getString(8));
			
			paper.setEstadoPaper(estadoDao.getEstadoPaper(rst.getShort(9)));
			paper.setTopico(topicoDao.getTopico(rst.getShort(10)));
			
			paper.setFechaEstado(rst.getDate(11));
			paper.setFechaRegistro(rst.getDate(12));
			
			paper.setTipoPresentacion(tipoDao.getTipo(rst.getShort(13)));
			paper.setObservaciones(rst.getString(14));
			paper.setPonente(rst.getString(15));
			
			papers.add(paper);
		}
    	
		rst.close();
		rst=null;
		
		ps.close();
        ps = null;
        
        con.close();
        con = null;
        
    	return papers;
    }
    
    public boolean cambiarEstadoPaper(int idPaper, short estado) throws Exception{
    	boolean rta=false;
    	Conexion con = new Conexion();
        Connection c = con.conectar("PaperDAO.cambiarEstadoPaper()");
        String sql = "UPDATE paper set id_estado=?, fecha_estado= current_date WHERE id=? ";
        PreparedStatement ps;
               
        ps = c.prepareStatement(sql);
        ps.setShort(1, estado);
        ps.setInt(2, idPaper);
        
        ps.execute();
        rta=true;
        
    	return rta;
    }
}
