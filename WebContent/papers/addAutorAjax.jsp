<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Coautor"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>
   <jsp:useBean id="paper" class="co.edu.ufps.imrmtp.capaDatos.dto.Paper" scope="session"></jsp:useBean>
<%
	Asistente asistenteSes = new Asistente();		
	asistenteSes = (Asistente)session.getAttribute("asistente");
	String msg="";
	boolean error=false;
	
	if (asistenteSes ==null) throw new Exception("No Session");
	
	Asistente asistente = new Asistente();
	
	if (paper.getAutores().size()>0) asistente = paper.getAutores().get(0);
	else asistente = asistenteSes;
	
	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");	
	String pais = request.getParameter("pais");
	String ciudad = request.getParameter("ciudad");
	String institucion = request.getParameter("institucion");
	String email = request.getParameter("email");
	
	//Coautor author = new Coautor();
	Asistente author = new Asistente();	
	author.setNombre(nombre);
	author.setApellido(apellido);	
	author.setPais(pais);
	author.setCiudad(ciudad);
	author.setInstitucion(institucion);
	author.setEmail(email);
	
	//author.setPaper(paper);
	
	if (!paper.getAutores().contains(author)) {
		paper.getAutores().add(author);
		msg= "The author was added correctly.";
	}
	else {
		msg = "Error. This co-author <strong>  " +  author.toString() + "</strong> is duplicated. ";
		error = true;
	}
	
%>	


<% 
	if(error){
%>
	<div class="alert alert-danger" role="alert">
		<%= msg %>
	</div>
<%
	} else {
%>
	<div class="alert alert-success" role="alert">
		<%= msg %>
	</div>
<%
	}
%>
	<br>
	<table class="table table-bordered">
    	<thead>
        	<tr>           		
           		<td><strong>Name</strong></td>           		
           		<td><strong>Filial, Institution or Company</strong> </td>
           		<td><strong>Email</strong> </td>
           		<td>...<input type="hidden" id="numeroAutores" name="numeroAutores" 
          			value="<%= paper.getAutores().size() %>"></input>
          		</td>
         	</tr>
         </thead>
    	 <tbody>
	        <% 
	        		for(Asistente a: paper.getAutores()){
	        %>
           	<tr>           		
           		<td><%= a.getNombre() + " " + a.getApellido() %></td>           		
           		<td><%= a.getInstitucion() %></td>
           		<td><%= a.getEmail() %></td>
           		<td>           			
           			<a href="#autores" onclick="deleteAuthor('<%= a.getNombre() %>','<%= a.getApellido() %>')"><img src="../imagenes/delete_16.png"></img></a>
           		</td>
           	</tr>
			<% 
	        		}
	        		
	        		if(paper.getAutores().size()==0){
			%>
							<tr>
			            		<td class="lead" colspan="5">No authors included.</td>
			            	</tr>
			<% 
	        		}
			%>
		</tbody>
	</table>
	<br>
	<div class="form-group">
	   <label for="speaker">Speaker: *</label>
	   <select id="speaker" name="speaker" class="form-control" required="required" onchange="validarPonentes()">
	   		<option value="-1">Select Speaker:</option>
	   	<!--  <option value="<%//= asistente.toString()%>"><%//= asistente.getNombre() + " "  + asistente.getApellido() %></option>-->
	<% 
		for(Asistente a: paper.getAutores()){
	%>		           		
	        		<option value="<%= a.toString()%>"><%= a.getNombre() + " "  + a.getApellido() %></option>
	<% 
		}
	%>		           		
	   </select>
	   <br>
	   <div id="divPonentes">
     		<input type="hidden" id="numero_ponentes" name="numero_ponentes" value="0"/>
     	</div> 
	</div>
	