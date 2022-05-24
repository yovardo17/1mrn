<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.SesionPonencia"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Room"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
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
	  <title>1<sup>st</sup> MRN</title>
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
	  <link href="../css/dataTable/buttons.dataTables.min.css" rel="stylesheet">
		
	  <!-- boton style-->
	  <link href="../css/estilos.css" rel="stylesheet">
	  <link href="../css/resumen.css" rel="stylesheet">
      <!--/boton style-->
	  
  	  <script src="../js/general.js"></script>	    
	
	</head>
	
	<style>
		.nav-item:hover{
			background-color: blue;
			color: #000;
		} 
		
		.nav-link:hover{
			background-color: blue;
			color: #000;
		} 
	</style>
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
  <body role="document">
  <jsp:useBean id="paperFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
  <jsp:useBean id="roomFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.RoomFacade" scope="page"></jsp:useBean>
  
  <% 
  		int id = Integer.parseInt(request.getParameter("id"));
  		Room room = roomFacade.getRoom(id);
  		
  		Date dia = Date.valueOf("2021-06-02");
  		List<SesionPonencia> sesiones1 = roomFacade.getSesiones(dia, room);
  		
  		Date dia2 = Date.valueOf("2021-06-03");
  		List<SesionPonencia> sesiones2 = roomFacade.getSesiones(dia2, room);
  		
  		Date dia3 = Date.valueOf("2021-06-04");
  		List<SesionPonencia> sesiones3 = roomFacade.getSesiones(dia3, room);
  		
  		Locale locale = new Locale("en", "us");
  		DateFormat formato=new SimpleDateFormat("d ' ' MMMMM ' ' yyyy", locale );
  		DateFormat formatoHora=new SimpleDateFormat("HH:mm", locale );

  		String fecha1 = formato.format(dia);
  		String fecha2 = formato.format(dia2);
  		String fecha3 = formato.format(dia3);
  
  %>
    <jsp:include page="../banner/header-app2.jsp"></jsp:include>
    <section id="tres" class="container-fluid row p-0 m-0" style="background-image:url(../imagenes/fondo0.png); background-color:#00244F ; background-repeat: no-repeat; background-position:center; background-size: cover; width: 100%">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>
		
		
		    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
		      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#35568C;">
		      <i class="fas fa-user-plus fa-4x" style="color:rgb(42, 146, 187)"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Room Programme</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">
  
    
  					<div class="card">
				            <div class="card-header">
				              <h3 class="card-title">Room <%= room.getHostName() %></h3>
				            </div>
				            	<div class="card-body">
				            	
				            		<div class="card-header">
				            			<div class="card-body">
				            				<div class="table-responsive">
					            				<table class="table">
					            					<tr>
					            						<td><a href="room.jsp?idRoom=<%= room.getId() %>" style="color: darkslategray; font-weight: bold"><img src="../imagenes/videoconference.png" />&nbsp; Join Web </a></td>
														<%
																if (room.isMostrarLink()) {
															%>
														<td>											
															<a href="<%= room.getLink() %>" target="_blank" style="color: darkslategray; font-weight: bold"> <img src="../imagenes/logo_zoom.png" height="64" width="64"/>&nbsp; Join Zoom</a>											
														</td>
														<%
																}		
																if (room.getLinkFacebook()!=null){
																	if (!room.getLinkFacebook().equals("")){
														%>					            						
					            						<td><a href="<%= room.getLinkFacebook() %>" target="_blank" style="color: darkslategray; font-weight: bold"> <img src="../imagenes/facebook.png" height="64" width="64"/>&nbsp; Join Facebook</a></td>
					            						<% 
																
																	}
																}
																if(room.getLinkYoutube()!=null){
																	if (!room.getLinkYoutube().equals("")){
																	
					            						%>
					            						<td><a href="<%= room.getLinkYoutube() %>" target="_blank" style="color: darkslategray; font-weight: bold"> <img src="../imagenes/youtube.png" height="64" width="64"/> &nbsp; Join YouTube</a></td>
					            						<%
																
																	}
																}
					            						%>
					            					</tr>					            				
					            				</table>
				            				</div>				            								            				
				            			</div>
				            		</div>
				            		
				            	<br>				        				            
				            	<ul class="nav nav-tabs" id="myTab" role="tablist">
				            	<%
				            		if (sesiones1.size()>0){
				            	%>
					              <li class="nav-item">
					                <a class="nav-link " id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
					                  aria-selected="true"><span style="color: darkslategray; font-weight: bold">First day: <%= fecha1 %></span></a>
					              </li>
					            <% 
				            		}
				            		if (sesiones2.size()>0){
					            %>
					              
					              <li class="nav-item">
					                <a class="nav-link"  id="profile-tab" data-toggle="tab" href="#profile" role="tab"
					                  aria-controls="profile" aria-selected="false"><span style="color: darkslategray; font-weight: bold">Second day: <%= fecha2 %></span></a>
					              </li>
					           <% 
				            		}
				            		if (sesiones3.size()>0){
					           %>
					              
					              <li class="nav-item">
					                <a class="nav-link " id="day3-tab" data-toggle="tab" href="#day3" role="tab"
					                  aria-controls="day3" aria-selected="false"><span style="color: darkslategray; font-weight: bold">Third day: <%= fecha3 %></span></a>
					              </li>
					           <% 
				            		}
					           %>
					           		
					           	 <li class="nav-item">
					                <a class="nav-link" id="return-tab" data-toggle="tab" href="../bienvenida.jsp" role="tab"
					                  aria-controls="return" aria-selected="false"><span style="color: darkslategray; font-weight: bold">Return Home</span></a>
					              </li>
					              
					              					              
					            </ul>



					          <div class="tab-content" id="myTabContent">
					          
					            <%
				            		if (sesiones1.size()>0){
				            	%>
					            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					
					              <div class="col-12 mt-4 mb-4 ">
					              	
					              	
					              		
					              		<div class="table-responsive" style="width: 100%;">										
											<table class="table" id="tblDia1" style="width: 100%;">
												<thead>
												
													<tr>
														<td><strong>Hour</strong></td>
														<td><strong>Session</strong></td>
														<td>...</td>
													</tr>
												
												</thead>
												<tbody>
												<% 
													for (SesionPonencia sesion: sesiones1){
														String horaInicio = formatoHora.format(sesion.getHoraInicio());
														String horaFin = formatoHora.format(sesion.getHoraFin());
												%>
													<tr>
														<td><%= horaInicio + " - " + horaFin %></td>
														<td>
															<h5><%= sesion.getTipoSesion().toUpperCase()%></h5>
															<% 
															if (sesion.getPaper()!=null) {
															%>
															<p><b>ID <%= sesion.getPaper().getId() + ": " %></b> <%=  sesion.getPaper().getTituloEn() %></p>
															<p><b>Keynote Speaker / Ponente Magistral: </b> <%= sesion.getPaper().getPonente().toUpperCase() %></p>
															 
															<%
																
															}
															
															%>
														
														
														</td>
														<td>
															<%
																if (sesion.getPaper()!=null) {
															%>
																<a href="../detallePaperConferencista.jsp?id=<%= sesion.getPaper().getId()%>" title="See details" target="_blank">
																	<img src="../imagenes/ver_detalles_16.png"></img>
																</a>
															<% 
																}
															%>
														</td>
													</tr>
												<% 
													}
												%>
													
												</tbody>
											</table>
										</div>
										
										
					                
					
					              </div>
					            </div>
								<% 
				            		}
					            	if (sesiones2.size()>0){
								%>
					
					            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					
					              <div class="col-12 col-lg-12 mt-4 mb-4 ">
											
											<div class="table-responsive" style="width: 100%;">										
											<table class="table" id="tblDia2" style="width: 100%;">
												<thead>
												
													<tr>
														<td><strong>Hour</strong></td>
														<td><strong>Session</strong></td>
														<td>...</td>
													</tr>
												
												</thead>
												<tbody>
												<% 
													for (SesionPonencia sesion: sesiones2){
														String horaInicio = formatoHora.format(sesion.getHoraInicio());
														String horaFin = formatoHora.format(sesion.getHoraFin());
												%>
													<tr>
														<td><%= horaInicio + " - " + horaFin %></td>
														<td>
															<h5><%= sesion.getTipoSesion().toUpperCase()%></h5>
															<% 
															if (sesion.getPaper()!=null) {
															%>
															<p><b>ID <%= sesion.getPaper().getId() %>: </b><%= sesion.getPaper().getTituloEn() %></p>
															<p><b>Keynote Speaker / Ponente Magistral: </b> <%= sesion.getPaper().getPonente().toUpperCase() %></p>
															 
															<%
																
															}
															
															%>
														
														
														</td>
														<td>
															<%
																if (sesion.getPaper()!=null) {
															%>
																<a href="../detallePaperConferencista.jsp?id=<%= sesion.getPaper().getId()%>" title="See details" target="_blank">
																	<img src="../imagenes/ver_detalles_16.png"></img>
																</a>
															<% 
																}
															%>
														</td>
													</tr>
												<% 
													}
												%>
													
												</tbody>
											</table>
										</div>
					                                  
					
					              </div>
					
					            </div>
					            <% 
					            	}
					            	if (sesiones3.size()>0){
					            	
					            %>
					            
					            <div class="tab-pane fade" id="day3" role="tabpanel" aria-labelledby="day3-tab">
					
					              <div class="col-12 mt-4 mb-4 ">
										<div class="table-responsive" style="width: 100%;">										
											<table class="table" id="tblDia3" style="width: 100%;">
												<thead>
												
													<tr>
														<td><strong>Hour</strong></td>
														<td><strong>Session</strong></td>
														<td>...</td>
													</tr>
												
												</thead>
												<tbody>
												<% 
													for (SesionPonencia sesion: sesiones3){
														String horaInicio = formatoHora.format(sesion.getHoraInicio());
														String horaFin = formatoHora.format(sesion.getHoraFin());
												%>
													<tr>
														<td><%= horaInicio + " - " + horaFin %></td>
														<td>
															<h5><%= sesion.getTipoSesion().toUpperCase()%></h5>
															<% 
															if (sesion.getPaper()!=null) {
															%>
															<p><b>ID <%= sesion.getPaper().getId() %>: </b><%= sesion.getPaper().getTituloEn() %></p>
															<p><b>Keynote Speaker / Ponente Magistral: </b> <%= sesion.getPaper().getPonente().toUpperCase() %></p>
															 
															<%
																
															}
															
															%>
														
														
														</td>
														<td>
															<%
																if (sesion.getPaper()!=null) {
															%>
																<a href="../detallePaperConferencista.jsp?id=<%= sesion.getPaper().getId()%>" title="See details" target="_blank">
																	<img src="../imagenes/ver_detalles_16.png"></img>
																</a>
															<% 
																}
															%>
														</td>
													</tr>
												<% 
													}
												%>
													
												</tbody>
											</table>
										</div>
					                                  
					
					              </div>
					
					            </div>
					            <% 
					            	}
					            %>
					
					          </div>
				          </div>
				    	</div>
				    	<br>
				    	<div class="form-group" align="center">	         		
				         		<button type="button" class="boton resumen" style="width: min(80px, 25vw)" onclick="location.href='../bienvenida.jsp'"><span>Home</span></button>
				       	</div>
		    		 </div>     
				    </div>  
				 </div>
			</div>
		</section>		   
        
        <!-- FOOTER -->
        <jsp:include page="../banner/footer-app.jsp"></jsp:include>   
		<script src="../js/jquery-3.2.1.min.js"></script>
  		<script src="../js/dataTable/jquery-1.12.4.js"></script>
  		<script src="../js/dataTable/jquery.dataTables.min.js"></script>
		<script src="../js/dataTable/dataTables.buttons.min.js"></script>
		<script src="../js/dataTable/buttons.flash.min.js"></script>
		<script src="../js/dataTable/jszip.min.js"></script>
		<script src="../js/dataTable/pdfmake.min.js"></script>
		<script src="../js/dataTable/vfs_fonts.js"></script>
		<script src="../js/dataTable/buttons.html5.min.js"></script>
		<script src="../js/dataTable/buttons.print.min.js"></script>
		<%
       		if (sesiones1.size()>0){
       	%>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#tblDia1').DataTable({
			    	//dom: 'Bfrtip',
			    	//buttons: [
	                //    'copy', 'csv', 'excel', 'pdf', 'print'
	                //],
				    });
			} );
		</script>
		<% 
       		}
		if (sesiones2.size()>0){
		%>
		<script type="text/javascript">	
			$(document).ready(function() {
			    $('#tblDia2').DataTable({
			    	//dom: 'Bfrtip',
			    	//buttons: [
	                //    'copy', 'csv', 'excel', 'pdf', 'print'
	                //],
				    });
			} );
		</script>
		<% 
		}
		if (sesiones3.size()>0){
		%>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#tblDia3').DataTable({
			    	//dom: 'Bfrtip',
			    	//buttons: [
	                //    'copy', 'csv', 'excel', 'pdf', 'print'
	                //],
				    });
			} );
		</script>
		<% 
		}
		%>
    
</body>
<% 
	} catch(Exception e){
		e.printStackTrace();
		String mensaje="System Error, please contact chair.";
		response.sendRedirect("login.jsp?error="+ mensaje);
	}
%>
</html>