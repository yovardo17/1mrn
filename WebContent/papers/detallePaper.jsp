<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.SesionPonencia"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Coautor"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente"%>
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
	  <script src="https://kit.fontawesome.com/26dfac0a58.js" crossorigin="anonymous"></script>
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
  <jsp:useBean id="roomFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.RoomFacade" scope="page"></jsp:useBean>
  
  <% 
  		int id = Integer.parseInt(request.getParameter("id"));
  		Paper paper = paperFacade.getPaper(id);
  		
  		String observaciones = paper.getObservaciones();
  		if (observaciones == null) observaciones="";
  		
  		SesionPonencia sesion = roomFacade.getSesionPonencia(id);
  		
  		Locale locale = new Locale("en", "us");
  		DateFormat formato=new SimpleDateFormat("d ' ' MMMMM ' ' yyyy", locale );
  		DateFormat formatoHora=new SimpleDateFormat("HH:mm", locale );
  
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
		          style="font-size: 1.5em">Abstract</span><br><br></div>
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
					                <td class="panel-title">English title:</td>
					                <td>
					                	<textarea rows="2" cols="75" id="tituloEn" name="tituloEn" readonly="readonly" class="form-control"><%= paper.getTituloEn() %></textarea>
					                	<br>
					                </td>
					              </tr>
					              <tr>
					                <td class="panel-title">Spanish title:</td>
					                <td>
					                	<textarea rows="2" cols="75" id="tituloEs" name="tituloEs" readonly="readonly" class="form-control"><%= paper.getTituloEs() %></textarea>
					                	<br>
					                </td>
					              </tr>
					              <tr>
					                <td class="panel-title">English abstract:</td>
					                <td>
					                	<textarea rows="6" cols="75" id="resumenEn" name="resumenEn" readonly="readonly" class="form-control"><%= paper.getResumenEn()%></textarea>
					                	<br>
					                </td>
					              </tr>
					              <tr>
					                <td class="panel-title">Spanish abstract:</td>
					                <td>
					                	<textarea rows="6" cols="75" id="resumenEs" name="resumenEs" readonly="readonly" class="form-control"><%= paper.getResumenEs() %></textarea>
					                	<br>
					                </td>
					              </tr>
					              <tr>
					                <td class="panel-title">Topic:</td>
					                <td>
					                	<input type="text" id="topico" name="topico" value="<%= paper.getTopico().getNombreEn() %>" readonly="readonly" class="form-control"/>
					                	<br> 
					                </td>
					              </tr>
					              <tr>
					                <td class="panel-title">Presentation Type:</td>
					                <td>
					                	<input type="text" id="presentacion" name="presentacion" value="<%= paper.getTipoPresentacion().getNombre() %>" readonly="readonly" class="form-control"/>
					                </td>
					              </tr>
						<% 
								if (paper.getPonente()!=null){
																			
						%>              
					              <tr>
					                <td class="panel-title">Speaker:</td>
					                <td>
					                	<input type="text" id="speaker" name="speaker" value="<%= paper.getPonente() %>" readonly="readonly" class="form-control"/>
					                </td>
					              </tr>
					      <% 									
								}
					      		if (!observaciones.equals("")){
					      %>
					              <tr>
					                <td class="panel-title">Observations:</td>
					                <td>
					                	<textarea rows="6" cols="75" id="observaciones" name="observaciones" readonly="readonly" class="form-control"><%= observaciones %></textarea>
					                	<br>
					                </td>
					              </tr>
					      <% 
					      		}
					      %>
					           </tbody>
					           </table>
				            </div>
				    	</div>
				    	<br>
				    	<!--  <div class="card">
				            <div class="card-header">
				              <h3 class="card-title">Contact author</h3>
				            </div>
				            <div class="card-body">
				            	<table class="table">
						            <tbody>
						    <% 
						    	//for (Asistente autor: paper.getAutores()){
						    %>
						              <tr>
						                <td class="panel-title">Name:</td>
						                <td>
						                	<%//= autor.toString() %>
						                </td>
						              </tr>
						              <tr>
						                <td class="panel-title">Institution:</td>
						                <td>
						                	<%//= autor.getInstitucion() %>
						                </td>
						              </tr>
						              <tr>
						                <td class="panel-title">Email:</td>
						                <td>
						                	<%//= autor.getEmailsContacto() %>
						                </td>
						              </tr>
						              <tr>
						                <td class="panel-title">Telephone:</td>
						                <td>
						                	<%//= autor.getTelefono() %>
						                </td>
						              </tr>
						     <% 
						    	//}
						     %>
						        	</tbody>
						        </table>
				            </div>
				        </div>
				        <br>
				        -->
				    	<div class="card">
				            <div class="card-header">
				              <h3 class="card-title">Authors</h3>
				            </div>
				            <div class="card-body">
						        <table class="table">
						        <thead>
						        	<tr>					                	
					                	<td class="panel-title"><strong>Name</strong></td>					                	
					                	<td class="panel-title"><strong>Institution</strong></td>
					                	<td class="panel-title"><strong>Email</strong></td>
					              	</tr>
						        </thead>
					            <tbody>
					  <% 
					  		for(Asistente coautor: paper.getAutores()){
					  %>
					              	<tr>					                	
					                	<td><%= coautor.getNombre() + " " + coautor.getApellido()%></td>					                	
					                	<td><%= coautor.getInstitucion()%></td>
					                	<td><%= coautor.getEmail()%></td>
					              	</tr>
					   <% 
					  		}
					   %>
					           </tbody>
					           </table>
				            </div>
				    	</div>
				    	<br>
				    	<% 
				    		if (sesion!=null){
		    						String fecha = formato.format(sesion.getFecha());
		    						String horaini = formatoHora.format(sesion.getHoraInicio());
		    						String horafin = formatoHora.format(sesion.getHoraFin());
					      %>
					      					      				    	
				    	<br>
				    	
				    	<div class="card">
				            <div class="card-header">
				              <h3 class="card-title"><i class="fa-solid fa-person-chalkboard fa-2x" style="color: #FFAF12"></i> Presentation</h3>
				            </div>
				     	   <div class="card-body">
				     	   		<table class="table">
						        <thead>
						        	<tr>					                	
					                	<td class="panel-title"><strong>Room: </strong></td>					                	
					                	<td ><%= sesion.getRoom().getHostName() %></td>					                	
					              	</tr>
					              	<tr>					                	
					                	<td class="panel-title"><strong>Date: </strong></td>					                	
					                	<td ><%= fecha %></td>					                	
					              	</tr>
					              	<tr>					                	
					                	<td class="panel-title"><strong>Hour: </strong></td>					                	
					                	<td ><%= horaini + " - " + horafin %></td>					                	
					              	</tr>
						        </thead>
					            <tbody>
					            </tbody>
					            </table>
				     	   </div>
				       </div>
				       <% 
		    					}
				       %>
				    	
				    <% 
				    	if (asistente.getTipoAsistente().getId()==5) {
				    %>	
				    	<br>
				    	<div class="card bg-light mb-3">
				            <div class="card-header">
				              <h3 class="card-title">Abstract Review</h3>
				            </div>
				            <div class="card-body">
				            <form id="frmRevisar" name="frmRevisar" action="revisarPaper.jsp" method="post"> 
				            	<input type="hidden" id="titulo" name="titulo" value="<%= paper.getTituloEn() %>" />
								<div class="form-group">
								    <label for="id">Abstract Id: *</label>
								    <input type="text" id="id" name="id" readonly="readonly" class="form-control" value="<%= paper.getId() %>"/>
							  	</div>            	
				            	
				            	<div class="form-group">
								    <label for="tipoPresentacion">Presentation Type: *</label>
								    <select id="tipoPresentacion" name="tipoPresentacion" class="form-control" required="required">
				<% 
							for(TipoPresentacion tipo: paperFacade.cargarTipos()){
				%>		           		
						           		<option value="<%= tipo.getId()%>"><%= tipo.getNombre() %></option>
				<% 
							}
				%>		           		
						           	</select>
								  </div>
								  
								  <div class="form-group">
								    <label for="estado">Status: *</label>
								    <select id="estado" name="estado" class="form-control" required="required">
				<% 
							for(EstadoPaper estado: paperFacade.cargarestado()){
				%>		           		
						           		<option value="<%= estado.getId()%>"><%= estado.getNombre() %></option>
				<% 
							}
				%>		           		
						           	</select>
								  </div>
								  <div class="form-group">
								    <label for="resumen_en">Observations (Max 5000 Characters):</label>
								    <textarea id="observaciones" rows="5" name="observaciones"  placeholder="observations" 
								    	class="form-control" maxlength="5000"><%= observaciones %></textarea>
								  </div>
				            	  <div class="form-group" align="center">
						          	<button type="submit" class="boton resumen" style="width: min(80px, 25vw)"><span>Save</span></button>
						          	<a href="../bienvenida.jsp" class="boton resumen" style="width: min(80px, 25vw)">Cancel</a>
						          </div>	
				            	
				            </form>
				            <script type="text/javascript">
				
				            	frmRevisar.tipoPresentacion.value = <%= paper.getTipoPresentacion().getId()%>;				            	
								frmRevisar.estado.value = <%= paper.getEstadoPaper().getId() %>;
				            </script>
				            
				            </div>
				        </div>
				    <% 
				    	} else { 
				    	
				    %>
				    <br>
				    <div class="form-group" align="center">
						<a href="../bienvenida.jsp" class="boton resumen" style="width: min(120px, 25vw)"><span>Home</span></a>
					</div>
					<% 
				    	}
					%>
		    	 </div>     
			    </div>  
			 </div>
		</div>
	</section>
		
	<!-- FOOTER -->
    <jsp:include page="../banner/footer-app.jsp"></jsp:include>	
     	
	</body>
<% 
	}catch(Exception e){
		e.printStackTrace();
		String mensaje="System Error, please contact chair.";
		response.sendRedirect("../login.jsp?error="+ mensaje);
	}
%>
</html>