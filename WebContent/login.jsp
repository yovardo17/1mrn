<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta http-equiv="x-ua-compatible" content="ie=edge">
	  <meta name="author" content="foristom">
	  <meta name="description"
	    content="5+1  6IMRMPT - International Meeting for Researchers in Materials and Plasma Technology">
	  <title>5+1  imrmpt</title>
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
	  <!-- boton style-->
	 <link href="css/estilos.css" rel="stylesheet">
	 <link href="css/resumen.css" rel="stylesheet">
      <!--/boton style-->
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
</head>
	
    <body>
    <script src="https://www.google.com/recaptcha/api.js?hl=en" async defer></script>
       
        <% 
        String mensaje= request.getParameter("error");
        if(mensaje==null) mensaje="";
        
        //foristom.org
        String key="6Leyv4gUAAAAAFuL8dBGInaENICSxPmA7vu93H-N";
        
        // local  
        //String key="6LcV_GQUAAAAANiqBpWZ-cQEQpZCWGgTljeKXH2a";
        %>
        
        <jsp:include page="banner/header.jsp"></jsp:include>
        
        <section id="tres" class="container-fluid row p-0 m-0"style="background-image: url(imagenes/texturamrn1.png); background-blend-mode:overlay; background-repeat: round; width: auto">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>
		
		
		    <div class="col-8 row p-0 m-1" style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
		      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12; border-top-left-radius: 35px;">
		      <i class="fas fa-user-plus fa-4x" style="#0F4C83"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Login</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">
        
		    			<!-- Default form login -->
						<form class="text-center border border-light p-5" id="frmLogin" name="frmLogin" action="procesarSesion.jsp">
						
						    <p class="h4 mb-4">Sign in</p>
						
						    <!-- Email -->
						    <input type="email" id="email" name="email" class="form-control mb-4" placeholder="E-mail">
						
						    <!-- Password -->
						    <input type="password" id="password" name="password" class="form-control mb-4" placeholder="Password">
							
							<div class="g-recaptcha form-control mb-4" data-sitekey="<%= key %>"></div>
							
						    <div class="d-flex justify-content-around">
						        <div>
						            <!-- Remember me -->
						            <div class="custom-control custom-checkbox">
						                <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
						                <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
						            </div>
						        </div>
						        <div>
						            <!-- Forgot password -->
						            <a href="recupero.jsp" style="color: blue; font-size: 1.1em; font-weight: bold;">Forgot password?</a>
						        </div>
						        
						    </div>
						
						    <div class="form-group" align="center"><!-- Sign in button -->
						    	<button class="boton resumen my-4" type="submit"><span>Sign in</span></button>
						    </div>
						
						    <!-- Register -->
						    <p>Not a member?
						        <a href="registro.jsp" style="color: blue; font-size: 1.1em; font-weight: bold;">Register</a>
						    </p>
						    <% 
			                if(!mensaje.equals("")){
			                    %>        
			                    <div class="alert alert-danger" role="alert"><%= mensaje %></div>
			                    <% 
			                }
			                %>												    						
						</form>
						<!-- Default form login -->
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