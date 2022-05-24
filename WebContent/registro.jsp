<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.TipoAsistente"%>
<%@page import="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
    
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="author" content="Foristom - UFPS - I International Seminar on Physical Infrastructure">
    <meta name="description"
      content="First Meeting of Materials Science, Engineering and Nanotechnology Researchers Network (1st MRN)">  
    <title>1st MRN </title>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.css" rel="stylesheet" />
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
	<!-- boton style-->
	<link href="css/estilos.css" rel="stylesheet">
	<link href="css/resumen.css" rel="stylesheet">
    <!--/boton style-->
    
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link href="css/acordeon.css" rel="stylesheet">
    <link href="css/submenu.css" rel="stylesheet">
    <script src="js/general.js"></script>
  
  </head>

    <body>
    <script src="https://www.google.com/recaptcha/api.js?hl=en" async defer></script>
    <% 
	  //foristom.org
	    String key="6Leyv4gUAAAAAFuL8dBGInaENICSxPmA7vu93H-N";
	    
	    // local
	    //String key="6LcV_GQUAAAAANiqBpWZ-cQEQpZCWGgTljeKXH2a";
    	String mensaje = request.getParameter("error");
    	
    	if (mensaje==null) mensaje="";
    %>
        <jsp:useBean id="asistenteFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.AsistenteFacade" scope="page"></jsp:useBean>
        <jsp:include page="banner/header.jsp"></jsp:include>
		
		<!-- Para insertar en las otras p�ginas -->
<section id="tres" class="container-fluid row p-0 m-0" style="background-image: url(imagenes/texturamrn1.png); background-blend-mode:overlay; background-repeat: round; width: auto">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>


    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12; border-top-left-radius: 35px;">
      <i class="fa-solid fa-user-tag fa-4x" style="color:#0F4C83"></i></div>
      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
          style="font-size: 1.5em">Register</span><br><br></div>
      <a name="Register"></a>
      <div class="p-0 p-sm-2 p-md-5" >
				
        <div class="row p-0 mt-5">
          <div class=" borde-tabla2 fonto-tabla">
	<!-- hasta ac� -->
		            <div class="card mb-3 ">
		                <div class="card-header">
		                    <h3 class="card-title">Please, insert your personal information.</h3>
		                    <h5>(* are required)</h5>
		                </div>
		                <div class="card-body p-lg-5">
		                    <form class=" p-5" id="frmRegistro" name="frmRegistro" action="registrarAsistente.jsp" method="post">		                        
		                         <% 
				                if(!mensaje.equals("")){
				                    %>        
				                    <div class="alert alert-danger" role="alert"><%= mensaje %></div>
				                    <% 
				                }
				                %>                           
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
	                                                   
	                            <div class="form-group">
	                                <label for="nombre">Name: *</label>
	                                <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Name"/>
	                            </div>
	                            <div class="form-group">
	                                <label for="apellido">Last Name: *</label>
	                                <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Last Name"/>
	                            </div>
	                                                    
	                            <div class="form-group">
	                                <label for="emali">Email: *</label>
	                                <input type="email" class="form-control" required="required"  id="emali" name="email" placeholder="Email">
	                            </div>
	                            <div class="form-group">
	                                <label for="institucion">Institution or Company: *</label>
	                                <input type="text" id="institucion" name="institucion" required="required"  placeholder="Institution or Company" class="form-control"/>
	                            </div>
	
	                            <div class="form-group">
	                                <label for="ciudad">Address home (for shipping congress documents): *</label>
	                                <input type="text" id="direccion" name="direccion" required="required"  placeholder="Correspondence Address" class="form-control"/>
	                            </div>
	                            
	                            <div class="form-group">
	                                <label for="ciudad">City: *</label>
	                                <input type="text" id="ciudad" name="ciudad" required="required"  placeholder="City" class="form-control"/>
	                            </div>
	                            
	                            <div class="form-group">
	                                <label for="pais">Country: *</label>
	                                <input type="text" id="pais" name="pais" required="required"  placeholder="Country" class="form-control"/>
	                            </div>
	                            
	                            
		                        <div class="form-group">
		                            <label for="pais">Select a participation type: *</label>
		                            <select id="tipoAsistente" name="tipoAsistente" required="required"  class="form-control">		                            	
		                                <% 
		                                for(TipoAsistente tipo: asistenteFacade.getTipoAsistente()) {
		                                %>
		                                <option value="<%= tipo.getId()%>" selected="selected"><%=tipo.getNombre() %></option>
		                                <% 
		                                }
		                                %>                		
		                            </select>
		                        </div>
		                        
		                        <div id="divDatosSesion">
		                            <div class="form-group">
		                                <label for="password">Password: *</label>
		                                <input type="password" required="required"  class="form-control" id="password" name="password" placeholder="Password">
		                            </div>
		                            <div class="form-group">
		                                <label for="password2">Repeat Password: *</label>
		                                <input type="password" required="required" class="form-control" id="password2" name="password2" placeholder="Repeat password">
		                            </div>
		                        </div>
		                        
		                        <div class="g-recaptcha form-control mb-4" data-sitekey="<%= key %>"></div>
		                            
		                        <div class="form-group" align="center">
		                            <button type="submit" class="resumen boton"><span style="font-weight: bold">Save</span></button>
		                            <button type="button" class="boton resumen" onClick="window.open('index.html', '_self')"><span style="font-weight: bold">Cancel</span></button>
		                        </div>
		                        		                       	
		                    </form>
		                </div>
		                <div class="card-footer text-muted p-5">
		                	<h3 class="panel-title">Personal Data Protection Treatment Policy</h3>
		                	
		                	<p align="justify">In compliance with the provisions of Law 1581 of 2012 and its Decree 1377 of 2013, 
		                	the Foundation of Researchers in Science and Technology of Materials (FORISTOM) adopts the present 
		                	policy for the treatment of personal data, which will be informed to all the holders of the data 
		                	collected or that in the future are obtained in the exercise of academic, cultural, commercial or 
		                	labor activities.</p>
							
							<p align="justify">According to the foregoing, the Foundation FORISTOM states that it guarantees 
							the rights of privacy, intimacy, the good name, and institutional autonomy, in the processing of 
							personal data; so that all its actions will be governed by the principles of legality, purpose, 
							freedom, veracity, quality, transparency, access, restricted circulation, security, and confidentiality.</p>

							<p align="justify">All persons who in the development of different cultural, academic, contractual, 
							commercial, labor, and other activities, whether permanent or occasional, will provide the Foundation 
							FORISTOM any kind of information or personal data, may know, update and rectify it.</p>

							<p align="justify">If you proceed with the registration, you accept this data policy. Any change, 
							request, or complaint communicate via email to info@foristom.org.</p>
		               </div>
		            </div>
<!-- Desde ac� -->		           
		       </div>     
		    </div>  
		 </div>
		<div class="col-12 row p-0 m-0"
        style="height:3vh; background-color:#019EB8; background-image: url(imagenes/coloresLinea.gif); background-size:50%; background-position-x: right; background-position-y: bottom; background-repeat:repeat-y;border-bottom-left-radius: 15px;  border-bottom-right-radius: 15px">
      </div>
	</div>
</section>
<!-- hasta ac� -->
		       

     <!-- FOOTER -->
     <jsp:include page="banner/footer.jsp"></jsp:include>
  </body>
</html>