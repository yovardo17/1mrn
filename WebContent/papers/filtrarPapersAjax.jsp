<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>
   <jsp:useBean id="paper" class="co.edu.ufps.imrmtp.capaDatos.dto.Paper" scope="session"></jsp:useBean>
   <jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
   
<%
	Asistente asistente = new Asistente();		
	asistente= (Asistente)session.getAttribute("asistente");
	String msg="";
	boolean error=false;
	
	if (asistente==null) throw new Exception("No Session");
	
	String numero = request.getParameter("idPaper");
	if (numero==null) numero="0";
	if (numero.equals("")) numero="0";
	int idPaper = Integer.parseInt(numero);
	
	numero = request.getParameter("idEstado");
	if (numero==null) numero="0";
	if (numero.equals("")) numero="0";
	int idEstado = Integer.parseInt(numero);
	
	numero = request.getParameter("idTopico");
	if (numero==null) numero="0";
	if (numero.equals("")) numero="0";
	int idTopico = Integer.parseInt(numero);
	
	numero = request.getParameter("idTipo");
	if (numero==null) numero="0";
	if (numero.equals("")) numero="0";
	int idTipo = Integer.parseInt(numero);
	
	List<Paper> papers = facade.getPapers(idPaper, idEstado, idTopico, idTipo);
	// Subir a variable de sesión los filtros aplicados
	session.setAttribute("id_paper", "" + idPaper);
	session.setAttribute("idEstado", "" + idEstado);
	session.setAttribute("idTopico", "" + idTopico);
	session.setAttribute("idTipo", "" + idTipo);
%>

	<div class="form-group">
	    <label for="cantidad">Number of Abstract found: </label>
	    <input type="text" id="cantidad" name="cantidad" class="form-control" readonly="readonly" value="<%= papers.size() %>">
  	</div>
       	<table class="table" id="tabla_abstracts">
       		<thead>
       			<tr>
         		<td><strong>Id</strong></td>
         		<td><strong>Title</strong></td>
         		<td><strong>Topic</strong></td>
         		<td><strong>Status</strong></td>
         		<td>...</td>
       			</tr>
       		</thead>
       		<tbody>
   <% 
   		
   	for(Paper p: papers){
   		
   		String tituloEn = p.getTituloEn();
   		String topicoEn = p.getTopico().getNombreEn();
		if (tituloEn.length()>60) tituloEn = tituloEn.subSequence(0, 59) + "...";
		if (topicoEn.length()>60) topicoEn = topicoEn.subSequence(0, 59) + "...";
   %>
         	<tr>
         		<td><%= p.getId() %></td>
         		<td><%= tituloEn %></td>
         		<td><%= topicoEn %></td>
         		<td><%= p.getEstadoPaper().getNombre() %></td>
         		<td>
         			<a href="papers/detallePaper.jsp?id=<%= p.getId()%>" title="See details"><img src="imagenes/ver_detalles_16.png"></img></a>
         			&nbsp;<a href="papers/editarPaper.jsp?id=<%= p.getId()%>" title="Edit Abstract"><img src="imagenes/edit_16.png"></img></a>
         <% 
         		if((p.getEstadoPaper().getId()==1)||(p.getEstadoPaper().getId()==4)){
         %>			
         			&nbsp;<a href="papers/borrarPaper.jsp?id=<%= p.getId()%>" title="Delete Abstract"><img src="imagenes/delete_16.png"></img></a>
         <% 
         		}
         %>
         <% 
         		if(p.getEstadoPaper().getId()==2){
         %>
         			&nbsp;<a href="papers/cartaAceptacion.jsp?id=<%= p.getId()%>" title="Acceptance letter" target="_blank"><img src="imagenes/aceptation_16.png"></img></a>
         <% 
         		}
         %>
         		</td>
         	</tr>
<% 
   		}
   		
   		if(papers.size()==0){
%>
			<tr>
         		<td></td>
         		<td class="lead" colspan="5">No abstracts submitted</td>
         		<td></td>
				<td></td>
				<td></td>
         	</tr>
<% 
   		}
%>
         </tbody>
       </table>           
