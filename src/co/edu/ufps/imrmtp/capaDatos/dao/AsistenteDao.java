package co.edu.ufps.imrmtp.capaDatos.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dto.Asistente;
import co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.Conexion;
import co.edu.ufps.imrmtp.capaNegocio.utilidades.EmailService;

public class AsistenteDao implements Serializable {
	
	public boolean registrarAsistente(Asistente asistente) throws Exception{
		boolean rta=false;
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.registrarAsistente()");
		String sql = "INSERT INTO asistente (tipo_documento, numero_documento, "
				+ "nombre, apellido, email, pais, ciudad, institucion, password,"
				+ "id_tipo_asistente, id_estado, direccion ) "
				+ "VALUES (?,?,?,?,?,?,?,?,"
                        //Este es el campo que corresponde al password que ahora estar� encriptada
                        + "MD5(?)"
                        + ",?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);  
		ps.setString(1, asistente.getTipoDocumento());
		ps.setString(2, asistente.getNumeroDocumento());
		ps.setString(3, asistente.getNombre());
		ps.setString(4, asistente.getApellido());
		ps.setString(5, asistente.getEmail());
		ps.setString(6, asistente.getPais());
		ps.setString(7, asistente.getCiudad());
		ps.setString(8, asistente.getInstitucion());
		ps.setString(9, asistente.getPassword());
		ps.setInt(10, asistente.getTipoAsistente().getId());
		ps.setInt(11, asistente.getEstadoAsistente().getId());
		ps.setString(12, asistente.getDireccion());
		
		ps.execute();
		rta=true;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		return rta;
	}
	
	public boolean editarAsistente(Asistente asistente) throws Exception{
		boolean rta=false;
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.editarAsistente()");
		String sql = "UPDATE asistente SET tipo_documento=?, numero_documento=?, "
				+ "nombre=?, apellido=?, email=?, pais=?, ciudad=?, institucion=?, "
				+ "telefono_contacto=?, emails_contacto=?, direccion = ?  ";
		
		if(!asistente.getPassword().equals("")) sql += ", password=MD5(?) ";
				
		sql += " WHERE id=? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, asistente.getTipoDocumento());
		ps.setString(2, asistente.getNumeroDocumento());
		ps.setString(3, asistente.getNombre());
		ps.setString(4, asistente.getApellido());
		ps.setString(5, asistente.getEmail());
		ps.setString(6, asistente.getPais());
		ps.setString(7, asistente.getCiudad());
		ps.setString(8, asistente.getInstitucion());
		ps.setString(9, asistente.getTelefono());
		ps.setString(10, asistente.getEmailsContacto());
		ps.setString(11, asistente.getDireccion());
		if(!asistente.getPassword().equals("")) {
			ps.setString(12, asistente.getPassword());
			ps.setInt(13, asistente.getId());
		} else ps.setInt(12, asistente.getId());
		
		ps.execute();
		rta=true;
		
		ps.close();
		ps=null;
		
		con.close();  
		con=null;
		return rta;
	}
	
	public String guardarTipoComida(String tipoComida, int curso, int idAsistente) throws Exception{
		String msg="Error";
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.guardarTipoComida()");
		
		String sql = "UPDATE asistente SET tipo_comida=?, id_curso=? WHERE id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, tipoComida);
		ps.setInt(2, curso);
		ps.setInt(3, idAsistente);
		ps.execute();
		msg="";
		
		return msg;
	}
	
	public String validarAsistente(Asistente asistente, boolean esNuevo) throws Exception {
		String msg="";
		
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.validarAsistente()");
		String sql = "SELECT * FROM asistente "
				+ " WHERE lower(email) = ? ";
		
		if (!esNuevo) sql += " AND id <> ? "; 
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, asistente.getEmail().toLowerCase());
		if (!esNuevo) ps.setInt(2, asistente.getId());
		
		ResultSet rst = ps.executeQuery();
		
		if(rst.next()){
			msg= "This email: " + asistente.getEmail() + " has already been registered.<br>";
		}
		
		rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		sql = "SELECT * FROM asistente "
		      + " WHERE tipo_documento = ? and numero_documento = ? ";
		
