<%@page import="java.util.List"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Topico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="es">

    
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">    
    <meta name="author" content="foristom">
    <meta name="description" content="5 IMRMPT - International Meeting for Researchers in Materials and Plasma Technology">        
    <title>5 imrmpt</title>     
    <link rel="shortcut icon" href="favicon.ico">    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">
    <script src="js/general.js"></script>
</head>
 
    <style>
    #uno{    
        min-height:100vh;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }
    #cuatro{    
        min-height:20vh;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box; 
    }      
    .wow {
    visibility: hidden;
    } 

    .rgba-black-strong {
    background-color: rgba(20, 20, 20, 0.9); }       
 
        
   .grey-text{font-size:13px} 
        
    .nav-link{color:aliceblue!important;
        font-size:16px;
        } 
#fotoAnimez, #anim-baja-div{
    -webkit-animation-duration: 1s;
    -webkit-animation-delay: 2s;
    -webkit-animation-iteration-count: infinite;
    -moz-animation-duration: 3s;
    -moz-animation-delay: 2s;
    -moz-animation-iteration-count: infinite;   
    -o-animation-duration: 3s;
    -o-animation-delay: 2s;
    -o-animation-iteration-count: infinite;     
    animation-duration: 3s;
    animation-delay: 2s;
    animation-iteration-count: infinite;  
}       
        
