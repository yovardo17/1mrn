<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<%
int tipoSeleccionado = Integer.parseInt(request.getParameter("valor"));
if (tipoSeleccionado==1 || tipoSeleccionado==2){
%>
<div class="form-group">
<label for="exampleInputPassword1">Password:</label>
<input type="password" required="required"  class="form-control" id="password" name="password" placeholder="Password">
</div>
<div class="form-group">
<label for="exampleInputPassword1">Repeat Password:</label>
<input type="password" required="required" class="form-control" id="password2" name="password2" placeholder="Repita password">
</div>
<%
}
%>