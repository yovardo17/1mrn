<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>
<!DOCTYPE html>
<html lang="es">
	<head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta http-equiv="x-ua-compatible" content="ie=edge">
	  <meta name="author" content="foristom">
	  <meta name="description"
      content="First Meeting of Materials Science, Engineering and Nanotechnology Researchers Network (1st MRN)">  
    <title>1st MRN </title>
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
	  <link href="../css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
		
	 <!-- boton style-->
	 <link href="../css/estilos.css" rel="stylesheet">
	 <link href="../css/resumen.css" rel="stylesheet">
     <!--/boton style-->
	  
  	  <script src="../js/general.js"></script>	    
	
	</head>
<%   
	try{		
		Asistente asistente = new Asistente();		
		asistente= (Asistente)session.getAttribute("asistente");
		String titulo="";

		if (asistente==null) {
			titulo="Please login.";
			response.sendRedirect("login.jsp?error=" + titulo);
		}
%>
  <body>
  <jsp:useBean id="paperFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
  <jsp:useBean id="asistenteFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>
  
  
  <% 
  		List<Asistente> lista = asistenteFacade.getAsistentesPendientes();
  		  
  %>
    
	<jsp:include page="../banner/header-app2.jsp"></jsp:include>
  	<section id="tres" class="container-fluid row p-0 m-0" style="background-image: url(../imagenes/texturamrn1.png); background-blend-mode:overlay; background-repeat: round; width: auto">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>


    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
		      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12;">
		      <i class="fas fa-user-plus fa-4x" style="color:#0F4C83"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Submit abstract</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">
		          																			
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Assistants</h3>
								</div>
								<div class="card-body">
									

									<div id="divResultados">
										<div class="form-group">
											<label for="cantidad">Number of pending payments: </label>
											<input type="text" id="cantidad" name="cantidad" class="form-control" readonly="readonly" value="<%= lista.size() %>">
										</div>
										<div class="table-responsive">										
										<table class="table" id="tabla_abstracts" style="width: 100%;">
											<thead>
												<tr>
													<td><strong>Document</strong></td>
													<td><strong>Name</strong></td>
													<td><strong>Assistant Type</stryong></td>
													<td><strong>Presented Papers</strong></td>
													<td><strong>Speaker Papers</strong></td>
													<td>...</td>
												</tr>
											</thead>
											<tbody>
										<% 
										
										for(Asistente asis: lista){
											String documento = asis.getTipoDocumento() + " " + asis.getNumeroDocumento(); 
											String nombre = asis.getNombre() + " " + asis.getApellido();
											int ponente = paperFacade.numeroPonencias(nombre);
											int papers = paperFacade.numeroPapers(asis.getId());
										
										%>
												<tr>
													<td><%= documento %></td>
													<td><%= nombre %></td>
													<td><%= asis.getTipoAsistente().getNombre() %></td>
													<td><%= papers %></td>
													<td><%= ponente %></td>
													<td>
														<div id="divPresentar<%= asis.getId()%>">														
															<div class="form-group">
																<button type="button" class="boton resumen" style="width: min(80px, 25vw)" onclick="activarAsistente(<%= asis.getId()%>)"><span>Activate</span></button>			          	
															</div>																													
														</div>
													</td>
												</tr>
										<% 
										}
										if(lista.size()==0){
										%>
												<tr>
													<td></td>
													<td class="lead" colspan="4">There are not pending payments</td>													
												</tr>
										<% 
										}
										%>
											</tbody>
										</table>
										</div>										
									</div>
								</div>
							</div>
							<br>
						    <div class="form-group" align="center">
								<a href="../bienvenida.jsp" class="boton resumen" style="width: min(100px, 25vw)"><span>Home</span></a>
							</div>																																				  																		
					</div>     
			    </div>  
			 </div>
		</div>
	</section>
		
	<!-- FOOTER -->
    <jsp:include page="../banner/footer-app.jsp"></jsp:include>	
    <script src="../js/dataTable/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#tabla_abstracts').DataTable();
		} );
	</script> 	
	</body>
<% 
	}catch(Exception e){
		e.printStackTrace();
		String mensaje="System Error, please contact chair.";
		response.sendRedirect("../login.jsp?error="+ mensaje);
	}
%>
</html>