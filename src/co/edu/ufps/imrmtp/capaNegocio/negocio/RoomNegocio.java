package co.edu.ufps.imrmtp.capaNegocio.negocio;

import java.io.Serializable;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dao.RoomDAO;
import co.edu.ufps.imrmtp.capaDatos.dao.TopicoDAO;
import co.edu.ufps.imrmtp.capaDatos.dto.Paper;
import co.edu.ufps.imrmtp.capaDatos.dto.Room;
import co.edu.ufps.imrmtp.capaDatos.dto.SesionPonencia;
import co.edu.ufps.imrmtp.capaDatos.dto.Topico;

public class RoomNegocio implements Serializable{
	
	public List<Room> cargarSalas() throws SQLException{
        List<Room> list = new ArrayList<Room>();
        
        RoomDAO roomDao = new RoomDAO();
        
        list = roomDao.cargarSalas();
        return list;
    }
	
	public Room getRoom(int id) throws Exception{
		RoomDAO roomDao = new RoomDAO();
		Room r = roomDao.getRoom(id);
    	return r;
    }
	
	public List<SesionPonencia> getSesiones(Date dia, Room room) throws Exception{
		RoomDAO roomDao = new RoomDAO();
		return roomDao.getSesiones(dia, room);
	}
	
	public SesionPonencia getSesionPonencia(int idPaper) throws Exception{
		RoomDAO roomDao = new RoomDAO();
		SesionPonencia sesion = roomDao.getSesionPonencia(idPaper);
    	return sesion;
    }
}
