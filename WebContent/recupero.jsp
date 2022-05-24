<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
    
    <body>
        <% 
        String mensaje= request.getParameter("error");
        if(mensaje==null) mensaje="";
        %>
       <jsp:include page="banner/header.jsp"></jsp:include>
		
		<section id="tres" class="container-fluid row p-0 m-0" style="background-image: url(imagenes/texturamrn1.png); background-blend-mode:overlay; background-repeat: round; width: auto">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>


    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12; border-top-left-radius: 35px;">
      <i class="fa-solid fa-user-pen fa-4x" style="color:#0F4C83"></i></div>
      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
          style="font-size: 1.5em">Password recovery</span><br><br></div>
      <a name="Register"></a>
      <div class="p-0 p-sm-2 p-md-5" >
				
        <div class="row p-0 mt-5">
          <div class=" borde-tabla2 fonto-tabla">
          
	            		<div class="card bg-light mb-3">
			                <div class="card-header">
			                    <h3 class="card-title">Please, insert your email.</h3>
			                </div>
			                <div class="card-body">
			            		<form class="form-signin" id="frmLogin" name="frmLogin" 
					                  action="procesarRecovery.jsp" method="post">
									
									<div class="form-group">
						                <label for="email" class="sr-only">Email</label>
						                <input type="email" id="email" name="email" class="form-control" placeholder="Email" required="" autofocus="">
						            </div>
					                <br>
					                <div class="form-group" align="center">
					                	<button class="btn btn-lg boton resumen" type="submit"><span style="font-weight: bold">Recovery</span></button>
					               	</div>
					                <br>
					                <% 
					               
					                if(!mensaje.equals("")){
					                    if(!mensaje.equals("Incorrect, Email No Exist")){
					                    %>
					                    <div class="alert alert-success" role="alert"><%= mensaje %></div>
					                    <%
					                    }else{
					                    %>        
					                    <div class="alert alert-danger" role="alert"><%= mensaje %></div>
					                    <% }
					                }
					                %>
					            </form>
					        </div>
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
</html>