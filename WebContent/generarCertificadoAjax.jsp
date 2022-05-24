<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>   
<%@page errorPage="error.jsp" %>
<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>

<%
Asistente asistente = new Asistente();		

String tipoDoc = request.getParameter("tipoDoc");
if (tipoDoc==null) tipoDoc="";
if (tipoDoc.equals("")) tipoDoc="";	

String numero = request.getParameter("numDoc");
if (numero==null) numero="0";
if (numero.equals("")) numero="0";


asistente = facade.getAsistente(tipoDoc, numero);

session.setAttribute("asistente", asistente);

if (asistente!= null){
%>

	<div class="alert alert-success" role="alert">
	The certificate was generated correctly
	</div>
	<div class="card">
		<div class="card-header">
			<h3 class="card-title"><%= asistente.toString() %></h3>
		</div>
		<div class="card-body">
			<a href="papers/certificadoPonente.jsp?idAsis=<%= asistente.getId()%>" title="Certificate of Attendance" target="_blank"><img src="imagenes/pdf.jpg"jpg" height="22" width="22"></img> Download certificate</a>
		</div>
	</div>
<% 
} else {
%>
<div class="alert alert-danger" role="alert">
	Identification not found, please review the data and your attendance at the conference.
</div>
<% 
}
%>