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
import co.edu.ufps.imrmtp.capaDatos.dto.Topico;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.Conexion;

/**
 *
 * @author FH Vera-Rivera
 */
public class TopicoDAO implements Serializable{

    public TopicoDAO() {
    }
   
    public List<Topico> cargarTopicos() throws SQLException{
        List<Topico> listado = new ArrayList<Topico>();
        
        Conexion con = new Conexion();
        Connection c = con.conectar("TopicoDAO.cargarTopicos()");
        String sql = "SELECT * FROM topico ORDER BY orden";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        Topico top = new Topico();
        
        while(rs.next()){
            top = new Topico();
            top.setId(rs.getShort(1));
            top.setNombreEs(rs.getString(2));
            top.setDescripcion(rs.getString(3));
            top.setNombreEn(rs.getString(4));
            
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
    
    public Topico getTopico(int id) throws Exception{
    	Conexion con = new Conexion();
        Connection c = con.conectar("TopicoDAO.getTopico()");
        String sql = "SELECT * FROM topico WHERE id = ?";
        
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        
        Topico tp = new Topico();
        
        if(rs.next()){
            tp = new Topico();
            tp.setId(rs.getShort(1));
            tp.setNombreEs(rs.getString(2));
            tp.setDescripcion(rs.getString(3));
            tp.setNombreEn(rs.getString(4));
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
