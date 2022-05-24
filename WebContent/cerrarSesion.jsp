<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<jsp:useBean id="asistente" class="co.edu.ufps.imrmtp.capaDatos.dto.Asistente" scope="session"/>
<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"/>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>