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
  <body role="document">
  <jsp:useBean id="paperFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
  
  
  <% 
  		int id = Integer.parseInt(request.getParameter("id"));
  		Paper paper = paperFacade.getPaper(id);
  
  %>
    <jsp:include page="../banner/header-app2.jsp"></jsp:include>
    <section id="tres" class="container-fluid row p-0 m-0" style="background-image: url(../imagenes/texturamrn1.png); background-blend-mode:overlay; background-repeat: round; width: auto">

    <div class="col-12 p-0 m-0">
      <br><br><br></div>
    <div class="col-2 p-0 m-0">
    </div>


    <div class="col-12 row p-0 m-1 " style="background:rgba(255,255,255,0.80); border-radius: 15px; border-top-left-radius: 35px;  border-top-right-radius: 35px">
		      <div class="col-4 col-md-3 d-flex align-items-center justify-content-center " style="background-color:#FFAF12;">
		      <i class="fas fa-user-plus fa-4x" style="#0F4C83"></i></div>
		      <div class="titulos p-0 m-0 col-8 col-md-9" style="text-align: center; background-color:#FFFFFF;"><br><br><span
		          style="font-size: 1.5em">Submit abstract</span><br><br></div>
		      <a name="Register"></a>
		      <div class="p-0 p-sm-2 p-md-5" >
						
		        <div class="row p-0 mt-5">
		          <div class=" borde-tabla2 fonto-tabla">
  
    
  					<div class="card">
				            <div class="card-header">
				              <h3 class="card-title">Are you sure you want to delete the abstract?</h3>
				            </div>
				            <div class="card-body">
				            	<form id="frmBorrar" name="frmBorrar" action="guardarBorrarPaper.jsp" method="post">
							        <table class="table-responsive">
						            <tbody>
						              <tr>
						                <td class="card-title">Id: </td>
						                <td>
						                	<input type="text" id="idPaper" name="idPaper" value="<%=paper.getId()%>" readonly="readonly"/>
						                	<br>
						                	<br>
						                </td>
						              </tr>
						              <tr>
						                <td class="card-title">English title:</td>
						                <td>
						                	<textarea rows="2"  id="tituloEn" name="tituloEn" readonly="readonly" class="form-control"><%= paper.getTituloEn() %></textarea>
						                	<br>
						                </td>
						              </tr>
						              <tr>
						                <td class="card-title">Spanish title:</td>
						                <td>
						                	<textarea rows="2" cols="80" id="tituloEs" name="tituloEs" readonly="readonly" class="form-control"><%= paper.getTituloEs() %></textarea>	                	
						                </td>
						              </tr>
						           </tbody>
						           </table>
						           
						           <div class="form-group" align="center">
						          		<button type="submit" class=boton resumen" style="width: min(80px, 25vw)"><span>OK</span></button>
						          		<button type="button" class="boton resumen" style="width: min(100px, 25vw)" onclick="cancelarBorrado()"><span>Cancel</span></button>
						        	</div>
					        	</form>
				            </div>
				    	</div>
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
		response.sendRedirect("login.jsp?error="+ mensaje);
	}
%>
</html>