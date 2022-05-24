<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
<html lang="en">
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
  <body onLoad="window.print()">
  <jsp:useBean id="paperFacade" class="co.edu.ufps.imrmtp.capaNegocio.facade.PaperFacade" scope="page"></jsp:useBean>
  
  
  <% 
  		int id = Integer.parseInt(request.getParameter("id"));
  		Paper paper = paperFacade.getPaper(id);
  		
  		String observaciones = paper.getObservaciones();
  		if (observaciones == null) observaciones="";
  		
  		Locale locale = new Locale("en", "us");
  		
  		DateFormat formato=new SimpleDateFormat("dd ' ' MMMMM ' ' yyyy", locale );

  		String fecha = formato.format(new Date());
  %>
    

    <div class="container theme-showcase" role="main">
		<table width="100%" align="center">
			<tr>
				<td align="right">
					<img alt="" src="../imagenes/Logo-Foristom-Ingles.png" width="250" height="200">
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<p>Colombia, <%= fecha %> </p>
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<br>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<p>Dear Authors,</p>
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<br>
					<br>
					<br>
				</td>
			</tr>
<% 	
		if (paper.getEstadoPaper().getId()==2){
		
%>
			<tr>
				<td align="justify">
					<p>On behalf of the Organizing and Academic Committee of the First Meeting of Materials Science, Engineering and Nanotechnology Researchers Network (1<sup>st</sup> MRN), I inform you that your research work  
					titled: <strong><%= paper.getTituloEn().toUpperCase() %></strong>. Authors:  
			<% 
				for (Asistente asis: paper.getAutores()){
			%>
						<%= asis.getNombre().toUpperCase() + " " + asis.getApellido().toUpperCase() %>,
			<% 
				}
			%>		
					
					has been <strong>Accepted</strong> for <%= paper.getTipoPresentacion().getNombre() %> at the 
					<%= paper.getTopico().getNombreEn() %> session during the 1<sup>st</sup> MRN meeting.</p>
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<br>
					<br>
					<br>					
				</td>
			</tr>
			<tr>
				<td align="justify">
					<p>The 1<sup>st</sup> meeting will be held as an on-site and remote presentation from 28 to 29 July 2022 in Paipa, Colombia.</p>
					<br>
					<br>
					<br>
					<br>
					<p>Hope to see you at the 1<sup>MRN</sup> meeting.</p>
				</td>
			</tr>
<% 
		} else {
%>
			<tr>
				<td align="justify">
					<p>This abstract with id: <%= paper.getId() %> has not been Acepted.</p>
				</td>
			</tr>
<% 
		}
%>
			<tr>
				<td>
					<br>
					<br>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<td align="left">
					<img alt="" src="../imagenes/Firma-Ely.png" width="150" height="150"><br>
					<p><strong>Ely Dannier V. Ni�o</strong><br>
					Chairman 1<sup>st</sup> MRN<br>
					E-mail: info@foristom.org<br>
					</p>
				</td>
			</tr>
		</table>
		<br>
		<br>		     
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
  

	<div id="global-zeroclipboard-html-bridge" class="global-zeroclipboard-container" title="" style="position: absolute; left: 0px; top: -9999px; width: 15px; height: 15px; z-index: 999999999;" data-original-title="Copy to clipboard">      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" id="global-zeroclipboard-flash-bridge" width="100%" height="100%">         
		<param name="movie" value="/assets/flash/ZeroClipboard.swf?noCache=1453935666104">         
		<param name="allowScriptAccess" value="sameDomain">         
		<param name="scale" value="exactfit">         
		<param name="loop" value="false">         
		<param name="menu" value="false">         
		<param name="quality" value="best">         
		<param name="bgcolor" value="#ffffff">         
		<param name="wmode" value="transparent">         
		<param name="flashvars" value="trustedOrigins=getbootstrap.com%2C%2F%2Fgetbootstrap.com%2Chttp%3A%2F%2Fgetbootstrap.com">         <embed src="/assets/flash/ZeroClipboard.swf?noCache=1453935666104" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="100%" height="100%" name="global-zeroclipboard-flash-bridge" allowscriptaccess="sameDomain" allowfullscreen="false" type="application/x-shockwave-flash" wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="trustedOrigins=getbootstrap.com%2C%2F%2Fgetbootstrap.com%2Chttp%3A%2F%2Fgetbootstrap.com" scale="exactfit">                </object></div><svg xmlns="http://www.w3.org/2000/svg" width="1140" height="500" viewBox="0 0 1140 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;">
		<defs>
			<style type="text/css"></style>
		</defs>
		<text x="0" y="57" style="font-weight:bold;font-size:57pt;font-family:Arial, Helvetica, Open Sans, sans-serif">Thirdslide</text>
		</svg>
</body>
<% 
	}catch(Exception e){
		e.printStackTrace();
		String mensaje="System Error, please contact chair.";
		response.sendRedirect("../login.jsp?error="+ mensaje);
	}
%>
</html>