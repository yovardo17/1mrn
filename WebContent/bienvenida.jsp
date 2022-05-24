<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Topico"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Room"%>
  
<%@page import="java.util.List"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>

<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
<jsp:useBean id="facadeAsistente" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>
<jsp:useBean id="facadeRoom" class="co.edu.ufps.imrmtp.capaNegocio.facade.RoomFacade" scope="page"></jsp:useBean>
<% 		
	try{		
	Asistente asistente = new Asistente();		
	asistente= (Asistente)session.getAttribute("asistente");
	String titulo="";
	String idAbstract="";
	int idPaper=0;
	int idEstado=0;
	int idTopico=0;
	int idTipo=0;	
	
	Paper paper = (Paper) session.getAttribute("paper");
	
	if (asistente==null) {
		titulo="Please login.";
		response.sendRedirect("login.jsp?error=" + titulo);
	}
	
	int inscritosCurso1 = facadeAsistente.inscritosCurso(1);
	int inscritosCurso2 = facadeAsistente.inscritosCurso(2);
	int inscritosCurso3 = facadeAsistente.inscritosCurso(3);
	int idCursoAsistido = facadeAsistente.getCursoAsistido(asistente.getId());
	
	List<Paper> papers = new ArrayList<Paper>();
	
	List<Room> rooms = facadeRoom.cargarSalas();
	
	String filtro = request.getParameter("filtro");
	if (filtro==null) filtro="";
	
	if (filtro.equals("yes")){
		String numero = request.getParameter("id");
		if (numero==null) numero="0";
		if (numero.equals("")) numero="0";
		idPaper = Integer.parseInt(numero);
		
		numero = request.getParameter("estado");
		if (numero==null) numero="0";
		if (numero.equals("")) numero="0";
		idEstado = Integer.parseInt(numero);
		
		numero = request.getParameter("topico");
		if (numero==null) numero="0";
		if (numero.equals("")) numero="0";
		idTopico = Integer.parseInt(numero);
		
		numero = request.getParameter("tipoPresentacion");
		if (numero==null) numero="0";
		if (numero.equals("")) numero="0";
		idTipo = Integer.parseInt(numero);
		
		papers = new ArrayList<Paper>();		
		papers = facade.getPapers(idPaper, idEstado, idTopico, idTipo);
		
		session.setAttribute("filtro", filtro);
		session.setAttribute("id_paper", "" + idPaper);
		session.setAttribute("idEstado", "" + idEstado);
		session.setAttribute("idTopico", "" + idTopico);
		session.setAttribute("idTipo", "" + idTipo);
		
	} else papers = facade.getPapers(asistente);	
	
	if(idPaper==0) idAbstract="";
	else idAbstract = "" + idPaper;
	
	if (asistente.getTipoAsistente().getId()==5) titulo= "Submissions";
	else titulo ="My research works";
	 
	int numeroPonencias = facade.numeroPonencias(asistente);
	
	paper=new Paper();
	paper.setAutores(new ArrayList<Asistente>());
	session.setAttribute("paper", paper);
%>
<!DOCTYPE html>
<html lang="en">

	<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="author" content="foristom">
  <meta name="description"
    content="5+1  6IMRMPT - International Meeting for Researchers in Materials and Plasma Technology">
  <title>1st MRN</title>
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
  <script src="https://kit.fontawesome.com/26dfac0a58.js" crossorigin="anonymous"></script>
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
  
  <link href="css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
  <script src="js/general.js"></script>	
  <!-- boton style-->
  <link href="css/estilos.css" rel="stylesheet">
  <link href="css/resumen.css" rel="stylesheet">
  <!--/boton style-->

</head>

	<body>
		<jsp:include page="banner/header-app.jsp"></jsp:include>
				
        <section id="tres" class="container-fluid row p-0 m-0" style="background-image: url(imagenes/texturamrn2.png); background-blend-mode:overlay; background-repeat: round; width: auto">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-sm-1 col-lg-2 p-0 m-0">
    </div>


    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12; border-top-left-radius: 35px;">
      <i class="fas fa-journal-whills fa-4x" style="color:#0F4C83"></i></div>
      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
          style="font-size: 1.5em">Abstracts</span><br><br></div>
      <a name="Register"></a>
      <div class="p-0 p-sm-2 p-md-5" >
				
        <div class="row p-0 mt-5">
          <div class=" borde-tabla2 fonto-tabla">
							<% 
							if (asistente.getEstadoAsistente().getId()==2) {
								
								
							%>
							<br>	
								<!--
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Meeting Rooms: </h3>
								</div>
								<div class="card-body">
								
									
									<div class="row">
													
								<% 
									for (Room rm: rooms){
								%>
									<div class="card col-lg-3 col-sm-6 col-md-3 hover-shadow rounded" 
									     onClick="window.open('rooms/detalleRoom.jsp?id=<%= rm.getId() %>', '_self')"
									     style="">
										<div class="card-body">
											<a href="rooms/detalleRoom.jsp?id=<%= rm.getId() %>" 
											style="color: darkslategray; font-weight: bold">
												<img class="img-fluid" src="<%= rm.getImagen() %>" width="64" height="64"/>&nbsp; &nbsp;<%= "  " + rm.getHostName() %> 
											</a>
										</div>
									</div>																											
									
								<% 
									}
								%>
									</div>									
									
								</div>	
							</div>						
							-->
							<br>						
							<% 									
								}
							%>
							
							<% 
							if (asistente.getTipoAsistente().getId()==5) {
							%>	
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Filters</h3>
								</div>
								<div class="card-body">
									<form id="frmFiltrar" name="frmFiltrar" method="post" action="bienvenida.jsp">
										<input type="hidden" id="filtro" name="filtro" class="form-control" value="<%= filtro %>"> 
										<div class="form-group">
											<label for="id">Abstract Id:</label>
											<input type="text" id="id" name="id" class="form-control" value="<%= idPaper %>">
										</div>            	
										<div class="form-group">
											<label for="topico">Topic: *</label>
											<select id="topico" name="topico" class="form-control">
												<option value="0">Select a topic</option>
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
											<label for="tipoPresentacion">Presentation Type:</label>
											<select id="tipoPresentacion" name="tipoPresentacion" class="form-control">
												<option value="0">Select a Presentation Type</option>
									<% 
									for(TipoPresentacion tipo: facade.cargarTipos()){
									%>		           		
												<option value="<%= tipo.getId()%>"><%= tipo.getNombre() %></option>
									<% 
									}
									%>		           		
											</select>
										</div>
							
										<div class="form-group">
											<label for="estado">Status:</label>
											<select id="estado" name="estado" class="form-control">
												<option value="0">Select a status</option>
									<% 
									for(EstadoPaper estado: facade.cargarestado()){
									%>		           		
												<option value="<%= estado.getId()%>"><%= estado.getNombre() %></option>
									<% 
									}
									%>		           		
											</select>
											</div>
							
										<div class="form-group">
											<button type="button" class="boton resumen" onclick="filtrarPapers()"><span>Search</span></button>
											<button type="button" class="boton resumen" onclick="borrarFiltros()"><span>Clear</span></button>
										</div>	
							
									</form>
								</div>							
							</div>
							<script type="text/javascript">
								frmFiltrar.topico.value= "<%= idTopico%>";
								frmFiltrar.tipoPresentacion.value= "<%= idTipo%>";
								frmFiltrar.topico.value= "<%= idTopico%>";
								frmFiltrar.estado.value= "<%= idEstado%>";
							</script>
							<br>
							<% 
							}
							%>
							
							<div class="card">
								<div class="card-header">
									<h3 class="card-title"><%= titulo %></h3>
								</div>
								<div class="card-body">
									<a name="papers"></a>
									<!-- 
									<div class="alert alert-info" role="alert">
										The submission of abstracts have been closed.
									</div> 
									-->  
									<% 
										if ((papers.size()<=5 && numeroPonencias<2)||((asistente.getTipoAsistente().getId()==5))) {
									%>  
									<div class="form-group" align="center">
										<div class="pull-right"><a href="papers/registrarPaper.jsp" class="boton resumen"><span>Submit Abstract</span></a></div>
									</div>
									
									<br>
									<% 
										} else {
											if (papers.size()>5) {
									%>
									  		 
									<div class="alert alert-info" role="alert">
										You can only submit five abstracts. 
									</div>
									
									<% 
											}
											if (numeroPonencias>=2) {
									%>
												  		 
												<div class="alert alert-info" role="alert">
													You can only submit two abstracts as speaker. 
												</div>
									
									<% 
											}
										}
									%>
									<br>
									<div id="divResultados">
										<div class="form-group">
											<label for="cantidad">Number of Abstracts submitted: </label>
											<input type="text" id="cantidad" name="cantidad" class="form-control" readonly="readonly" value="<%= papers.size() %>">
										</div>
										<div class="form-group">
											<label for="cantidad_speaker">Number of Abstracts as speaker (Max. 2): </label>
											<input type="text" id="cantidad_speaker" name="cantidad_speaker" class="form-control" readonly="readonly" value="<%= numeroPonencias %>">
										</div>
										<div class="table-responsive">										
										<table class="table" id="tabla_abstracts">
											<thead>
												<tr>
													<td><strong>Id</strong></td>
													<td><strong>Title</strong></td>
													<td><strong>Reg. Date</strong></td>
													<td><strong>Topic</strong></td>
													<td><strong>Status</strong></td>
													<td>...</td>
												</tr>
											</thead>
											<tbody>
										<% 
										
										for(Paper p: papers){
										
											String tituloEn = p.getTituloEn();
											String topicoEn = p.getTopico().getNombreEn();
											if (tituloEn.length()>60) tituloEn = tituloEn.subSequence(0, 59) + "...";
											if (topicoEn.length()>60) topicoEn = topicoEn.subSequence(0, 59) + "...";
										%>
												<tr>
													<td><%= p.getId() %></td>
													<td><%= tituloEn %></td>
													<td><%= p.getFechaRegistro() %></td>
													<td><%= topicoEn %></td>
													<td><%= p.getEstadoPaper().getNombre() %></td>
													<td>
														<a href="papers/detallePaper.jsp?id=<%= p.getId()%>" title="See details"><img src="imagenes/ver_detalles_16.png"></img></a>
												<% 
												if((p.getEstadoPaper().getId()==1)||(p.getEstadoPaper().getId()==4)){
												%>			
													&nbsp;<a href="papers/editarPaper.jsp?id=<%= p.getId()%>" title="Edit Abstract"><img src="imagenes/edit_16.png"></img></a>
												<% 
												}
												if((p.getEstadoPaper().getId()==1)||(p.getEstadoPaper().getId()==4)){
												%>			
													&nbsp;<a href="papers/borrarPaper.jsp?id=<%= p.getId()%>" title="Delete Abstract"><img src="imagenes/delete_16.png"></img></a>
												<% 
												}
												%>
												<% 
												if(p.getEstadoPaper().getId()==2){
												%>
													&nbsp;<a href="papers/cartaAceptacion.jsp?id=<%= p.getId()%>" title="Acceptance letter" target="_blank"><img src="imagenes/aceptation_16.png"></img></a>
												<% 
												}
												%>
												<% 
												if(p.getEstadoPaper().getId()==5){
												%>
													&nbsp;<a href="papers/certificadoPresentacion.jsp?id=<%= p.getId()%>" title="Certificate of Presentation" target="_blank"><img src="imagenes/certificado-participacion-16.jpeg" height="22" width="22"></img></a>
													&nbsp;<a href="papers/certificadoPonente.jsp?id=<%= p.getId()%>" title="Certificate of Speaker" target="_blank"><img src="imagenes/diploma-certificate-16.jpg" height="22" width="22"></img></a>
												<% 
												}
												%>
													</td>
												</tr>
										<% 
										}
										
										if(papers.size()==0){
										%>
												<tr>
													<td></td>
													<td class="lead" colspan="5">No abstracts submitted</td>													
													
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
							<% 
															
							%>
							<div class="form-group" align="center">
								<button type="button" class="boton resumen m-md-2" onClick="window.open('archivos/presentation-template.pptx', '_blank')"><span> presentation template</span></button>&nbsp;&nbsp;
								<button type="button" class="boton resumen m-md-2" onClick="window.open('programme.html', '_blank')"><span>Programme</span></button>
								<button type="button" class="boton resumen m-md-2" onClick="window.open('archivos/Abstrac_Book.pdf', '_blank')"><span>Abstracts Book</span></button>
							</div>						
						 </div>     
		    </div>  
		 </div>
		<div class="col-12 row p-0 m-0"
        style="height:3vh; background-color:#019EB8; background-image: url(imagenes/coloresLinea.gif); background-size:50%; background-position-x: right; background-position-y: bottom; background-repeat:repeat-y;border-bottom-left-radius: 15px;  border-bottom-right-radius: 15px">
      </div>
	</div>
</section>                
        
		<!-- FOOTER -->
        <jsp:include page="banner/footer.jsp"></jsp:include>        
		<script src="js/dataTable/jquery.dataTables.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#tabla_abstracts').DataTable({
		    		"lengthMenu": [[50,100, -1], [50,100, "All"]],
			    	"pageLength": 50
			    });
			} );
		</script>
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