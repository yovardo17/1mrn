<%@page import="co.edu.ufps.imrmtp.capaDatos.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../error.jsp" %>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
<%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Room"%>
<!DOCTYPE html>
<jsp:useBean id="facadeRoom" class="co.edu.ufps.imrmtp.capaNegocio.facade.RoomFacade" scope="page"></jsp:useBean>
<%
	try {
		Asistente asistente = new Asistente();		
		asistente= (Asistente)session.getAttribute("asistente");
		String titulo="";
		
		if (asistente==null) {
			titulo="Please login.";
			response.sendRedirect("login.jsp?error=" + titulo);
		}
		int idRoom=0;
		String numero = request.getParameter("idRoom");
		if (numero==null) numero="0";
		if (numero.equals("")) numero="";
		idRoom= Integer.parseInt(numero);
		Room room = facadeRoom.getRoom(idRoom);
		
%>
<html>
<head>
    <title>IV WMSSE - Foristom Conferences</title>  
    <meta charset="utf-8" />
    
    <link rel="shortcut icon" href="../favicon.ico">        
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Material Design Bootstrap -->
    <link href="../css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="../css/style.css" rel="stylesheet">
    
    
    <script src="../js/general.js"></script>
    
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/1.9.0/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/1.9.0/css/react-select.css" />
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

</head>

<style>
        .sdk-select {
            height: 34px;
            border-radius: 4px;
        }

        .websdktest button {
            float: right;
            margin-left: 5px;
        }

        #nav-tool {
            margin-bottom: 300px;
        }

        #show-test-tool {
            position: absolute;
            top: 100px;
            left: 0;
            display: block;
            z-index: 99999;
        }

        #display_name {
            width: 250px;
        }


        #websdk-iframe {
            width: 300px;
            height: 500px;
            border: 1px;
            border-color: red;
            border-style: dashed;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            left: 50%;
            margin: 0;
        }
    </style>
<script type="text/javascript">
	var nombre = "<%= asistente.getNombre() + " " + asistente.getApellido() %>";
	var numero = "<%= room.getMeetingId() %>";
	var password = "<%= room.getPassword() %>";
</script>
<body>    	    
    <% 
    if (asistente.getEstadoAsistente().getId()==2) {
    	
    %>
    <nav id="nav-tool" class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Foristom Conferences - Zoom Meeting</a>
            </div>
            <div id="navbar" class="websdktest">
                <form class="navbar-form navbar-right" id="meeting_form" method="post">
                    <div class="form-group">
                        <input type="text" name="display_name" id="display_name" value="<%= asistente.getNombre() + " " + asistente.getApellido() %>" maxLength="100"
                            placeholder="Name" class="form-control" required readonly="readonly">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="meeting_number" id="meeting_number" value="<%= room.getMeetingId() %>">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="meeting_pwd" id="meeting_pwd" value="<%= room.getPassword()%>" >
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="meeting_email" id="meeting_email" value="info@foristom.org" >
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="meeting_role" id="meeting_role" value="5" >
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="meeting_china" id="meeting_china" value="0" >
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="meeting_lang" id="meeting_lang" value="es-ES" >
                    </div>
                                                            
                    <input type="hidden" value="" id="copy_link_value" />
                    <button type="submit" class="btn btn-primary" id="join_meeting">Join</button>
                    <button type="submit" class="btn btn-primary" id="clear_all" style="display:none">Clear</button>
                    <button type="button" class="btn btn-primary" id="cancel" onClick="window.open('../bienvenida.jsp', '_self')">Cancel</button>
                    <button type="button" link="" onclick="window.copyJoinLink('#copy_join_link')" class="btn btn-primary" id="copy_join_link" style="display:none">Copy Direct join link</button>                    

                </form>
            </div>
            <!--/.navbar-collapse -->
        </div>        
    </nav>
	<% 
    } else {
	%>
		<div class="alert alert-info" role="alert">
			You can not join to the meeting of Foristom Conferences, please review payment.
		</div>
	<% 
    } 
    %>

    <div id="show-test-tool">
        <button type="submit" class="btn btn-primary" id="show-test-tool-btn"
            title="show or hide top test tool" style="display:none">Show</button>
    </div>        
    <script>
        document.getElementById('show-test-tool-btn').addEventListener("click", function (e) {
            var textContent = e.target.textContent;
            if (textContent === 'Show') {
                document.getElementById('nav-tool').style.display = 'block';
                document.getElementById('show-test-tool-btn').textContent = 'Hide';
            } else {
                document.getElementById('nav-tool').style.display = 'none';
                document.getElementById('show-test-tool-btn').textContent = 'Show';
            }
        })
    </script>

    <script src="https://source.zoom.us/1.9.0/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/1.9.0/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/1.9.0/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/1.9.0/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/1.9.0/lib/vendor/lodash.min.js"></script>
    <script src="https://source.zoom.us/zoom-meeting-1.9.0.min.js"></script>
    <script src="js/tool.js"></script>
    <script src="js/vconsole.min.js"></script>
    <script src="js/index.js"></script>

    <script>
         	    	
    </script>
          	  	
    <br>
    <br>

	<jsp:include page="../banner/footer-app.jsp"></jsp:include>

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