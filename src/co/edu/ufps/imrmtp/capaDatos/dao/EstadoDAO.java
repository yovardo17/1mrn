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
import co.edu.ufps.imrmtp.capaNegocio.utilidades.Conexion;

/**
 *
 * @author FH Vera-Rivera.
 */
public class EstadoDAO implements Serializable{
    
    public EstadoDAO(){}
    
    public List<EstadoPaper> cargarEstado() throws SQLException{
        List<EstadoPaper> listado = new ArrayList<EstadoPaper>();
        
        Conexion con = new Conexion();
        Connection c = con.conectar("EstadoDAO.cargarEstados()");
        String sql = "SELECT * FROM estado_paper";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        EstadoPaper ep = new EstadoPaper();
        
        while(rs.next()){
            ep = new EstadoPaper();
            ep.setId(rs.getShort(1));
            ep.setNombre(rs.getString(2));
            ep.setDescripcion(rs.getString(3));
            
            listado.add(ep);
        }
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return listado;
    }
    
    public EstadoPaper getEstadoPaper(int id) throws Exception{
    	Conexion con = new Conexion();
        Connection c = con.conectar("EstadoDAO.getEsatoPaper()");
        String sql = "SELECT * FROM estado_paper WHERE id = ?";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setShort(1, (short)id);
        ResultSet rs = ps.executeQuery();
        
        EstadoPaper ep = new EstadoPaper();
        
        if(rs.next()){
            ep = new EstadoPaper();
            ep.setId(rs.getShort(1));
            ep.setNombre(rs.getString(2));
            ep.setDescripcion(rs.getString(3));
        }
        
        rs.close();
        rs = null;
        
        ps.close();
        ps = null;
        
        c.close();
        c = null;
        
        return ep;
    }
}
