<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Coautor"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Topico"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>

<!DOCTYPE html>
<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
<jsp:useBean id="paper" class="co.edu.ufps.imrmtp.capaDatos.dto.Paper" scope="session"></jsp:useBean>
<jsp:useBean id="asistenteFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>

<% 
	try{
		Asistente asistenteSes = new Asistente();		
		asistenteSes = (Asistente)session.getAttribute("asistente");
		String titulo="";
		
		if (asistenteSes ==null) throw new Exception("No Session");
		
		
		int id = Integer.parseInt(request.getParameter("id"));
  		paper = facade.getPaper(id);
  		
  		Asistente asistente = new Asistente();
  		asistente = paper.getAutores().get(0);
  		
  		session.setAttribute("paper", paper);
  		
  		String speaker = "-1";
  		
  		if (paper.getPonente()==null) speaker="-1";
  		else{
  			if (paper.getPonente().equals("")) speaker="-1";
  			else speaker= paper.getPonente().trim();
  		}
  		
  		List<Asistente> asistentes = asistenteFacade.getAsistentes();
%>
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
		      <i class="fas fa-edit fa-4x" style="color:rgb(42, 146, 187)"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Edit abstract</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">
  
		    			<form id="frmRegistro" name="frmRegistro" action="guardarEditarPaper.jsp" method="post">
		    				<ul class="nav nav-tabs" id="myTab" role="tablist">
			                  <li class="nav-item">
			                    <a class="nav-link active" id="paper-tab" data-toggle="tab" href="#paper" role="tab" aria-controls="paper"
			                      aria-selected="true" ><span style="color: darkslategray; font-weight: bold">1. Abstract Information</span></a>
			                  </li>			                  
			                  <li class="nav-item">
			                    <a class="nav-link" id="coautor-tab" data-toggle="tab" href="#coautor" role="tab" aria-controls="coautor"
			                      aria-selected="false"><span style="color: darkslategray; font-weight: bold">2. Authors</span></a>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link" id="files-tab" data-toggle="tab" href="#files" role="tab" aria-controls="files"
			                      aria-selected="false"><span style="color: darkslategray; font-weight: bold">3. Submit Abstract</span></a>
			                  </li>
			                </ul>
			                
			                <div class="tab-content" id="myTabContent">
			                
	                  			<div class="tab-pane fade show active" id="paper" role="tabpanel" aria-labelledby="paper-tab">
	                  				<br>                  				
	                  				<!-- Informacion del articulo -->
                  				
                  					<div class="card bg-light mb-3">
						            	<div class="card-header">
						              		<h3 class="card-title">Please, insert the next information (* are requiered)</h3>
						            	</div>
						            	<div class="card-body">
										  <div class="form-group">
										    <label for="titulo_en">English Title: *</label>
										    <input type="text" id="titulo_en" name="titulo_en" required="required" placeholder="English title" 
										    	class="form-control" value="<%= paper.getTituloEn() %>"/>
										  </div>
										  <div class="form-group">
										    <label for="numeroDocumento">Spanish Title: *</label>
										    <input type="text" id="titulo_es" name="titulo_es" required="required" placeholder="Spanish title" 
										    	class="form-control" value="<%= paper.getTituloEs()%>"/>
										  </div>
										  <div class="form-group">
										    <label for="resumen_en">English Abstract (Beetween 500 and 5000 Characters): *</label>
										    <textarea id="resumen_en" rows="5" name="resumen_en" required="required" class="form-control" 
										    	maxlength="5000"><%= paper.getResumenEn() %></textarea>
										  </div>
										  <div class="form-group">
										    <label for="resumen_es">Spanish Abstract (Beetween 500 and 5000 Characters): *</label>
										    <textarea id="resumen_es" rows="5" name="resumen_es" required="required" class="form-control"
										    	maxlength="5000"><%= paper.getResumenEs() %></textarea>
										  </div>
										  <div class="form-group">
										    <label for="topico">Topic: *</label>
										    <select id="topico" name="topico" class="form-control" required="required">
										    	<option value="-1">Select a Topic</option>
						<% 
									for(Topico tp: facade.cargar()){
						%>		           		
								           		<option value="<%= tp.getId()%>"><%= tp.getNombreEn() %></option>
						<% 
									}
						%>		           		
								           	</select>
										  </div>
										  
										  <div class="form-group">
										    <label for="tipoPresentacion">Presentation Type: *</label>
										    <select id="tipoPresentacion" name="tipoPresentacion" class="form-control" required="required">
										    	<option value="-1">Select a Presentation Type:</option>
						<% 
									for(TipoPresentacion tipo: facade.cargarTipos()){
						%>		           		
								           		<option value="<%= tipo.getId()%>"><%= tipo.getNombre() %></option>
						<% 
									}
						%>		           		
								           	</select>
										  </div>
						          		</div>
						          	</div>   
						          	<br>
						          	<div class="form-group" align="center">										
										<a href="#" class="btn btn-lg btn-primary" onclick="siguienteSeccion(2)">Next</a>
										<a href="../bienvenida.jsp" class="btn btn-lg btn-primary">Cancel</a>
									</div>               					                  				                  			
                  				</div>
                  			
	                  			             			
                  				<div class="tab-pane fade" id="coautor" role="tabpanel" aria-labelledby="coautor-tab">
	                  				<br>                  				
	                  				<a name="autores"></a>
	                  				<div class="card bg-light mb-3">
							          	<div class="card-header">
							              <h3 class="card-title">Authors </h3>
							            </div>
							            <div class="card-body">
							            	<div class="card border-info">							            	  	
						            			<div class="card-header">
									              <h4 class="card-title">Search an Author</h4>
									            </div>	  		
						            	  		<div class="card-body">
						            	  			<div class="form-group">													    
													    <input type="search" list="asistentes"  onchange="asignarAutor()" id="search_autor" name="search_autor" class="form-control" placeholder="Please insert name or email" />
													    <datalist id="asistentes">
													    <% 
													    for(Asistente as: asistentes){
													    	
													    %>
														  <option value="<%= as.getId() + " - " + as.getNombre() + " " + as.getApellido() + " - " + as.getEmail() %>">
														<% } %>
														</datalist>
													</div>
												  </div>
											  </div>
											  <br>
											  <div class="card border-info">							            	  	
						            			<div class="card-header">
									              <h4 class="card-title">Add an Author</h4>
									              <h5>(* are requiered)</h5>
									            </div>	  		
						            	  		<div class="card-body">
											      <div id="divResultadoBusqueda">
											      	 <div class="alert alert-info" role="alert">
														First, click on add button to register as an author yourself.
													</div>
											      	 <div class="form-group">
													    <label for="nombre">Name: *</label>
													    <input type="text" id="nombre_coautor" name="nombre_coautor" class="form-control" placeholder="Name" value="<%= asistente.getNombre() %>"/>
													  </div>
													  <div class="form-group">
													    <label for="apellido">Last Name: *</label>
													    <input type="text" id="apellido_coautor" name="apellido_coautor" class="form-control" placeholder="Last Name" value="<%= asistente.getApellido() %>"/>
													  </div>						
													  <div class="form-group">
													   	<label for="email">Email: *</label>
													    <input type="email" class="form-control"  id="email" name="email" placeholder="Email" value="<%= asistente.getEmail() %>">
													  </div>					   
													  <div class="form-group">
													    <label for="institucion">Filial, Institution or Company: *</label>
													    <input type="text" id="institucion_coautor" name="institucion_coautor" placeholder="Institution or Company" class="form-control" value="<%= asistente.getInstitucion() %>"/>
													  </div>
													  <div class="form-group">
													    <label for="ciudad_coautor">City: *</label>
													    <input type="text" id="ciudad_coautor" name="ciudad_coautor" placeholder="City" class="form-control" value="<%= asistente.getCiudad() %>"/>
													  </div>
													  <div class="form-group">
													    <label for="pais_coautor">Country: *</label>
													    <input type="text" id="pais_coautor" name="pais_coautor" placeholder="Country" class="form-control" value="<%= asistente.getPais() %>"/>
													  </div>
												  </div>
												  <div class="form-group" align="center">
										          	<button type="button" class="btn btn-xs btn-primary" onclick="addAuthor()">Add</button>									          	
										          </div>		  
										       </div>
										    </div>
										</div>
									</div>   
									<br>               				
									<div class="card" id="divAutoresInc">
							            <div class="card-header">
							              <h3 class="card-title">Authors included</h3>
							            </div>
							            <div class="card-body">
							            	<div id="listaAutores" >
								            	<table class="table table-bordered">
								            		<thead>
								            			<tr>										            		
										            		<td><p class="lead"><strong>Name</strong></td>										            		
										            		<td><p class="lead"><strong>Filial, Institution or Company</strong> </td>
										            		<td><p class="lead"><strong>Email</strong> </td>
										            		<td><p class="lead"><strong>...</strong>
										            			<input type="hidden" id="numeroAutores" name="numeroAutores" value="<%= paper.getCoautores().size()%>"></input>
										            		</td>
								            			</tr>
								            		</thead>
								            		<tbody>
								        <% 
								        		for(Asistente a: paper.getAutores()){
								        %>
										            	<tr>										            		
										            		<td class="lead"><%= a.getNombre() + " " + a.getApellido() %></td>										            		
										            		<td><p class="lead"><%= a.getInstitucion() %></td>
										            		<td><p class="lead"><%= a.getEmail() %></td>
										            		<td><p class="lead"><a href="#" onclick="deleteAuthor('<%= a.getNombre() %>', '<%= a.getApellido() %>')"><img src="../imagenes/delete_16.png"></img></a></td>
										            	</tr>
										<% 
								        		}
								        		
								        		if(paper.getAutores().size()==0){
										%>
														<tr>
										            		<td class="lead" colspan="5">No authors included.</td>
										            	</tr>
										<% 
								        		}
										%>
										            </tbody>
								            </table>
							            <br>
								        	<div class="form-group">
											    <label for="speaker">Speaker: *</label>
											    <select id="speaker" name="speaker" class="form-control" required="required" onchange="validarPonentes()">
											    	<option value="-1">Select Speaker:</option>
											    	
											    <!--  	<option value="<%//= asistente.toString()%>"><%//= asistente.getNombre() + " "  + asistente.getApellido() %></option> -->
							<% 
										for(Asistente a: paper.getAutores()){
							%>		           		
									           		<option value="<%= a.toString()%>"><%= a.getNombre() + " "  + a.getApellido() %></option>
							<% 
										}
							%>		           		
									           	</select>
									           	<br>
									           	<div id="divPonentes">
									           		<input type="hidden" id="numero_ponentes" name="numero_ponentes" value="0"/>
									           	</div> 
											</div>
							            	</div>
							            </div>
							          </div>
							          <br>
							          <div class="form-group" align="center">										
										<a href="#" class="btn btn-lg btn-primary" onclick="siguienteSeccion(1)">Back</a>
										<a href="../bienvenida.jsp" class="btn btn-lg btn-primary">Cancel</a>
										<a href="#" class="btn btn-lg btn-primary" onclick="siguienteSeccion(3)">Next</a>
									  </div>																	          					          					          		                  			
                  				</div>
                  			
	                  			<div class="tab-pane fade" id="files" role="tabpanel" aria-labelledby="files-tab">
	                  				<br>
	                  				<div class="card">
							            <div class="card-header">
							              <h3 class="card-title">For save the changes in your abstract, please click in the button.</h3>
							            </div>
							            <div class="card-body">
									        <div class="form-group" align="center">
									        	<a href="#" class="btn btn-lg btn-primary" onclick="siguienteSeccion(2)">Back</a>
												<a href="../bienvenida.jsp" class="btn btn-lg btn-primary">Cancel</a>
												<button type="button" class="btn btn-lg btn-primary" onclick="enivarPaper()">Edit Abstract</button>
											</div>
										</div>
									</div>
	                  			</div>	                  			              			
                  			</div>	                  							
		    			</form>
		    			<script type="text/javascript">
							frmRegistro.topico.value= "<%= paper.getTopico().getId() %>";
							frmRegistro.tipoPresentacion.value= "<%= paper.getTipoPresentacion().getId() %>";
							frmRegistro.speaker.value= "<%= speaker %>";
		          		</script>
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
	}
%>
