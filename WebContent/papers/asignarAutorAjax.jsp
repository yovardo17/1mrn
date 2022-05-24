<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Coautor"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>
   <jsp:useBean id="paper" class="co.edu.ufps.imrmtp.capaDatos.dto.Paper" scope="session"></jsp:useBean>
   <jsp:useBean id="asistenteFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>
<%
	Asistente asistenteSes = new Asistente();		
	asistenteSes = (Asistente)session.getAttribute("asistente");
	String msg="";
	boolean error=false;
	
	if (asistenteSes ==null) throw new Exception("No Session");
	
	Asistente asistente = new Asistente();
	
	if (paper.getAutores().size()>0) asistente = paper.getAutores().get(0);
	else asistente = asistenteSes;
	
	String numero = request.getParameter("id");
	if (numero==null) numero="-1";
	
	numero= numero.trim();
	int id=0;
	try {
		id = Integer.parseInt(numero);
	} catch (NumberFormatException e){
		id=-1;
	}
	
	asistente = asistenteFacade.getAsistente(id);
	
	if (asistente!=null) {
		msg= "The the author is already registered in the system, please review the data and click on add button. ";
	}
	else {
		msg = "The author is not registered in the system, please insert the data and click on add button. ";
		error = true;
	}
	
%>	


<% 
	if(error){
%>
	<div class="alert alert-danger" role="alert">
		<%= msg %>
	</div>
	<br>
	<div class="form-group">
	    <label for="nombre">Name: *</label>
	    <input type="text" id="nombre_coautor" name="nombre_coautor" class="form-control" placeholder="Name" />
	 </div>
	 <div class="form-group">
	    <label for="apellido">Last Name: *</label>
	    <input type="text" id="apellido_coautor" name="apellido_coautor" class="form-control" placeholder="Last Name" />
	 </div>						
	 <div class="form-group">
	   	<label for="email">Email: *</label>
	    <input type="email" class="form-control"  id="email" name="email" placeholder="Email">
	 </div>					   
	  <div class="form-group">
	    <label for="institucion">Filial, Institution or Company: *</label>
	    <input type="text" id="institucion_coautor" name="institucion_coautor" placeholder="Institution or Company" class="form-control" />
	  </div>
	  <div class="form-group">
	    <label for="ciudad_coautor">City:</label>
	    <input type="text" id="ciudad_coautor" name="ciudad_coautor" placeholder="City" class="form-control" />
	  </div>
	  <div class="form-group">
	    <label for="pais_coautor">Country: *</label>
	    <input type="text" id="pais_coautor" name="pais_coautor" placeholder="Country" class="form-control" />
	  </div>
<%
	} else {
%>
	<div class="alert alert-info" role="alert">
		<%= msg %>
	</div>
	<br>
	<div class="form-group">
	    <label for="nombre">Name: *</label>
	    <input type="text" id="nombre_coautor" name="nombre_coautor" class="form-control" placeholder="Name" value="<%= asistente.getNombre() %>"/>
	 </div>
	 <div class="form-group">
	    <label for="apellido">Last Name: *</label>
	    <input type="text" id="apellido_coautor" name="apellido_coautor" class="form-control" placeholder="Last Name" value="<%= asistente.getApellido() %>"/>
	 </div>						
	 <div class="form-group">
	   	<label for="email">Email: *</label>
	    <input type="email" class="form-control"  id="email" name="email" placeholder="Email" value="<%= asistente.getEmail() %>">
	 </div>					   
	  <div class="form-group">
	    <label for="institucion">Filial, Institution or Company: *</label>
	    <input type="text" id="institucion_coautor" name="institucion_coautor" placeholder="Institution or Company" class="form-control" value="<%= asistente.getInstitucion() %>"/>
	  </div>
	  <div class="form-group">
	    <label for="ciudad_coautor">City:</label>
	    <input type="text" id="ciudad_coautor" name="ciudad_coautor" placeholder="City" class="form-control" value="<%= asistente.getCiudad() %>"/>
	  </div>
	  <div class="form-group">
	    <label for="pais_coautor">Country: *</label>
	    <input type="text" id="pais_coautor" name="pais_coautor" placeholder="Country" class="form-control" value="<%= asistente.getPais() %>"/>
	  </div>
<%
	}
%>
	