.carrucel_noticias {
  animation: animacion_noticias ease 30s;
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
    transform: translate(0px, 10px);
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
    -moz-transform: translate(0px, 10px);
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
    -webkit-transform: translate(0px, 10px);
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
    -o-transform: translate(0px, 10px);
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
    -ms-transform: translate(0px, 10px);
  }
  100% {
    -ms-transform: translate(0px, 0px);
  }
}
  
    </style>
  <% 
  	String mensaje = "";
  %>  

  <body>
    <jsp:useBean id="facade" class="co.edu.ufps.imrmtp.capaNegocio.facade.InicioFacade" scope="page"></jsp:useBean>  
    <!--Main Navigation-->
    <header>
      <nav class="navbar navbar-expand-lg navbar-dark sticky-top" style="background-color:rgba(10, 32, 35, 0.8);top:0px; width:100%; position: fixed;">
        <div class="container">
          <a class="navbar-brand" href="index.html" onClick="window.open('index.html', '_self')" ><strong>5th IMRMPT</strong><span class="sr-only">(current)</span></a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto d-flex justify-content-end" style="width: 100%;">
            <li class="nav-item" style="text-align: center">
            <a class="nav-link" href="index.html#important-Dates" onClick="window.open('index.html#Important-Dates', '_self')">Important Dates</a>
            </li> 
             <li class="nav-item" style="text-align: center">
            <a class="nav-link" href="index.html#Register" onClick="window.open('index.html#Register', '_self')">Register</a>
            </li>   
            <li class="nav-item" style="text-align: center">
            <a class="nav-link" style="color:darkblue" href="topics.jsp" onClick="window.open('topics.jsp', '_self')">Topics</a>
            </li>
            <li class="nav-item" style="text-align: center;">
            <a class="nav-link"  href="invited.html" onClick="window.open('invited.html', '_self')">Invited</a>
            </li>
            <li class="nav-item" style="text-align: center;">
            <a class="nav-link"  href="courses.html" onClick="window.open('courses.html', '_self')" >Courses</a>
            </li>
            <li class="nav-item" style="text-align: center;">
            <a class="nav-link" href="committees.html" onClick="window.open('committees.html', '_self')">Committees</a>
            </li>
            <li class="nav-item" style="text-align: center;">
            <a class="nav-link" href="publication.html" onClick="window.open('publication.html', '_self')" >Publication</a>
            </li>
            <li class="nav-item" style="text-align: center;">
            <a class="nav-link" href="presentations.html" onClick="window.open('presentations.html', '_self')" >Presentations</a>
            </li>
            <!-- Dropdown -->
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="false">Download</a>
                <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="archivos/Programme.pdf" onClick="window.open('archivos/Programme.pdf', '_blank')">Programme</a>
                  <a class="dropdown-item" href="abstractBook.jsp" onClick="window.open('abstractBook.jsp', '_blank')">Abstracts Book</a>
                  <a class="dropdown-item" href="archivos/Poster.pdf" onClick="window.open('archivos/Poster.pdf', '_blank')">Poster</a>
                  <a class="dropdown-item" href="archivos/Banner.jpg" onClick="window.open('archivos/Banner.jpg', '_blank')">Banner</a>
                </div>
              </li>
              <li class="nav-item" style="text-align: center;">
	            <a class="nav-link" href="login.jsp" onClick="window.open('login.jsp', '_self')" >Login</a>
	          </li>   
            </ul>
          </div>
        </div>
      </nav>

    </header>
    <!--Main Navigation-->  
      

        
      
    <section id="uno" class="container-fluid" style="background-image:url(imagenes/bg_origen.gif); background-repeat: no-repeat; background-size:50vh; background-position: bottom; background-size: contain; width:100%; padding: 0px;">

    <div class="row p-0 m-0" style="height:auto;" >  
        <div class="col-12" style="" >
        <img id="fotoAnimez" class="d-block img-fluid carrucel_noticias" src="imagenes/estructura.png" alt="" style="z-index: 1;position: absolute; top: -10px; left:-90px; width: 25%;">          
        </div>
    </div>

    
        
    <div class="container-fluid p-0" style="height: 170px; background-color:#0A2023; top: 400px">
      <div class="container-fluid p-0 m-0" style="height: 70px; background-color:white; top: 30px">
       </div>   
        <div class="container" style="">
            <div class="row p-1 m-0 d-flex justify-content-end align-items-center" style="">            
            <div class="col-8 p-0 d-flex justify-content-end" style="max-height:100px; background-image:url(imagenes/hotel-5imrmpt.jpg); background-repeat:repeat-x; background-size: cover; background-position:bottom" >            
                  <img id="" class="animated wow slideInRight img-fluid" style="height: 90px" src="imagenes/12345Fondo.png" >              
            </div>
            <div class="col-4 p-0" style="max-height:100px">            
                  <img id="" class="animated wow pulse img-fluid" style="height: 90px" src="imagenes/titulo-5imrmpt1-medio.png" >              
            </div>
            </div>            
        </div>
    </div> 
        

                       
    <div class="container p-0 p-sm-2 p-md-5" style="">
            
            
            <div class="row p-0 mt-5" style=""> 
            <div class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-12 borde-tabla2 fonto-tabla p-4" style=""> 
                
                <div class="titulos" style="text-align: left; "><span style="color:#0A2023; font-size: 1.5em">Assistant certificate</span><br><br></div>                
                
                    <form class="text-center border border-light p-5" id="frmGenerar" name="frmGenerar" action="procesarSesion.jsp">
												
	                            <div class="form-group">
	                                <label for="tipoDocumento">Type ID: *</label>
	                                <select id="tipoDocumento" name="tipoDocumento" required="required"  class="form-control" >
	                                <option value="cc">CC</option>
	                                <option value="pste">Passport</option>
	                                <option value="ot">Other</option>
	                                </select>
	                            </div>
	                            <div class="form-group">
	                                <label for="numeroDocumento">ID Number: *</label>
	                                <input type="text" id="numeroDocumento" name="numeroDocumento" required="required" placeholder="Id Number" class="form-control"/>
	                            </div>
						
						    	<div class="form-group" align="center">
						    	<button class="btn btn-info" type="button" onclick="generarCertificado()">Generate</button>
						    	<a class="btn btn-info" href="index.html">Home</a>
						    	</div>
						
						    
						    <% 
			                if(!mensaje.equals("")){
			                    %>        
			                    <div class="alert alert-danger" role="alert"><%= mensaje %></div>
			                    <% 
			                }
			                %>												    						
						</form>
						<!-- Default form login -->
                		<br>
		                <div id="divCertificado" class="form-group" align="center"> 
		                                 		                 
                    
                		</div>                                                                           
            </div>
                <div id="estructura-lateral-2" class="col-2 fonto-tabla " style="background-image:url(imagenes/estructura-lateral2.png); background-repeat:repeat-y; background-position: bottom left; background-size:contain; width:100%; border:solid 11px #0A2023; border-width:0px 10px 0px 0px;"> 
            </div>
        </div>
        
    </div> 
           

            
        </section>   
      
      
      
    <section id="cuatro" class="container-fluid p-0" style="background-color: #D0D0D2">

    <div class="container-fluid " style="background-color:#0A2023" >
        <div class="container p-4 ">
            <div class="row p-xl-3 p-5" style="color:azure"> 
                <div class="esquinas-logo col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 d-flex justify-content-end align-items-center mb-4" style="text-align:center; background-color: white"> <a href="http://foristom.org" target="_blank">
                <img id="" class="animated wow tada img-fluid " src="imagenes/logo_foristom.png"> </a>
                </div>
                
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 mb-4" style="">
                <br>
                <br>
                <span style="font-size: 16px">5th IMRMPT</span><br/>5th International Meeting for Researchers in Materials and Plasma Technology<br/>
                </div>
                
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 mb-4" style="border-left-color:darkgray; border-left-width: thin; border-left-style: solid"> 
                <br>
                <span style="font-size: 16px">Previous editions:</span><br/>
                <a href="http://ciencias.uis.edu.co/peinmatpla" target="_blank">1st IMRMPT 2011</a><br/>
                <a href="http://ciencias.uis.edu.co/imrmpt" target="_blank">2nd IMRMPT 2013</a><br/>
                <a href="http://ciencias.uis.edu.co/3imrmpt" target="_blank">3rd IMRMPT 2015</a><br/>
                <a href="http://foristom.org/4imrmpt" target="_blank">4th IMRMPT 2017</a><br/>
                </div> 
                
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 mb-4" style="border-left-color:darkgray; border-left-width: thin; border-left-style: solid">  
                <span style="font-size: 16px">Contact information:</span><br/>
                <i class="fa fa-envelope-o" aria-hidden="true"></i>  
                imrmpt@gmail.com<br/>
                <i class="fa fa-envelope-o" aria-hidden="true"></i>  
                foristom@gmail.com <br/>
                <i class="fa fa-twitter" aria-hidden="true"></i>  
                @foristomf <br/>
                <i class="fa fa-facebook" aria-hidden="true"></i>  
                foristom.imrmpt <br/>
                <i class="fa fa-instagram" aria-hidden="true"></i>  
                foristomfoundation <br/>
                <span style="font-size: 12px"> 
                Copyright 2019 FORISTOM, GIDIS UFPS<br/>All rights reserved 
                </span>
                </div>
            </div>    
        </div>    
    </div>
       
    </section>
      
    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script> 
      
      <script>	 	

$(document).ready(function(){
    
    
    // popovers Initialization
$(function () {
    $('[data-toggle="popover"]').popover()
})
      

var myArr = "";
    
 wow = new WOW({
    boxClass: 'wow', // default
    animateClass: 'animated', // default
    offset: 0, // default
    mobile: true, // default
    live: true // default
})   
    
WOW().init();
    
    //  animación scroll enlaces internos  
    //$('nav a').click(function(e){
        $('nav a').click(function(e){	
        e.preventDefault();		//evitar el eventos del enlace normal
        var strAncla=$(this).attr('href'); //id del ancla
        $('body,html').stop(true,true).animate({				
            scrollTop: $(strAncla).offset().top
        },1000);
    });    

    $('.carousel').carousel({
        interval: 5000
    });
    
	});
 
</script>

</body>
</html>
