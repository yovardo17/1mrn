<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Coautor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Topico"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoPresentacion"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.EstadoPaper"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Paper"%>
<%@page import="java.util.List"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>

<jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>

<% 		
	try{		
		List<Paper> papers = facade.getAbstractBook();				
%>
<!DOCTYPE html>
<!-- saved from url=(0039)http://getbootstrap.com/examples/theme/ -->
<html lang="en">
	<head>
      <meta charset="ISO-8859-1">	    
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta http-equiv="x-ua-compatible" content="ie=edge">
	  <meta name="author" content="foristom">
	  <meta name="description"
	    content="5+1  IMRMPT - International Meeting for Researchers in Materials and Plasma Technology">
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
	  
	  <link href="css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
	  <link href="css/dataTable/buttons.dataTables.min.css" rel="stylesheet">
	    
	  <!-- Bootstrap core CSS -->
	  <link href="css/bootstrap.min.css" rel="stylesheet">
	  <!-- Material Design Bootstrap -->
	  <link href="css/mdb.min.css" rel="stylesheet">
	  <!-- Your custom styles (optional) -->
	  <link href="css/style.css" rel="stylesheet">
	  
	  <script src="js/general.js"></script>
  </head>
  <body>
  	
    <jsp:include page="banner/header.jsp"></jsp:include>
  	
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

</head>

<style>
  #uno {
    height: auto;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
  }

  #dos {
    
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
  }

  #tres {
    
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
  }

  #cuatro {
    
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
  }

  .wow {
    visibility: hidden;
  }

  .rgba-black-strong {
    background-color: rgba(20, 20, 20, 0.9);
  }


  .grey-text {
    font-size: 13px
  }

  .nav-link {
    color: aliceblue !important;
    font-size: 16px;
  }

  .embed-responsive-pdf-carta::before {
    padding-top: 140%;
  }
  
   .table-striped tbody tr:nth-of-type(odd) {
  background-color: rgba(189, 255, 248, 0.427);
  
}
  .table-hover tbody tr:hover {
  	background-color: rgba(249, 252, 251, 0.5);
  }

  #fotoAnimez,
  #masuno {
    -webkit-animation-duration: 5s;
    -webkit-animation-delay: 2s;
    -webkit-animation-iteration-count: infinite;
    -moz-animation-duration: 5s;
    -moz-animation-delay: 2s;
    -moz-animation-iteration-count: infinite;
    -o-animation-duration: 5s;
    -o-animation-delay: 2s;
    -o-animation-iteration-count: infinite;
    animation-duration: 5s;
    animation-delay: 2s;
    animation-iteration-count: infinite;
  }

  .carrucel_noticias {
    animation: animacion_noticias ease 31s;
    animation-iteration-count: infinite;
    transform-origin: 50% 50%;
    -webkit-animation: animacion_noticias ease 5000s;
    -webkit-animation-iteration-count: infinite;
    -webkit-transform-origin: 50% 50%;
    -moz-animation: animacion_noticias ease 30s;
    -moz-animation-iteration-count: infinite;
    -moz-transform-origin: 50% 50%;
    -o-animation: animacion_noticias ease 30s;
    -o-animation-iteration-count: infinite;
    -o-transform-origin: 50% 50%;
    -ms-animation: animacion_noticias ease 30s;
    -ms-animation-iteration-count: infinite;
    -ms-transform-origin: 50% 50%;
  }

  @keyframes animacion_noticias {
    0% {
      transform: translate(0px, 0px);
    }

    50% {
      transform: translate(10px, 0px);
    }

    100% {
      transform: translate(0px, 0px);
    }
  }

  @-moz-keyframes animacion_noticias {
    0% {
      -moz-transform: translate(0px, 0px);
    }

    50% {
      -moz-transform: translate(10px, 0px);
    }

    100% {
      -moz-transform: translate(0px, 0px);
    }
  }

  @-webkit-keyframes animacion_noticias {
    0% {
      -webkit-transform: translate(0px, 0px);
    }

    50% {
      -webkit-transform: translate(10px, 0px);
    }

    100% {
      -webkit-transform: translate(0px, 0px);
    }
  }

  @-o-keyframes animacion_noticias {
    0% {
      -o-transform: translate(0px, 0px);
    }

    50% {
      -o-transform: translate(10px, 0px);
    }

    100% {
      -o-transform: translate(0px, 0px);
    }
  }

  @-ms-keyframes animacion_noticias {
    0% {
      -ms-transform: translate(0px, 0px);
    }

    50% {
      -ms-transform: translate(10px, 0px);
    }

    100% {
      -ms-transform: translate(0px, 0px);
    }
  }
    .carrucel_masuno {
    animation: animacion_masuno ease 31s;
    animation-iteration-count: infinite;
    transform-origin: 50% 50%;
    -webkit-animation: animacion_masuno ease 5000s;
    -webkit-animation-iteration-count: infinite;
    -webkit-transform-origin: 50% 50%;
    -moz-animation: animacion_masuno ease 30s;
    -moz-animation-iteration-count: infinite;
    -moz-transform-origin: 50% 50%;
    -o-animation: aanimacion_masuno ease 30s;
    -o-animation-iteration-count: infinite;
    -o-transform-origin: 50% 50%;
    -ms-animation: animacion_masuno ease 30s;
    -ms-animation-iteration-count: infinite;
    -ms-transform-origin: 50% 50%;
  }

  @keyframes animacion_masuno {
    0% {
      transform: translate(0px, 0px);
    }

    50% {
      transform: translate(-10px, 0px);
    }

    100% {
      transform: translate(0px, 0px);
    }
  }

  @-moz-keyframes animacion_masuno {
    0% {
      -moz-transform: translate(0px, 0px);
    }

    50% {
      -moz-transform: translate(-10px, 0px);
    }

    100% {
      -moz-transform: translate(0px, 0px);
    }
  }

  @-webkit-keyframes animacion_masuno {
    0% {
      -webkit-transform: translate(0px, 0px);
    }

    50% {
      -webkit-transform: translate(-10px, 0px);
    }

    100% {
      -webkit-transform: translate(0px, 0px);
    }
  }

  @-o-keyframes animacion_masuno {
    0% {
      -o-transform: translate(0px, 0px);
    }

    50% {
      -o-transform: translate(-10px, 0px);
    }

    100% {
      -o-transform: translate(0px, 0px);
    }
  }

  @-ms-keyframes animacion_masuno{
    0% {
      -ms-transform: translate(0px, 0px);
    }

    50% {
      -ms-transform: translate(-10px, 0px);
    }

    100% {
      -ms-transform: translate(0px, 0px);
    }

  }

  /* .carousel-fade .carousel-item {
  opacity: 0;
  -webkit-transition-duration: 4s;
  -o-transition-duration: 4s;
  transition-duration: 4s;
  -webkit-transition-property: fade-out;
  -o-transition-property: fade-out;
  transition-property: fade-out; } */
