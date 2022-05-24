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
import java.util.ArrayList;
import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper;
import co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion;
import co.edu.ufps.imrmtp.capaDatos.dto.Topico;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.Conexion;

/**
 *
 * @author FH Vera-Rivera
 */
public class TipoPresentacionDAO implements Serializable{

    public TipoPresentacionDAO() {
    	super();
    }
   
    public List<TipoPresentacion> cargarTipos() throws Exception{
        List<TipoPresentacion> listado = new ArrayList<TipoPresentacion>();
        
        Conexion con = new Conexion();
        Connection c = con.conectar("TipoPresentacionDAO.cargarTipos()");
        String sql = "SELECT * FROM tipo_presentacion ";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        TipoPresentacion top = new TipoPresentacion();
        
        while(rs.next()){
            top = new TipoPresentacion();
            top.setId(rs.getShort(1));
            top.setNombre(rs.getString(2));
            top.setDescripcion(rs.getString(3));
            
            listado.add(top);
        }
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return listado;
    }
    
    public TipoPresentacion getTipo(int id) throws Exception{
    	Conexion con = new Conexion();
        Connection c = con.conectar("TipoPresentacion.getTipo()");
        String sql = "SELECT * FROM tipo_presentacion WHERE id = ?";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        
        TipoPresentacion tp = new TipoPresentacion();
        
        if(rs.next()){
            tp = new TipoPresentacion();
            tp.setId(rs.getShort(1));
            tp.setNombre(rs.getString(2));
            tp.setDescripcion(rs.getString(3));
        }
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return tp;
    }
}