		if (!esNuevo){
			sql += " AND id <> ? "; 
		}
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1, asistente.getTipoDocumento());
		ps.setString(2, asistente.getNumeroDocumento());
		if (!esNuevo) ps.setInt(3, asistente.getId());
		
		rst = ps.executeQuery();
		
		if(rst.next()){
			msg+= "This ID Number: " + asistente.getTipoDocumento() + " - " + asistente.getNumeroDocumento() + " has already been registered.";
		}
		
		rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		
		return msg;
	}
	
	public List<TipoAsistente> getTipoAsistente() throws Exception {
		List<TipoAsistente> tipos = new ArrayList<TipoAsistente>();
		
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.getTipoAsistente()");
		String sql = "SELECT * FROM tipo_asistente "
				+ " WHERE id <> 5 ORDER BY nombre";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rst = ps.executeQuery();
		
		TipoAsistente tipo = new TipoAsistente();
		
		while(rst.next()){
			tipo = new TipoAsistente();
			tipo.setId(rst.getShort(1));
			tipo.setNombre(rst.getString(2));
			tipo.setDescripcion(rst.getString(3));
			
			tipos.add(tipo);
		}
		
		rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		
		return tipos;
	}
	
	public Asistente verificarUsuario(String email, String password) throws Exception{
		Asistente asistente = new Asistente();
		
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.buscarAsistente()");
		String sql = "SELECT * FROM asistente WHERE email=? and password= "
                //validando la clave teniendo en cuenta está encriptada
                + "MD5(?) ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rst = ps.executeQuery();
		
		if(rst.next()){
			asistente = new Asistente();
			
			asistente.setId(rst.getInt(1));
			asistente.setTipoDocumento(rst.getString(2));
			asistente.setNumeroDocumento(rst.getString(3));
			asistente.setNombre(rst.getString(4));
			asistente.setApellido(rst.getString(5));
			asistente.setEmail(rst.getString(6));
			asistente.setPais(rst.getString(7));
			asistente.setCiudad(rst.getString(8));
			asistente.setInstitucion(rst.getString(9));
			asistente.setPassword(rst.getString(10));
			asistente.getTipoAsistente().setId(rst.getShort(11));
			asistente.getEstadoAsistente().setId(rst.getShort(12));
			asistente.setTipoComida(rst.getString(14));
			asistente.setTelefono(rst.getString(15));
			asistente.setEmailsContacto(rst.getString(16));
			asistente.setDireccion(rst.getString(17));
			
			String numero = rst.getString(13);
			short i=0;
			if (numero==null) asistente.setIdTipoCurso(i);
			else asistente.setIdTipoCurso(rst.getShort(13));
			
			
		} else asistente=null;
		
		rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		
		return asistente;
	}

        //para recuperar la clave
    @SuppressWarnings("static-access")
	public boolean verificarUsuario(String email) throws Exception{
		boolean asistente = false;
		boolean rta=false;
		
    	String emailEnviar = "";
    	String asunto="[5+1 Imrmpt] Password Recovery";
    	String msg="";
    	String clave;
    	email= email.trim();
    	    	
    	Date fechaActual = Calendar.getInstance().getTime();
    	EmailService servicioEmail = new EmailService();
    	DateFormat formato = new SimpleDateFormat("dd/MMM/yyyy");
		  
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.buscarAsistente()");
		String sql = "SELECT * FROM asistente WHERE email=? ";
                
        PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rst = ps.executeQuery();
		
                /*Si entra en este if, indica que el correo existe pues esta
                asociado a un usuario*/
		if(rst.next()){
                    
	        /*por defecto cambio la contraseña existente a xxxx, la cual se
	        enviaria al correo del usuario, no se puede enviar la actual pues
	        se encuentra encriptada con md5, por eso es necesario cambiarla	        
	        */
			int n = (int)(Math.random()*10000);
			clave = "6imrmpt-" + n;
	        ps = con.prepareStatement("update asistente set password=md5(?) where email=? ");
	        ps.setString(1, clave);
	        ps.setString(2, email);
	        ps.execute();  
	        
	        msg += "Dear Author. <br><br>";
	        msg += "Your new password is: " + clave +"\n\n Please you must change it when you login. <br><br>";	        
	        msg += "Hope to see you at the 5+1 IMRMPT meeting. \n\n <br><br> ";	        
	        msg += "Best regards, <br><br>\n\n";	        
	        msg += "International Meeting for Researchers in Materials and Plasma Technology (5+1 IMRMPT)<br> \n\n";
	        msg += "Foundation of Researchers in Science and Technology of Materials (FORISTOM) <br> \n\n";
	        msg += "https://foristom.org/6imrmpt/ <br>";
	          
	        servicioEmail.generateAndSendEmail(asunto, email, null , msg);     
	        asistente=true;
	    }else{  
	        asistente=false;
	    }
		
		rst.close();
		rst=null;
		
		ps.close();  
		ps=null;  
		
		con.close();
		con=null;  
		
		return asistente;
	}
    
    /**
     * Metodo que retorna el número de inscritos en un curos
     * @param idCurso - Id del curso a consultar
     * @return int - numero de inscritos.
     * @throws Exception
     */
    public int inscritosCurso(int idCurso) throws Exception {
    	int inscritos=0;
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.buscarAsistente()");
		String sql = "SELECT count(*) FROM asistente WHERE id_curso = ? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, idCurso);
		ResultSet rst = ps.executeQuery();
		
		if (rst.next()){
			inscritos = rst.getInt(1);
		} else inscritos=0;
    	
    	rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		
		return inscritos;
    }
    
    /**
     * Metodo que obtiene el listado de inscritos a un curso.
     * @param idCurso
     * @return Listado de inscritos
     * @throws Exception
     */
    public List<Asistente> listadoInscritosCurso(int idCurso) throws Exception {
    	ArrayList<Asistente> listado = new ArrayList<Asistente>();
    	Asistente asistente = new Asistente();
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.listadoInscritosCurso()");
		String sql = "SELECT * FROM asistente WHERE id_curso = ? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, idCurso);
		ResultSet rst = ps.executeQuery();
		
		while (rst.next()){
			asistente = new Asistente();
			
			asistente.setId(rst.getInt(1));
			asistente.setTipoDocumento(rst.getString(2));
			asistente.setNumeroDocumento(rst.getString(3));
			asistente.setNombre(rst.getString(4));
			asistente.setApellido(rst.getString(5));
			asistente.setEmail(rst.getString(6));
			asistente.setPais(rst.getString(7));
			asistente.setCiudad(rst.getString(8));
			asistente.setInstitucion(rst.getString(9));
			asistente.setPassword(rst.getString(10));
			asistente.getTipoAsistente().setId(rst.getShort(11));
			asistente.getEstadoAsistente().setId(rst.getShort(12));
			asistente.setTipoComida(rst.getString(14));
			asistente.setTelefono(rst.getString(15));
			asistente.setEmailsContacto(rst.getString(16));
			asistente.setDireccion(rst.getString(17));
			
			String numero = rst.getString(13);
			short i=0;
			if (numero==null) asistente.setIdTipoCurso(i);
			else asistente.setIdTipoCurso(rst.getShort(13));
			
			listado.add(asistente);
		} 
    	
    	rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
    	
    	return listado;
    }
    
    public Asistente getAsistente(String tipoDoc, String numDoc) throws Exception {
    	Asistente asistente = new Asistente();
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.listadoInscritosCurso()");
		String sql = "SELECT * FROM asistente WHERE tipo_documento = ? and numero_documento = ? and id_estado=3";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, tipoDoc);
		ps.setString(2, numDoc);
		ResultSet rst = ps.executeQuery();
		
		if (rst.next()){
			asistente = new Asistente();
			
			asistente.setId(rst.getInt(1));
			asistente.setTipoDocumento(rst.getString(2));
			asistente.setNumeroDocumento(rst.getString(3));
			asistente.setNombre(rst.getString(4));
			asistente.setApellido(rst.getString(5));
			asistente.setEmail(rst.getString(6));
			asistente.setPais(rst.getString(7));
			asistente.setCiudad(rst.getString(8));
			asistente.setInstitucion(rst.getString(9));
			asistente.setPassword(rst.getString(10));
			asistente.getTipoAsistente().setId(rst.getShort(11));
			asistente.getEstadoAsistente().setId(rst.getShort(12));
			asistente.setTipoComida(rst.getString(14));
			asistente.setTelefono(rst.getString(15));
			asistente.setEmailsContacto(rst.getString(16));
			asistente.setDireccion(rst.getString(17));
			
			String numero = rst.getString(13);
			short i=0;
			if (numero==null) asistente.setIdTipoCurso(i);
			else asistente.setIdTipoCurso(rst.getShort(13));
		} else asistente= null;
    	
    	rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
    	
    	return asistente;
    }
    
    public int getCursoAsistido(int idAsistente) throws Exception{
    	int idCurso=-1;
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.listadoInscritosCurso()");
		String sql = "SELECT id_curso FROM asistente WHERE id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,  idAsistente);
		ResultSet rst = ps.executeQuery();
		
		if (rst.next()){
			idCurso= rst.getInt(1);
		} else idCurso=-1;
    	
    	rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
    	return idCurso;
    }
    
    public List<Asistente> listadoPendientes() throws Exception {
    	ArrayList<Asistente> listado = new ArrayList<Asistente>();
    	Asistente asistente = new Asistente();
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.listadoPendientes()");
		String sql = "SELECT * FROM asistente WHERE id_estado = 1 ";
		
		PreparedStatement ps = con.prepareStatement(sql);		
		ResultSet rst = ps.executeQuery();
		
		while (rst.next()){
			asistente = new Asistente();
			
			asistente.setId(rst.getInt(1));
			asistente.setTipoDocumento(rst.getString(2));
			asistente.setNumeroDocumento(rst.getString(3));
			asistente.setNombre(rst.getString(4));
			asistente.setApellido(rst.getString(5));
			asistente.setEmail(rst.getString(6));
			asistente.setPais(rst.getString(7));
			asistente.setCiudad(rst.getString(8));
			asistente.setInstitucion(rst.getString(9));
			asistente.setPassword(rst.getString(10));
			asistente.setTipoAsistente(this.getTipoAsistente(rst.getShort(11)));
			asistente.getEstadoAsistente().setId(rst.getShort(12));
			asistente.setTipoComida(rst.getString(14));
			asistente.setTelefono(rst.getString(15));
			asistente.setEmailsContacto(rst.getString(16));
			asistente.setDireccion(rst.getString(17));
			
			String numero = rst.getString(13);
			short i=0;
			if (numero==null) asistente.setIdTipoCurso(i);
			else asistente.setIdTipoCurso(rst.getShort(13));
			
			listado.add(asistente);
		} 
    	
    	rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
    	
    	return listado;
    }
    
    public TipoAsistente getTipoAsistente(int id) throws Exception {
		TipoAsistente tipo = new TipoAsistente();
		
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.getTipoAsistente()");
		String sql = "SELECT * FROM tipo_asistente "
				+ " WHERE id = ? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rst = ps.executeQuery();			
		
		if(rst.next()){
			tipo = new TipoAsistente();
			tipo.setId(rst.getShort(1));
			tipo.setNombre(rst.getString(2));
			tipo.setDescripcion(rst.getString(3));
		}
		
		rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		
		return tipo;
	}
    
    public boolean cambiarEstadoAsistente(int idAsistente, int estado) throws Exception{
		boolean rta= false;
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.cambiarEstadoAsistente()");
		
		String sql = "UPDATE asistente SET id_estado=? WHERE id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, estado);
		ps.setInt(2, idAsistente);
		ps.execute();
		rta=true;
		
		return rta;
	}
    
    public List<Asistente> getAsistentes() throws Exception {
    	ArrayList<Asistente> listado = new ArrayList<Asistente>();
    	Asistente asistente = new Asistente();
    	
    	Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.getAsistentes()");
		String sql = "SELECT * FROM asistente ORDER BY apellido, nombre ";
		
		PreparedStatement ps = con.prepareStatement(sql);		
		ResultSet rst = ps.executeQuery();
		
		while (rst.next()){
			asistente = new Asistente();
			
			asistente.setId(rst.getInt(1));
			asistente.setTipoDocumento(rst.getString(2));
			asistente.setNumeroDocumento(rst.getString(3));
			asistente.setNombre(rst.getString(4));
			asistente.setApellido(rst.getString(5));
			asistente.setEmail(rst.getString(6));
			asistente.setPais(rst.getString(7));
			asistente.setCiudad(rst.getString(8));
			asistente.setInstitucion(rst.getString(9));
			asistente.setPassword(rst.getString(10));
			asistente.setTipoAsistente(this.getTipoAsistente(rst.getShort(11)));
			asistente.getEstadoAsistente().setId(rst.getShort(12));
			asistente.setTipoComida(rst.getString(14));
			asistente.setTelefono(rst.getString(15));
			asistente.setEmailsContacto(rst.getString(16));
			asistente.setDireccion(rst.getString(17));
			
			String numero = rst.getString(13);
			short i=0;
			if (numero==null) asistente.setIdTipoCurso(i);
			else asistente.setIdTipoCurso(rst.getShort(13));
			
			listado.add(asistente);
		} 
    	
    	rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
    	
    	return listado;
    }
    
    public Asistente getAsistente(int id) throws Exception{
		Asistente asistente = new Asistente();
		
		Conexion conexion = new Conexion();
		Connection con = conexion.conectar("AsistenteDao.getAsistente()");
		String sql = "SELECT * FROM asistente WHERE id=?  ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rst = ps.executeQuery();
		
		if(rst.next()){
			asistente = new Asistente();
			
			asistente.setId(rst.getInt(1));
			asistente.setTipoDocumento(rst.getString(2));
			asistente.setNumeroDocumento(rst.getString(3));
			asistente.setNombre(rst.getString(4));
			asistente.setApellido(rst.getString(5));
			asistente.setEmail(rst.getString(6));
			asistente.setPais(rst.getString(7));
			asistente.setCiudad(rst.getString(8));
			asistente.setInstitucion(rst.getString(9));
			asistente.setPassword(rst.getString(10));
			asistente.getTipoAsistente().setId(rst.getShort(11));
			asistente.getEstadoAsistente().setId(rst.getShort(12));
			asistente.setTipoComida(rst.getString(14));
			asistente.setTelefono(rst.getString(15));
			asistente.setEmailsContacto(rst.getString(16));
			asistente.setDireccion(rst.getString(17));
			
			String numero = rst.getString(13);
			short i=0;
			if (numero==null) asistente.setIdTipoCurso(i);
			else asistente.setIdTipoCurso(rst.getShort(13));
			
			
		} else asistente=null;
		
		rst.close();
		rst=null;
		
		ps.close();
		ps=null;
		
		con.close();
		con=null;
		
		return asistente;
	}
}
