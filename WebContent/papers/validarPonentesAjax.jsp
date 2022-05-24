<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%//@page errorPage="../error.jsp" %>
<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
<%
	Asistente asistente = new Asistente();		
	asistente= (Asistente)session.getAttribute("asistente");
	String msg="";
	boolean error=false;
	
	if (asistente==null) throw new Exception("No Session");
	
	String ponente = request.getParameter("ponente");
	if(ponente==null) ponente="";
		
	int numero = facade.numeroPonencias(ponente);
		
	if (numero>=0){	
		if((numero+1)>2) msg="This autor: " + ponente + " already has two works for presentation as speaker.";
		else msg= "";
		error=false;
	} else {
		msg = "System Error.";
		error = true;
	}
	
%>	


<% 
	if(error){
%>
	<div class="alert alert-danger" role="alert">
		<%= msg %>
	</div>
	<input type="hidden" id="numero_ponentes" name="numero_ponentes" value="<%= numero %>"/>
<%
	} else {
		if (!msg.equals("")){
%>
	<div class="alert alert-danger" role="alert">
		<%= msg %>
	</div>
<% 
		}
%>
	<input type="hidden" id="numero_ponentes" name="numero_ponentes" value="<%= numero %>"/>
<%
	}
%>	