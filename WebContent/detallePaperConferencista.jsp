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

<!DOCTYPE html>
<html lang="es">
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
  <!-- boton style-->
  <link href="css/estilos.css" rel="stylesheet"> 
  <link href="css/resumen.css" rel="stylesheet">
  <!--/boton style-->
</head>
<%   
	//try{				
%>
  <body>
  <jsp:useBean id="paperFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
  <jsp:useBean id="roomFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.RoomFacade" scope="page"></jsp:useBean>
  
  
  <% 
  		int id = Integer.parseInt(request.getParameter("id"));
  		Paper paper = paperFacade.getPaper(id);  		
  		
  		SesionPonencia sesion = roomFacade.getSesionPonencia(id);
  		
  		Locale locale = new Locale("en", "us");
  		DateFormat formato=new SimpleDateFormat("d ' ' MMMMM ' ' yyyy", locale );
  		DateFormat formatoHora=new SimpleDateFormat("HH:mm", locale );
  		
  		  
  %>
    
	<header>
     <nav class="navbar navbar-expand-lg navbar-dark sticky-top"
      style="background-color:rgba(52,52,52,0.9); width:100%; position: fixed;">
      <div class="container-fluid">
        <a class="navbar-brand" href="index.html" onClick="window.open('index.html', '_self')"><img id="" src="imagenes/home.png" style="text-align: center; width: min(55px, 20vw); position: absolute; margin: 5px; padding: 5px"></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto d-flex justify-content-end" style="width: 100%;">
            <li class="nav-item" style="text-align: center">
              <a class="nav-link" href="#dos" onClick="window.open('index.html#dos', '_self')">Important Dates</a>
            </li>
            <li class="nav-item" style="text-align: center">
              <a class="nav-link" href="#tres" onClick="window.open('index.html#tres', '_self')">Register</a>
            </li>
            <li class="nav-item" style="text-align: center">
              <a class="nav-link" href="topics.jsp"
                onClick="window.open('topics.jsp', '_self')">Topics</a>
            </li>
            <li class="nav-item" style="text-align: center;">
              <a class="nav-link" href="invited.html" onClick="window.open('invited.html', '_self')">Invited</a>
            </li>            
            <li class="nav-item" style="text-align: center;">
              <a class="nav-link" href="committees.html"
                onClick="window.open('committees.html', '_self')">Committees</a>
            </li>
            <li class="nav-item" style="text-align: center;">
              <a class="nav-link" href="publication.html"
                onClick="window.open('publication.html', '_self')">Publication</a>
            </li>
            <li class="nav-item" style="text-align: center;">
              <a class="nav-link" href="presentation.html"
                onClick="window.open('presentation.html', '_self')">Presentations</a>
            </li>
            <!-- Dropdown -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">Download</a>
              <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="archivos/poster.pdf" target="_blank" onClick="window.open('archivos/poster.pdf', '_blank')">Poster</a>
                <a class="dropdown-item" href="archivos/banner.png" target="_blank" onClick="window.open('archivos/banner.png', '_blank')">Banner</a>
                <a class="dropdown-item" href="programme.html" target="_blank" onClick="window.open('programme.html', '_blank')">Programme</a>
                <a class="dropdown-item" href="abstractBook.jsp" target="_blank" onClick="window.open('abstractBook.jsp', '_blank')">Abstracts book</a>                
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>

  </header>
  <!--Main Navigation-->



  <section id="uno" class="container-fluid" style="padding: 0px; height: 33vh;  ">

    <!--Carousel Wrapper-->
    <div id="carousel-example-2" class="carousel slide carousel-fade m-0" data-ride="carousel" style="height: 30vh;" >

      <!--Indicators-->
      <!-- <ol class="carousel-indicators">
        <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-2" data-slide-to="1"></li>
        <li data-target="#carousel-example-2" data-slide-to="2"></li>
        </ol>  -->


      <div id="cicoMasTitulo" class="container-fluid row p-0 m-0" style="position:absolute; z-index: 2; ">
        <div id="cincoMasUno " class="col-12   p-0 m-0" style="position:relative; height: 30vh;" >


           <img id="masuno" class="carrucel_masuno pt-5 img-fluid" src="imagenes/mrn.png" alt=""  style="position: absolute; height: 30vh; left: 80px;">
           <img id="fotoAnimez" class="carrucel_noticias pt-5 img-fluid" src="imagenes/1st.png" alt=""
           style="position: absolute; height: 30vh;">
        </div>
        <div id="tituloCincoMasUno" class="row col-12 col-sm-12 col-md-12 p-0 m-0"
          style="background-image:url(imagenes/sombraH.png); background-size:auto; background-repeat:repeat-x; background-blend-mode:overlay; background-position-y: bottom; height: 30vh; ">
          <div class="col-6 col-sm-6 col-md-7 col-lg-8 col-xl-8" ></div>
          <div class="text-center pt-5 m-0 col-6 col-sm-4 col-md-4 col-lg-3 col-xl-3" style="top: 30px;">
            <img id="" class="animated wow pulse img-fluid" src="imagenes/1stMRN.png">
          </div>
        </div>


      </div>

      <!--/.Indicators-->
      <!--Slides-->
      <div id="coloresCarousel" class="carousel-inner" role="listbox" style="height: 30vh;" >
        <div class="carousel-item active">
          <div class="view"
            style="background-color:#4DC4A4; background-image: url(imagenes/texturamrn.png); background-blend-mode:overlay; ">
            <!-- <img  class="d-block" src="imagenes/fondo1.png" alt="First slide" style="height: 60vh;"> -->
          </div>
        </div>
        <div class="carousel-item">
          <!--Mask color-->
          <div class="view"
            style="background-color: #D13A3F; background-image: url(imagenes/texturamrn.png); background-blend-mode:overlay">
            <!-- <img class="d-block" src="imagenes/fondo2.png" alt="Second slide" style="height: 60vh">  -->
          </div>
        </div>
        <div class="carousel-item"
          style="background-color: #FFAF12; background-image: url(imagenes/texturamrn.png); background-blend-mode:overlay; ">
          <!--Mask color-->
          <div class="view">
            <!-- <img class="d-block" src="imagenes/fondo3.png" alt="Third slide" style="height: 60vh">  -->
          </div>
        </div>
      </div>
      <!--/.Slides-->
      <!--Controls-->
      <!-- <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true" style="height: 50px; width: 50px"></span>
        <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true" style="height: 50px; width: 50px"></span>
        <span class="sr-only">Next</span>
        </a> -->
      <!--/.Controls-->
    </div>
    <!--/.Carousel Wrapper-->


    <div id="coloresLinea" class="container-fluid row p-0 m-0"
      style="background-color:#019EB8; background-image: url(imagenes/coloresLinea.gif); background-size:50%; background-position-x: right; background-position-y: bottom; background-repeat:repeat-y; height:3vh;">
    </div>

    <div class="col-12 row p-0 m-0"
    style="height:3vh; background-color:#019EB8; background-image: url(imagenes/coloresLinea.gif); background-size:50%; background-position-x: right; background-position-y: bottom; background-repeat:repeat-y;">
  </div>
  </section>

  <section id="tres" class="container-fluid row p-0 m-0" style="background-image: url(imagenes/texturamrn1.png); background-blend-mode:overlay; background-repeat: round; width: auto">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>
		
		
		    <div class="col-12 row p-0 m-1" style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
		      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12; border-top-left-radius: 35px;">
		      <i class="fa-solid fa-file-circle-plus fa-4x" style="color:#0F4C83"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Abstract</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">
  
		    			<% 
				     	   	if (paper!=null){
				     	%>
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
					      %>		
					           </tbody>
					           </table>
					      
				            </div>
				            </div>
				            <br>
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
				    	<% 
				     	   		} else {
					      %>
					      		<div class="card">
						            <div class="card-header">
						              <h3 class="card-title">Abstract information</h3>
						            </div>
						     	   <div class="card-body">
						     	   <br>
							      		<div class="alert alert-danger" role="alert">The abstract ID: <%= id %> does not exist.</div>
							       <br>
							      </div>
							   </div>
					      <% 
				     	   		}
		    					if (sesion!=null){
		    						String fecha = formato.format(sesion.getFecha());
		    						String horaini = formatoHora.format(sesion.getHoraInicio());
		    						String horafin = formatoHora.format(sesion.getHoraFin());
					      %>
					      					      				    	
				    	<br>
				    	
				    	<div class="card">
				            <div class="card-header">
				              <h3 class="card-title"><i class="fa-solid fa-file-powerpoint fa-2x" style="color: #FFAF12"></i> Presentation</h3>
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
				    					    
				    <br>
				    <br>
				    <div class="form-group" align="center">
						<a href="index.html" class="boton resumen"><span><strong>Home</strong></span></a>
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
     	
	</body>
<% 
	/*}catch(Exception e){
		e.printStackTrace();
		String mensaje="System Error, please contact chair.";
		response.sendRedirect("../login.jsp?error="+ mensaje);
	}*/
%>
</html>