</style>


<body>

  <!--Main Navigation-->
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
              <a class="nav-link" style="color:darkblue" href="topics.jsp"
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
				
		    <div class="col-8 row p-0 m-1" style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
			      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12; border-top-left-radius: 35px;">
			      <i class="fas fa-book fa-4x" style="color:#0F4C83"></i></div>
			      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; "><br><br><span
			          style="font-size: 1.5em">Abstracts Book</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5">		    
    		        	        		
        		<div class="card">
		            <div class="card-header">
		              <h3 class="card-title">Information</h3>
		            </div>
		            <div class="card-body">
		            	<p><Strong>Ely Dannier V. Ni&ntilde;o</Strong><br>
		            		Director IMRMPT</p>
		            	
		            	<p><Strong>Ely Dannier V. Ni&ntilde;o</Strong><br>
		            		Editor and Layout Coordinator</p>
		            	
		            	<p><Strong>Germ&aacute;n Qui&ntilde;onez</Strong><br>
		            		Cover Design</p>
		            		
		            	<p><Strong>Germ&aacute;n Qui&ntilde;onez</Strong><br>
		            		Web Design</p>
		            	
		            	<p><Strong>Fredy Humberto Vera-Rivera</Strong><br>
		            		Web Programming</p>		            	
		            </div>
		        </div>
        	<br>        	        					 	        
				  <div class="card">
		            <div class="card-header">
		              <h3 class="card-title">ISSN (En L&iacute;nea): 2422-3824</h3>		              
		            </div>
		            <div class="card-body">
			            <a name="papers"></a>
			            <a href="archivos/Abstrac_Book.pdf" target="_blank" title="PDF Download">
			            <!--<a href="#" target="_blank" title="PDF Download">-->
	   						<img alt="Download" src="imagenes/pdf.jpg" height="25" width="25" > - PDF Download
	   					</a>
	   					<bR>
	   					<br>
			            <div id="divResultados">		            			            
			            	<table id="tblAbstractBook" class="table">	
			            		<thead>
				            		<tr>
				            			<th>
				            				Abstracts 
				            			</th>			            			
				            		</tr>
				            	</thead>	            		
			            		<tbody>
			        <% 
			        		
			        	for(Paper p: papers){
			        				        		
			        %>
					            	<tr>
					            		<td>
					            			<table>
					            				<tr>
					            					<td style="text-align : justify;">
					            					<strong><%= p.getTituloEn().toUpperCase() %></strong>				            									            					
					            					</td>
					            				<tr>
					            			<!-- 
					            				<tr>
					            					<td style="text-align : justify;">
					            					<strong><%= p.getTituloEs().toUpperCase() %></strong>				            									            					
					            					</td>
					            				<tr>
					            			 -->
					            				<tr>
					            					<td style="text-align : justify;">
					            					  <%  	
					            					  		String nombres= "";
					            					  		String afiliaciones = "";
					            					  		String email="";
					            					  		int i=1;
					            					  		for(Asistente autor: p.getAutores()){
					            					  			nombres += autor.getApellido().toUpperCase() + " " + autor.getNombre().toUpperCase() +  " <sup>" + i +"</sup>, ";
					            					  			afiliaciones += " <sup>" + i +"</sup> " + autor.getInstitucion() + ", ";
					            					  			email = autor.getEmail();
					            					  			i++;
					            					  		}
					            					  		for(Coautor coautor: p.getCoautores()){
					            					  			nombres += coautor.getApellido().toUpperCase() + " " + coautor.getNombre().toUpperCase() +  " <sup>" + i +"</sup>, ";
					            					  			afiliaciones += " <sup>" + i +"</sup> " + coautor.getInstitucion() + ", ";
					            					  			i++;
					            					  		}
					            					  %>
					            					  <strong><%= nombres %></strong><br>
					            					  <%= afiliaciones %> <br> 				            					  
					            					</td>
					            				<tr>
					            				<tr>
					            					<td>
					            					Email: <%= email %>
					            					<br>
					            					</td>
					            				<tr>
					            				<tr>
					            					<td style="text-align : justify;">
					            					<strong>Abstract:</strong>  <%= p.getResumenEn()%>
					            					<br>
					            					<br>
					            					</td>
					            				<tr>					            				
											<!--  					            			
													<tr>
					            					<td style="text-align : justify;">
					            					<strong>Resumen:</strong>  <%= p.getResumenEs()%>
					            					<br>
					            					<br>
					            					</td>
					            				<tr>					            				
											-->
					            				<tr>
					            					<td>
					            					<strong>Topic:</strong> <%= p.getTopico().getNombreEn() %><Br>					            					
					            					</td>
					            				<tr>				            								            			
					            			</table>
					            		</td>
					            	</tr>				            		
					<% 
			        		} // for 
			        		
			        		if(papers.size()==0){
					%>
									<tr>
					            		<td class="lead">No abstracts found</td>
					            	</tr>
					<% 
			        		}
					%>
					            </tbody>
			            </table>		            
						</div> <!-- div resultados -->
		            </div> <!-- div card body -->
		          
		          </div> <!-- div card -->
		          		          	            		         
		    	</div> <!-- div p-0 p-sm-2 p-md-5 -->
				<div class="col-12 row p-0 m-0"
        style="height:3vh; background-color:#019EB8; background-image: url(imagenes/coloresLinea.gif); background-size:50%; background-position-x: right; background-position-y: bottom; background-repeat:repeat-y;border-bottom-left-radius: 15px;  border-bottom-right-radius: 15px">
      </div>										
			</div> <!-- div col-8 row p-0 -->	
								           
        </section>     
        
        <!-- FOOTER -->
        <jsp:include page="banner/footer.jsp"></jsp:include>		
		
		<script src="js/jquery-3.2.1.min.js"></script>
  		<script src="js/dataTable/jquery-1.12.4.js"></script>
  		<script src="js/dataTable/jquery.dataTables.min.js"></script>
		<script src="js/dataTable/dataTables.buttons.min.js"></script>
		<script src="js/dataTable/buttons.flash.min.js"></script>
		<script src="js/dataTable/jszip.min.js"></script>
		<script src="js/dataTable/pdfmake.min.js"></script>
		<script src="js/dataTable/vfs_fonts.js"></script>
		<script src="js/dataTable/buttons.html5.min.js"></script>
		<script src="js/dataTable/buttons.print.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#tblAbstractBook').DataTable({
			    	//dom: 'Bfrtip',
			    	//buttons: [
	                //    'copy', 'csv', 'excel', 'pdf', 'print'
	                //],
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
		response.sendRedirect("error.jsp?error="+ mensaje);
	}
%>