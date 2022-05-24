package co.edu.ufps.imrmtp.capaNegocio.facade;

import java.sql.Date;
import java.util.List;
import co.edu.ufps.imrmtp.capaDatos.dto.Room;
import co.edu.ufps.imrmtp.capaDatos.dto.SesionPonencia;
import co.edu.ufps.imrmtp.capaNegocio.negocio.RoomNegocio;

/**
*
* @author FH Vera-Rivera
*/
public class RoomFacade {
	RoomNegocio roomNegocio;			
	
	public RoomFacade() {
		super();
		roomNegocio = new RoomNegocio();
	}

	public List<Room> cargarSalas() throws Exception {
        return roomNegocio.cargarSalas();
    }
	
	public Room getRoom(int id) throws Exception {
		return roomNegocio.getRoom(id);
	}
	
	public List<SesionPonencia> getSesiones(Date dia, Room room) throws Exception {
		return roomNegocio.getSesiones(dia, room);
	}
	
	public SesionPonencia getSesionPonencia(int idPaper) throws Exception {
		return roomNegocio.getSesionPonencia(idPaper);
	}

}
