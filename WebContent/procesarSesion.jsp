<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<%@ page errorPage="error.jsp" %>

<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"/>

<%
String ok= request.getParameter("g-recaptcha-response");
String action="";
if(ok==null||ok.equals("")) {action="login.jsp?error=Captcha was not validated";}
else{
    String email= request.getParameter("email");
    String password = request.getParameter("password");
    Asistente asistente = facade.verificarUsuario(email, password);
    String mensaje="";
    action="";
    
    if(asistente!=null){
        session.setMaxInactiveInterval(1000000);
        session.setAttribute("asistente", asistente);
        action="bienvenida.jsp";
    }else {
        session.invalidate();
        mensaje="Error, Incorrect email or password.";
        action= "login.jsp?error=" + mensaje;
    }
}
%>

<form id="frmLogin" action="<%= action %>" method="post">
</form>

<script>
    frmLogin.submit();
</script>