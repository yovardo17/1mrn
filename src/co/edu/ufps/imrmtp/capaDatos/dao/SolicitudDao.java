package co.edu.ufps.imrmtp.capaDatos.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;

import co.edu.ufps.imrmtp.capaDatos.dto.Solicitud;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.Conexion;
import java.sql.ResultSet;

public class SolicitudDao implements Serializable {
	
	public boolean registrarSolicitud(Solicitud solicitud) throws Exception{
		boolean rta=false;
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("solicitudDao.registrarsolicitud()");
		String sql = "INSERT INTO solicitud ("
                + "ubico, fecha, apellidos, nombres, motivo, cantidad, soporte ) "
		+ "VALUES (?,?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, solicitud.getUbico());
		ps.setString(2, solicitud.getFecha());
		ps.setString(3, solicitud.getApellidos());
		ps.setString(4, solicitud.getNombres());
		ps.setString(5, solicitud.getMotivo());
		ps.setInt(6, solicitud.getCantidad());
		ps.setString(7, solicitud.getSoporte());
		
		ps.execute();
		rta=true;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		return rta;
	}
	
	public boolean editarSolicitud(Solicitud solicitud) throws Exception{
		boolean rta=false;
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("solicitudDao.editarsolicitud()");
		String sql = "UPDATE solicitud SET ubico=?, fecha=?, apellidos=?, "
                        + "nombres=?, motivo=?, cantidad=?, soporte=? ";
		
		sql += " WHERE apellidos=? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, solicitud.getUbico());
		ps.setString(2, solicitud.getFecha());
		ps.setString(3, solicitud.getApellidos());
		ps.setString(4, solicitud.getNombres());
		ps.setString(5, solicitud.getMotivo());
		ps.setInt(6, solicitud.getCantidad());
		ps.setString(7, solicitud.getSoporte());
		ps.setString(8, solicitud.getApellidos());
	
                ps.execute();
		rta=true;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		return rta;
	}

    public String validarSolicitud(Solicitud solicitud, boolean b) throws Exception {
        
        String msg="";
        Conexion conexion = new Conexion();
        Connection con = conexion.conectar("SolicitudDao.validarSolicitud()");
        
        String sql = "SELECT * FROM solicitud "
		   + " WHERE apellidos = ? and nombres= ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,solicitud.getApellidos());
        ps.setString(2,solicitud.getNombres());
        
        ResultSet rst = ps.executeQuery();
		
	if(rst.next()){
	msg= "This User " + solicitud.getApellidos()+" "+solicitud.getNombres() +
             " has already been registered.<br>";
        }
        rst.close();
        rst=null;
        ps.close();
        ps=null;
        return msg;
    }

}