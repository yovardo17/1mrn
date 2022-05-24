/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.edu.ufps.imrmtp.capaDatos.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper;
import co.edu.ufps.imrmtp.capaDatos.dto.Paper;
import co.edu.ufps.imrmtp.capaDatos.dto.Room;
import co.edu.ufps.imrmtp.capaDatos.dto.SesionPonencia;
import co.edu.ufps.imrmtp.capaDatos.dto.Topico;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.Conexion;

/**
 *
 * @author FH Vera-Rivera
 */
public class RoomDAO implements Serializable{

    public RoomDAO() {
    }
   
    public List<Room> cargarSalas() throws SQLException{
        List<Room> listado = new ArrayList<Room>();
        
        Conexion con = new Conexion();
        Connection c = con.conectar("RoomDAO.cargarSalas()");
        String sql = "SELECT * FROM room WHERE estado is True ORDER BY orden ";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        Room room = new Room();
        
        while(rs.next()){
            room = new Room();
            room.setId(rs.getShort(1));
            room.setLink(rs.getString(2));
            room.setPassword(rs.getString(3));
            room.setMeetingId(rs.getString(4));
            room.setHostName(rs.getString(5));     
            room.setEstado(rs.getBoolean(6));
            room.setMostrarLink(rs.getBoolean(7));
            room.setChair(rs.getString(8));
            room.setLinkYoutube(rs.getString(9));
            room.setLinkFacebook(rs.getString(10));
            room.setOrden(rs.getShort(11));
            room.setImagen(rs.getString(12));
            
            listado.add(room);
        }
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return listado;
    }
    
    public Room getRoom(int id) throws Exception{
    	Conexion con = new Conexion();
        Connection c = con.conectar("RoomDAO.getRoom()");
        String sql = "SELECT * FROM room WHERE id = ?";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        
        Room room = new Room();
        
        if(rs.next()){
        	room = new Room();
            room.setId(rs.getShort(1));
            room.setLink(rs.getString(2));
            room.setPassword(rs.getString(3));
            room.setMeetingId(rs.getString(4));
            room.setHostName(rs.getString(5));     
            room.setEstado(rs.getBoolean(6));  
            room.setMostrarLink(rs.getBoolean(7));
            room.setChair(rs.getString(8));
            room.setLinkYoutube(rs.getString(9));
            room.setLinkFacebook(rs.getString(10));
            room.setOrden(rs.getShort(11));
            room.setImagen(rs.getString(12));
        }
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return room;
    }
    
    public List<SesionPonencia> getSesiones(Date dia, Room room) throws Exception{
    	List<SesionPonencia> sesiones = new ArrayList<SesionPonencia>();
    	PaperDAO paperDao = new PaperDAO();
    	Conexion con = new Conexion();
        Connection c = con.conectar("RoomDAO.getRoom()");
        String sql = "SELECT * FROM sesion_ponencia "
        		   + "WHERE id_room = ? "
        		   + "AND fecha = ? "
        		   + "ORDER BY hora_inicio ";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, room.getId());
        ps.setDate(2, dia);
        ResultSet rs = ps.executeQuery();
                        
        while(rs.next()){
        	SesionPonencia sesion = new SesionPonencia();
        	
        	sesion.setId(rs.getInt(1));
        	sesion.setRoom(room);
        	int id = rs.getInt(3);
        	Paper p = new Paper();
        	p = paperDao.getPaper(id);
        	sesion.setPaper(p);
        	
        	sesion.setFecha(rs.getDate(4));
        	sesion.setHoraInicio(rs.getTime(5));
        	sesion.setHoraFin(rs.getTime(6));
        	sesion.setUrl(rs.getString(7));
        	sesion.setDuracion(rs.getInt(8));
        	sesion.setTipoSesion(rs.getString(9));
        	sesion.setObservaciones(rs.getString(10));
        	
        	sesiones.add(sesion);
        }
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
    	return sesiones;
    }
    
    public SesionPonencia getSesionPonencia(int idPaper) throws Exception{
    	Conexion con = new Conexion();
        Connection c = con.conectar("RoomDAO.getRoom()");
        String sql = "SELECT * FROM sesion_ponencia WHERE id_paper = ?";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, idPaper);
        ResultSet rs = ps.executeQuery();
        PaperDAO paperDao = new PaperDAO();
        
        SesionPonencia sesion = new SesionPonencia();
        if(rs.next()){
        	sesion.setId(rs.getInt(1));
        	Room room = this.getRoom(rs.getInt(2));
        	sesion.setRoom(room);
        	int id = rs.getInt(3);
        	Paper p = new Paper();
        	p = paperDao.getPaper(id);
        	sesion.setPaper(p);
        	
        	sesion.setFecha(rs.getDate(4));
        	sesion.setHoraInicio(rs.getTime(5));
        	sesion.setHoraFin(rs.getTime(6));
        	sesion.setUrl(rs.getString(7));
        	sesion.setDuracion(rs.getInt(8));
        	sesion.setTipoSesion(rs.getString(9));
        	sesion.setObservaciones(rs.getString(10));
        } else sesion = null;
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return sesion;
    }
}
