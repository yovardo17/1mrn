package co.edu.ufps.imrmtp.capaNegocio.negocio;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dao.TopicoDAO;
import co.edu.ufps.imrmtp.capaDatos.dto.Topico;

public class TopicoNegocio implements Serializable{
	
	public List<Topico> cargarTopicos() throws SQLException{
        List<Topico> list = new ArrayList<Topico>();
        
        TopicoDAO tp = new TopicoDAO();
        
        list = tp.cargarTopicos();
        return list;
    }
}
