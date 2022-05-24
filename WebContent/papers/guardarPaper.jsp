<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Topico"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0039)http://getbootstrap.com/examples/theme/ -->
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
  <jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
  <jsp:useBean id="paper" class="co.edu.ufps.imrmtp.capaDatos.dto.Paper" scope="session"></jsp:useBean>

<% 
	Asistente asistente = new Asistente();		
	asistente= (Asistente)session.getAttribute("asistente");	
	
	if (asistente==null) throw new Exception("No Session");
	
	String titulo_en = request.getParameter("titulo_en");
	String titulo_es = request.getParameter("titulo_es");
	String resumen_en = request.getParameter("resumen_en");
	String resumen_es = request.getParameter("resumen_es");
	String topico= request.getParameter("topico");
	String tipo = request.getParameter("tipoPresentacion");
	String speaker = request.getParameter("speaker");
	
	/*String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String email = request.getParameter("email");
	String telefono = request.getParameter("telefono");
	String institucion = request.getParameter("institucion");
	String pais = request.getParameter("pais");
	String ciudad = request.getParameter("ciudad");
	
	asistente.setNombre(nombre);
	asistente.setApellido(apellido);
	asistente.setEmailsContacto(email);
	asistente.setTelefono(telefono);
	asistente.setInstitucion(institucion);
	asistente.setPais(pais);
	asistente.setCiudad(ciudad);*/
	
	String msg="";
	
	if (speaker==null) speaker="";
	speaker = speaker.trim();
	
	paper.setTituloEn(titulo_en);
	paper.setTituloEs(titulo_es);
	paper.setResumenEn(resumen_en);
	paper.setResumenEs(resumen_es);
	
	Topico t = new Topico();
	t.setId(Short.parseShort(topico));
	paper.setTopico(t);
	
	TipoPresentacion tp = new TipoPresentacion();
	tp.setId(Short.parseShort(tipo));
	paper.setTipoPresentacion(tp);
	
	paper.setPonente(speaker);
	
	boolean  rta = facade.registrarPaper(paper, asistente);
	
	if (rta) msg = "Successful Registration";
    else msg = "Registration was not Successful";
%>
    <jsp:include page="../banner/header-app2.jsp"></jsp:include>
  		<section id="tres" class="container-fluid row p-0 m-0 "> 

		    <div class="col-12 p-0 m-0"
		      style="background-color:#ffffff; background-image: url(../imagenes/textura5mas1.png); background-blend-mode:overlay;">
		      <br><br><br></div>
		    <div class="col-2 p-0 m-0"
		      style="background-color:#ffffff;background-image: url(../imagenes/textura5mas1.png); background-blend-mode:overlay; ">
		    </div>
		
		
		    <div class="col-12 row p-0 m-1 " style="background-color:#45BDEE;background-image: url(../imagenes/textura5mas1.png); background-blend-mode:overlay; ">
		      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#35568C;">
		      <i class="fas fa-user-plus fa-4x" style="color:rgb(42, 146, 187)"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Submit abstract</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">
		    			<div class="card">
				      		<div class="card-header">
				              <h3 class="card-title">Abstract information</h3>
				            </div>
				            <div class="card-body">
						    	<table class="table">
					            <tbody>
					              <tr>
					                <td>English title :</td>
					                <td>
					                	<%= titulo_en %>
					                </td>
					              </tr>
					              <tr>
					                <td>Spanish Title</td>
					                <td>
					                	<%= titulo_es %>
					                </td>
					              </tr>
					              <tr>
					                <td>English abstract:</td>
					                <td><%= resumen_en%>
					                </td>
					              </tr>
					              <tr>
					                <td>Spanish abstract:</td>
					                <td><%= resumen_es %></td>
					              </tr>
					           </tbody>
					           </table>
					<% 
							if(rta){
					%>           
								<div class="alert alert-success" role="alert">
									<%= msg %>
								</div>
					<% 
							} else {
					%> 
								<div class="alert alert-danger" role="alert">
									<%= msg %>
								</div>
					<% 
							}
					%>
								<div class="form-group" align="center">
									<a href="../bienvenida.jsp" class="btn btn-lg btn-primary">Home</a>
								</div>   
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