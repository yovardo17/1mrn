<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>   
<%@page errorPage="error.jsp" %>
<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>

<%
Asistente asistente = new Asistente();		
asistente= (Asistente)session.getAttribute("asistente");
String msg="";
boolean error=false;

if (asistente==null) throw new Exception("No Session");

String id = request.getParameter("idPaper");
if (id==null) id="0";
if (id.equals("")) id="0";	

int idPaper = Integer.parseInt(id);
short estado=5;


boolean rta = facade.cambiarEstadoPaper(idPaper, estado);

if (rta){
%>
<div class="alert alert-success" role="alert">
Saved correctly.
</div>
<% 
} else {
%>
<div class="alert alert-danger" role="alert">
Error.
</div>
<% 
}
%>