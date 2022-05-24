|<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0039)http://getbootstrap.com/examples/theme/ -->
<html lang="en">
  
   <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="author" content="foristom - 6imrmmpt">
  <meta name="description"
    content="5+1  6imrmpt - International Meeting for Researchers in Materials and Plasma Technology">
  <title>5+1  imrmpt</title>
  <link rel="apple-touch-icon" sizes="57x57" href="favicons/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="favicons/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="favicons/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="favicons/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="favicons/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="favicons/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="favicons/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="favicons/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="favicons/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192" href="favicons/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="favicons/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="favicons/favicon-16x16.png">
  <link rel="manifest" href="favicons/manifest.json">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="favicons/ms-icon-144x144.png">
  <meta name="theme-color" content="#ffffff">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.css" rel="stylesheet" />
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="css/style.css" rel="stylesheet">

</head>
    
    <body>
        <jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>
        <% 
        String ok= request.getParameter("g-recaptcha-response");
        
        String action="";
        if(ok==null||ok.equals("")) {
        	action="registro.jsp?error=Captcha was not validated";
        
        %>
        	<form id="frmRegistro" action="<%= action %>" method="post"></form>			
			<script>
			   frmRegistro.submit();
			</script>
        <%
        } else {
        	String tipoDocumento = request.getParameter("tipoDocumento");
	        String documento = request.getParameter("numeroDocumento");
	        String nombre = request.getParameter("nombre");
	        String apellido = request.getParameter("apellido");
	        String email = request.getParameter("email");
	        String pais = request.getParameter("pais");
	        String ciudad = request.getParameter("ciudad");
	        String institucion = request.getParameter("institucion");
	        short tipo = (short)Integer.parseInt(request.getParameter("tipoAsistente"));
	        String password = request.getParameter("password");
	        String direccion = request.getParameter("direccion");
	        String msg = facade.registrarAsistente(tipoDocumento, documento, apellido, 
	        nombre, email, pais, ciudad, institucion, password, tipo, direccion);
        %>
        
        <jsp:include page="banner/header.jsp"></jsp:include>
        
 <section id="tres" class="container-fluid row p-0 m-0 "> 

    <div class="col-12 p-0 m-0"
      style="background-color:#ffffff; background-image: url(imagenes/textura5mas1.png); background-blend-mode:overlay;">
      <br><br><br></div>
    <div class="col-2 p-0 m-0"
      style="background-color:#ffffff;background-image: url(imagenes/textura5mas1.png); background-blend-mode:overlay; ">
    </div>


    <div class="col-12 row p-0 m-1 " style="background-color:#45BDEE;background-image: url(imagenes/textura5mas1.png); background-blend-mode:overlay; ">
      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#35568C;">
      <i class="fas fa-user-plus fa-4x" style="color:rgb(42, 146, 187)"></i></div>
      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
          style="font-size: 1.5em">Register</span><br><br></div>
      <a name="Register"></a>
      <div class="p-0 p-sm-2 p-md-5" >
				

        <div class="row p-0 mt-5">
          <div class=" borde-tabla2 fonto-tabla">
		    			
		    			<div class="card mb-3 p-3 p-lg-5">
			                <div class="card-header">
			                    <h3 class="card-title">Personal information:</h3>
			                </div>
			                <div class="card-body p-0 p-lg-5" >
			                    <table class="table">
			                        <tbody>
			                            <tr>
			                                <td>Type ID:</td>
			                                <td>
			                                <%= tipoDocumento %>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td>ID Number:</td>
			                                <td>
			                                <%= documento %>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td>Name:</td>
			                                <td><%= nombre%>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td>Last Name:</td>
			                                <td><%= apellido %></td>
			                            </tr>
			                            <tr>
			                                <td>Email:</td>
			                                <td>
			                                <%= email %>
			                                </td>
			                            </tr>
			                        </tbody>
			                    </table>
			                    <% 
			                    if(msg.equals("")){
			                        msg="Successful Registration.";
			                        %>
			                        <div class="alert alert-success" role="alert">
			                        <%= msg %>
			                        </div>
			                        <% 
			                    }
			                    else {
			                        %> 
			                        <div class="alert alert-danger" role="alert">
			                        <%= msg %>
			                        </div>
			                        <%
			                    }
			                    %>
			                    <div class="form-group" align="center">
			                    	<a class="btn btn-info" href="login.jsp">Submit Abstract</a>
			                    </div>    
			                </div>
			           </div>
		    		</div>     
		    	</div>
		    </div>
		 </div>      
        </section>
                        
        <!-- FOOTER -->
        <jsp:include page="banner/footer.jsp"></jsp:include>
    <% 
        }
    %>
    </body>
</html>
