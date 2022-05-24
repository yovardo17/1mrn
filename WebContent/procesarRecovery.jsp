<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>

<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"/>

<%
    String email= request.getParameter("email");
    String mensaje = facade.verificarUsuario(email);    
    String action="";
    action= "recupero.jsp?error=" + mensaje;    
%>

<form id="frmLogin" action="<%= action %>" method="post">
</form>

<script>
    frmLogin.submit();
</script>