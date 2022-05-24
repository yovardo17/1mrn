package co.edu.ufps.imrmtp.capaNegocio.facade;

import java.sql.SQLException;
import java.util.List;

import co.edu.ufps.imrmtp.capaDatos.dto.Topico;
import co.edu.ufps.imrmtp.capaNegocio.negocio.TopicoNegocio;

public class InicioFacade {
	
	public List<Topico> cargar() throws SQLException{
        return new TopicoNegocio().cargarTopicos();
    }

}
