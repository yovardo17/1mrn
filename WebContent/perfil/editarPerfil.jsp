<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>
<% 		
	try{		
		Asistente asistente = new Asistente();		
		asistente= (Asistente)session.getAttribute("asistente");
		String titulo="";

		if (asistente==null) {
			titulo="Please login.";
			response.sendRedirect("login.jsp?error=" + titulo);
		}
		
		if (asistente.getTelefono()==null) asistente.setTelefono("");
		if (asistente.getEmailsContacto()==null) asistente.setEmailsContacto("");
%>
<!DOCTYPE html>
<html lang="es">
	
	<head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta http-equiv="x-ua-compatible" content="ie=edge">
	  <meta name="author" content="foristom">
	  <meta name="description"
	    content="5+1  6IMRMPT - International Meeting for Researchers in Materials and Plasma Technology">
	  <title>5+1  imrmpt</title>
	  <link rel="apple-touch-icon" sizes="57x57" href="../favicons/apple-icon-57x57.png">
	  <link rel="apple-touch-icon" sizes="60x60" href="../favicons/apple-icon-60x60.png">
	  <link rel="apple-touch-icon" sizes="72x72" href="../favicons/apple-icon-72x72.png">
	  <link rel="apple-touch-icon" sizes="76x76" href="../favicons/apple-icon-76x76.png">
	  <link rel="apple-touch-icon" sizes="114x114" href="../favicons/apple-icon-114x114.png">
	  <link rel="apple-touch-icon" sizes="120x120" href="../favicons/apple-icon-120x120.png">
	  <link rel="apple-touch-icon" sizes="144x144" href="../favicons/apple-icon-144x144.png">
	  <link rel="apple-touch-icon" sizes="152x152" href="../favicons/apple-icon-152x152.png">
	  <link rel="apple-touch-icon" sizes="180x180" href="../favicons/apple-icon-180x180.png">
	  <link rel="icon" type="image/png" sizes="192x192" href="../favicons/android-icon-192x192.png">
	  <link rel="icon" type="image/png" sizes="32x32" href="../favicons/favicon-32x32.png">
	  <link rel="icon" type="image/png" sizes="96x96" href="../favicons/favicon-96x96.png">
	  <link rel="icon" type="image/png" sizes="16x16" href="../favicons/favicon-16x16.png">
	  <link rel="manifest" href="../favicons/manifest.json">
	  <meta name="msapplication-TileColor" content="#ffffff">
	  <meta name="msapplication-TileImage" content="../favicons/ms-icon-144x144.png">
	  <meta name="theme-color" content="#ffffff">
	  <!-- Font Awesome -->
	  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
	  <!-- Google Fonts -->
	  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
	  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.css" rel="stylesheet" />
	  <!-- Bootstrap core CSS -->
	  <link href="../css/bootstrap.min.css" rel="stylesheet">
	  <!-- Material Design Bootstrap -->
	  <link href="../css/mdb.min.css" rel="stylesheet">
	  <!-- Your custom styles (optional) -->
	  <link href="../css/style.css" rel="stylesheet">
	  
  	  <script src="../js/general.js"></script>	    
	
	</head>
	
  <body>
  	<jsp:useBean id="asistenteFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>
  	
  	<jsp:include page="../banner/header-app2.jsp"></jsp:include>
  		<section id="tres" class="container-fluid row p-0 m-0" style="background-image:url(../imagenes/fondo0.png); background-color:#00244F ; background-repeat: no-repeat; background-position:center; background-size: cover; width: 100%">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>
		
		
		    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
		    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
		      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#35568C;">
		      <i class="fas fa-user-plus fa-4x" style="color:rgb(42, 146, 187)"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Personal information</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">		 
		             			
		    			<div class="card bg-light mb-3">
				            <div class="card-header">
				              <h3 class="card-title">You can change your personal information (* are requiered).</h3>
				            </div>
				            <div class="card-body">
						        <form id="frmRegistro" name="frmRegistro" action="guardarPerfil.jsp" method="post">					
									<div class="form-group">
										<label for="tipoDocumento">Type ID:</label>
										<select id="tipoDocumento" name="tipoDocumento" class="form-control" >
											<option value="cc">CC</option>
											<option value="pste">Passport</option>
											<option value="ot">Other</option>
										</select>
									</div>
					                            
									<div class="form-group">
										<label for="numeroDocumento">ID Number:</label>
										<input type="text" id="numeroDocumento" name="numeroDocumento" placeholder="Id Number" 
										class="form-control" value="<%= asistente.getNumeroDocumento() %>"/>
									</div>
					                      					                                  					                                  
									<div class="form-group">
										<label for="nombre">Name: *</label>
										<input type="text" id="nombre" name="nombre" class="form-control" placeholder="Name" value="<%= asistente.getNombre()%>"/>
									</div>
									<div class="form-group">
										<label for="apellido">Last Name: *</label>
										<input type="text" id="apellido" name="apellido" class="form-control" placeholder="Last Name" value="<%= asistente.getApellido()%>"/>
									</div>
					                                 					    					
									<div class="form-group">
										<label for="emali">Login Email: *</label>
										<input type="email" class="form-control" required="required"  id="emali" name="email" placeholder="Email" value="<%= asistente.getEmail()%>">
									</div>
									
									<div class="form-group">
										<label for="institucion">Institution or Company:</label>
										<input type="text" id="institucion" name="institucion" placeholder="Institution or Company" class="form-control" value="<%= asistente.getInstitucion()%>"/>
									</div>
									
									<div class="form-group">
		                                <label for="ciudad">Address:</label>
		                                <input type="text" id="direccion" name="direccion" placeholder="Correspondence Address" class="form-control" value="<%= asistente.getDireccion() %>"/>
		                            </div>
									
									<div class="form-group">
										<label for="ciudad">City:</label>
										<input type="text" id="ciudad" name="ciudad" placeholder="City" class="form-control" value="<%= asistente.getCiudad()%>"/>
									</div>
									<div class="form-group">
										<label for="pais">Country:</label>
										<input type="text" id="pais" name="pais" placeholder="Country" class="form-control" value="<%= asistente.getPais()%>"/>
									</div>
									
									
									<div class="form-group">
										<label for="ciudad">Telephone:</label>
										<input type="text" id="telefono" name="telefono" placeholder="Telephone" class="form-control" value="<%= asistente.getTelefono()%>"/>
									</div>
									
									<div class="form-group">
										<label for="email_contacto">Other Contact Email:</label>
										<input type="text" id="email_contacto" name="email_contacto" placeholder="Other email contact" class="form-control" value="<%= asistente.getEmailsContacto()%>"/>
									</div>				
					
									<div id="divDatosSesion">
										<div class="form-group">
											<label for="exampleInputPassword1">Password: (This will be the new Passsword)</label>
											<input type="password" class="form-control" id="password" name="password" placeholder="Password">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">Repeat Password:</label>
											<input type="password" class="form-control" id="password2" name="password2" placeholder="Repeat password">
										</div>
									</div>
					  
									<div class="form-group" align="center">
									    <button type="button" onclick="validarInformacion()" class="btn btn-primary">Save</button>
									    <a class="btn btn-primary" href="../bienvenida.jsp">Cancel</a>
									</div>					
							   </form>
					     	</div>
		    			</div>
		    		</div>
		    	</div>     
		    </div>  
		 </div>
	</section>	
		    	
	<!-- FOOTER -->
    <jsp:include page="../banner/footer-app.jsp"></jsp:include>   		
</body>
</html>
<%
	} catch (Exception e){
		e.printStackTrace();
		session.invalidate();
		String mensaje="System Error, please contact chair.";
		response.sendRedirect("login.jsp?error="+ mensaje);
	}
%>