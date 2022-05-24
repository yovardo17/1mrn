    <%@page import="co.edu.ufps.imrmtp.capaDatos.dto.Asistente"%>
    <% 
	    Asistente asistente = new Asistente();		
		asistente= (Asistente)session.getAttribute("asistente");
		String titulo="";
	%>
  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="../js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="../js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="../js/mdb.min.js"></script>
  <script src="../js/general.js"></script>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top" style="background-color:rgba(52,52,52,0.9); width:100%; position: fixed;">
      <div class="container-fluid">
        <a class="navbar-brand" href="../bienvenida.jsp" onClick="window.open('../bienvenida.jsp', '_self')"><img id="" src="imagenes/home.png" style="text-align: center; width: min(55px, 20vw); position: absolute; margin: 5px; padding: 5px"></a><span class="sr-only">(current)</span></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto d-flex justify-content-end" style="width: 100%;">
            <% 
				if (asistente.getTipoAsistente().getId()==5) {
			%>    
	            <li class="nav-item" style="text-align: center">
	            <a class="nav-link" href="../papers/aceptedPapers.jsp" onClick="window.open('../papers/aceptedPapers.jsp', '_self')">Abstract to be presented</a>
	            </li>
	            &nbsp;&nbsp;
	            <li class="nav-item" style="text-align: center">
	            <a class="nav-link" href="../papers/activarAsistente.jsp" onClick="window.open('../papers/activarAsistente.jsp', '_self')">Activate Author</a>
	            </li>
	        <% 
				}
	        %>
	            <li class="nav-item" style="text-align: center">
	            <a class="nav-link" href="../perfil/editarPerfil.jsp" onClick="window.open('../perfil/editarPerfil.jsp', '_self')"><%= asistente.getNombre() + " " + asistente.getApellido() %></a>
	            </li> 
	             <li class="nav-item" style="text-align: left;">
	            	<form action="../cerrarSesion.jsp">
	            		<button type="submit" class="btn btn-success btn-sm">Logout</button>
	            	</form>
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
      
      <div id="cicoMasTitulo" class="container-fluid row p-0 m-0" style="position:absolute; z-index: 2; ">
        <div id="cincoMasUno " class="col-12   p-0 m-0" style="position:relative; height: 30vh;" >
           <img id="masuno" class="carrucel_masuno pt-5 img-fluid" src="imagenes/mrn.png" alt=""  style="position: absolute; height: 30vh; left: 100px;">
           <img id="fotoAnimez" class="carrucel_noticias pt-5 img-fluid" src="imagenes/1st.png" alt=""
           style="position: absolute; height: 30vh;">
        </div>
        <div id="tituloCincoMasUno" class="row col-12 col-sm-12 col-md-12 p-0 m-0"
          style="background-image:url(../imagenes/sombraH.png); background-size:auto; background-repeat:repeat-x; background-blend-mode:overlay; background-position-y: bottom; height: 30vh; ">
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
    <!--Main Navigation-->     