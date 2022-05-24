// JavaScript Document
/* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
lo que se puede copiar tal como esta aqui */
function nuevoAjax()
{ 
	var xmlhttp=false;
	try	{
		// Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
		xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
	}catch(e){
		try	{
			// Creacion del objet AJAX para IE
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}catch(E){
			if (!xmlhttp && typeof XMLHttpRequest!='undefined') xmlhttp=new XMLHttpRequest();
		}
	}
	return xmlhttp; 
}

function validarPassword(){
	var seleccion = frmRegistro.tipoAsistente.value;
	validarPasswordAjax(seleccion);
}

function validarPasswordAjax(valorSeleccionado){
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	
	parametros = "valor="+valorSeleccionado+"&aleatorio="+aleatorio;  
	url = "procesarAjaxPassword.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById("divDatosSesion").innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById("divDatosSesion").innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById("divDatosSesion").innerHTML = "<img src='imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
}

function addAuthor(){
	
	/*if(frmRegistro.numeroDocumento.value==""){
		alert("Id. Number is empty. Please insert a value.");		
		return false;
	}
	if(frmRegistro.numeroDocumento.value==null){
		alert("Id. Number is null. Please insert a value.");		
		return false;
	}
	*/
	if(frmRegistro.nombre_coautor.value==""){
		alert("Name is Co-author empty. Please insert a value.");		
		return false;
	}
	if(frmRegistro.nombre_coautor.value==null){
		alert("Name is Co-author null. Please insert a value.");		
		return false;
	}
	
	if(frmRegistro.apellido_coautor.value==""){
		alert("Last Name Co-author is empty. Please insert a value.");		
		return false;
	}
	if(frmRegistro.apellido_coautor.value==null){
		alert("Last Name Co-author is null. Please insert a value.");		
		return false;
	}
	
	if(frmRegistro.email.value==""){
		alert("Email is empty. Please insert a value.");		
		return false;
	}
	if(frmRegistro.email.value==null){
		alert("Email is null. Please insert a value.");		
		return false;
	}
		
	if(frmRegistro.institucion_coautor.value==""){
		alert("Institution Co-author is empty. Please insert a value.");		
		return false;
	}
	if(frmRegistro.institucion_coautor.value==null){
		alert("Institution Co-author is null. Please insert a value.");		
		return false;
	}
	
	if(frmRegistro.pais_coautor.value==""){
		alert("Country Co-author is empty. Please insert a value.");		
		return false;
	}
	if(frmRegistro.pais_coautor.value==null){
		alert("Country Co-author is null. Please insert a value.");		
		return false;
	}
	
	document.location.href="#divAutoresInc";
	//var tipoDocumento = frmRegistro.tipoDocumento.value;
	//var numeroDocumento = frmRegistro.numeroDocumento.value;
	var nombre = frmRegistro.nombre_coautor.value;
	var apellido = frmRegistro.apellido_coautor.value;
	var email = frmRegistro.email.value;
	var institucion = frmRegistro.institucion_coautor.value;
	var pais = frmRegistro.pais_coautor.value;
	var ciudad = frmRegistro.ciudad_coautor.value;
	
	//frmRegistro.tipoDocumento.value="cc";
	//frmRegistro.numeroDocumento.value="";
	frmRegistro.nombre_coautor.value="";
	frmRegistro.apellido_coautor.value="";
	//frmRegistro.email.value="";
	frmRegistro.institucion_coautor.value="";
	frmRegistro.pais_coautor.value="";
	frmRegistro.ciudad_coautor.value=""; 
	frmRegistro.email.value="";
	
	addAuthorAjax(nombre, apellido, institucion, pais, ciudad, email);
	
}

function addAuthorAjax(nombre, apellido, institucion, pais, ciudad, email){
	
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	
	parametros = "nombre="+nombre+"&apellido="+apellido+"&institucion="+institucion+"&pais="+pais+"&ciudad="+ciudad+"&email="+email+"&aleatorio="+aleatorio;  
	url = "addAutorAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById("listaAutores").innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById("listaAutores").innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById("listaAutores").innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
	
}

function deleteAuthor(nombre, apellido){
	document.location.href="#divAutoresInc";
	deleteAuthorAjax(nombre, apellido);
	
}

function deleteAuthorAjax(nombre, apellido){
	
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	
	parametros = "nombre="+nombre+"&apellido="+apellido+"&aleatorio="+aleatorio;  
	url = "deleteAutorAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById("listaAutores").innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById("listaAutores").innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById("listaAutores").innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
	
}

function borrarDatos(){
	frmRegistro.tipoDocumento.value="cc";
	frmRegistro.numeroDocumento.value="";
	frmRegistro.nombre.value="";
	frmRegistro.apellido.value="";
	frmRegistro.email.value="";
	frmRegistro.institucion.value="";
	frmRegistro.pais.value="";
	frmRegistro.ciudad.value="";
}

function enivarPaper(){
	var autores = frmRegistro.numeroAutores.value;
	var resumen = frmRegistro.resumen_en.value;
	var l= resumen.length;		
	
	if(frmRegistro.titulo_en.value == null){
		alert("English title is null. Please insert English Title.");		
		return false;
	}
	
	if(frmRegistro.titulo_en.value == ""){
		alert("English title is Empty. Please insert English Title.");		
		return false;
	}
	
	if(frmRegistro.titulo_es.value == null){
		alert("Spanish title is null. Please insert Spanish Title.");		
		return false;
	}
	
	if(frmRegistro.titulo_es.value == ""){
		alert("Spanish title is Empty. Please insert Spanish Title.");		
		return false;
	}
	
	if(resumen == null){
		alert("English Abstract is null. Please insert English Abstract.");		
		return false;
	}
	
	if(resumen == ""){
		alert("English Abstract is Empty. Please insert English Abstract.");		
		return false;
	}
	
	if((l<500)||(l>5000)){
		alert("English Abstract must be between 500 and 5,000 characters.");		
		return false;
	}
	
	resumen = frmRegistro.resumen_es.value;
	l= resumen.length;
	
	if(resumen == null){
		alert("Spanish Abstract is null. Please insert English Abstract.");		
		return false;
	}
	
	if(resumen == ""){
		alert("Spanish Abstract is Empty. Please insert English Abstract.");		
		return false;
	}
	
	if((l<500)||(l>5000)){
		alert("Spanish Abstract must be between 500 and 5,000 characters.");		
		return false;
	}
	
	if(frmRegistro.topico.value == ""){
		alert("Please select a Topic.");		
		return false;
	}
	
	if(frmRegistro.topico.value == null){
		alert("Please select a Topic.");		
		return false;
	}
	
	if(frmRegistro.topico.value == "-1"){
		alert("Please select a Topic.");		
		return false;
	}
	
	if(frmRegistro.tipoPresentacion.value == ""){
		alert("Please select a Presentation Type.");		
		return false;
	}
	
	if(frmRegistro.tipoPresentacion.value == null){
		alert("Please select a Presentation Type.");		
		return false;
	}
	
	if(frmRegistro.tipoPresentacion.value == "-1"){
		alert("Please select a Presentation Type.");		
		return false;
	}		
	
	if(frmRegistro.speaker.value == ""){
		alert("Please select a Speaker.");		
		return false;
	}
	
	if(frmRegistro.speaker.value == null){
		alert("Please select a Speaker.");		
		return false;
	}
	
	if(frmRegistro.speaker.value == "-1"){
		alert("Please select a Speaker.");		
		return false;
	}
	
	var numero = parseInt(frmRegistro.numero_ponentes.value);
	numero = numero+1;
	if(numero>2){
		alert("The autor already has two works for presentation as speaker.");		
		return false;
	}
	
	/*/ validar informacion de contacto
	
	if(frmRegistro.nombre.value == null){
		alert("Name is null. Please insert your name.");		
		return false;
	}
	if(frmRegistro.nombre.value == ""){
		alert("Name is Empty. Please insert your name.");		
		return false;
	}
	
	if(frmRegistro.apellido.value == null){
		alert("Last name is null. Please insert your last name.");		
		return false;
	}
	if(frmRegistro.apellido.value == ""){
		alert("Last name is Empty. Please insert your last name.");		
		return false;
	}
	
	if(frmRegistro.email.value == null){
		alert("Email is null. Please insert your email.");		
		return false;
	}
	if(frmRegistro.email.value == ""){
		alert("Email is Empty. Please insert your email.");		
		return false;
	}
	
	if(frmRegistro.telefono.value == null){
		alert("Telephone is null. Please insert your telephone.");		
		return false;
	}
	if(frmRegistro.email.value == ""){
		alert("Telephone is Empty. Please insert your Telephone.");		
		return false;
	}
	
	if(frmRegistro.institucion.value == null){
		alert("Filial, institution or company is null. Please insert your filial, institution or company.");		
		return false;
	}
	if(frmRegistro.institucion.value == ""){
		alert("Filial, institution or company is Empty. Please insert your filial, institution or company.");		
		return false;
	}
	
	if(frmRegistro.pais.value == null){
		alert("Country is null. Please insert your country.");		
		return false;
	}
	if(frmRegistro.pais.value == ""){
		alert("Country is Empty. Please insert your country.");		
		return false;
	}	*/
	
	frmRegistro.submit();
}

function cancelarBorrado(){
	frmBorrar.action= "../bienvenida.jsp";
	frmBorrar.submit();
}

function filtrarPapers(){
	document.location.href="#papers";
	var idPaper= frmFiltrar.id.value;
	var idTopico= frmFiltrar.topico.value;
	var idTipo= frmFiltrar.tipoPresentacion.value;
	var idEstado= frmFiltrar.estado.value;
	
	if ((idPaper==null)&&(idTopico==null)&&(idTipo==null)&&(idEstado==null)){
		alert("You must enter some search data.");		
		return false;
	}
	if ((idPaper=="")&&(idTopico=="")&&(idTipo=="")&&(idEstado=="")){
		alert("You must enter some search data.");		
		return false;
	}
		
	frmFiltrar.filtro.value="yes";
	frmFiltrar.action= "bienvenida.jsp";
	frmFiltrar.submit();
	
}

function filtrarPapersAjax(idEstado, idTopico, idPaper, idTipo){
	
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	
	parametros = "idEstado="+idEstado+"&idTopico="+ idTopico +"&idPaper="+idPaper+"&idTipo="+ idTipo+"&aleatorio="+aleatorio;  
	url = "papers/filtrarPapersAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById("divResultados").innerHTML = ajax.responseText;	        
	    }
	    else
	    {    
	        document.getElementById("divResultados").innerHTML = ajax.responseText;	        
	    }
	  } 
	  else
	  {
	    document.getElementById("divResultados").innerHTML = "<img src='imagenes/cargando.gif' width='32' height='32' />";
	  }
	};	
}

function borrarFiltros(){
	frmFiltrar.filtro.value="";
	frmFiltrar.id.value = "";
	frmFiltrar.topico.value= "";
	frmFiltrar.tipoPresentacion.value="";
	frmFiltrar.estado.value="";
	frmFiltrar.action= "bienvenida.jsp";
	frmFiltrar.submit();
}

function validarPonentes(){
	ponente = frmRegistro.speaker.value;
	document.getElementById("divPonentes").innerHTML = "<img src='imagenes/cargando.gif' width='32' height='32' />";
	validarPonentesAjax(ponente);
}

function validarPonentesAjax(ponente){
	
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	
	parametros = "ponente="+ponente+"&aleatorio="+aleatorio;  
	url = "validarPonentesAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById("divPonentes").innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById("divPonentes").innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById("divPonentes").innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
	
}

function guardarTipos(){
	var tipoComida = frmTipo.tipoComida.value;
	var curso = frmTipo.curso.value;
	
	if (tipoComida=="0") {
		alert("Please select a Food Type.");		
		return false;
	}
	
	/*
	if (curso=="0") {
		alert("Please select a Course.");		
		return false;
	}
	*/
	
	document.getElementById("mensajeTipo").innerHTML = "<img src='imagenes/cargando.gif' width='32' height='32' />";
	guardarTipoComidaAjax(tipoComida, curso);
}

function guardarTipoComidaAjax(tipoComida, curso){
	
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	
	parametros = "tipoComida="+tipoComida+"&curso="+curso+"&aleatorio="+aleatorio;  
	url = "guardarTipoComidaAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById("mensajeTipo").innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById("mensajeTipo").innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById("mensajeTipo").innerHTML = "<img src='imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
	
}

function validarInformacion(){
	var p1 = frmRegistro.password.value;
	var p2 = frmRegistro.password2.value;

	if (p1!=p2){
		alert("Password and repeat password do not match. Please correct it.");		
		return false;
	}
	
	if(frmRegistro.nombre.value == null){
		alert("Name is null. Please insert your name.");		
		return false;
	}
	if(frmRegistro.nombre.value == ""){
		alert("Name is Empty. Please insert your name.");		
		return false;
	}
	
	if(frmRegistro.apellido.value == null){
		alert("Last name is null. Please insert your last name.");		
		return false;
	}
	if(frmRegistro.apellido.value == ""){
		alert("Last name is Empty. Please insert your last name.");		
		return false;
	}
	
	if(frmRegistro.email.value == null){
		alert("Login email is null. Please insert your email.");		
		return false;
	}
	if(frmRegistro.email.value == ""){
		alert("Login email is Empty. Please insert your email.");		
		return false;
	}
	
	frmRegistro.submit();
}

function siguienteSeccion(tabSiguiente){	
	if(tabSiguiente==1) $('.nav-tabs a[href="#paper"]').tab('show'); 
	if(tabSiguiente==2) $('.nav-tabs a[href="#coautor"]').tab('show');
	if(tabSiguiente==3) $('.nav-tabs a[href="#files"]').tab('show');
	//if(tabSiguiente==4) $('.nav-tabs a[href="#files"]').tab('show');
		
}

function presentarPaper(idPaper){	
	var nombreDiv = "divPresentar" + idPaper;	
	document.getElementById(nombreDiv).innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	presentarPaperAjax(idPaper, nombreDiv);
}

function presentarPaperAjax(idPaper, nombreDiv){
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	var nombreDiv = "divPresentar" + idPaper;
	parametros = "idPaper="+idPaper+"&aleatorio="+aleatorio;  
	url = "guardarPresentacionAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById(nombreDiv).innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
}

function generarCertificado(){	
	var tipoDoc = frmGenerar.tipoDocumento.value;
	var numDoc = frmGenerar.numeroDocumento.value;
	var nombreDiv = "divCertificado";
	
	if (numDoc==null){
		alert("Id. Number is null. Please insert your Id. Number.");		
		return false;
	}
	if (numDoc==""){
		alert("Id. Number is Empty. Please insert your Id. Number.");		
		return false;
	}
	
	document.getElementById(nombreDiv).innerHTML = "<img src='imagenes/cargando.gif' width='32' height='32' />";
	generarCertificadoAjax(tipoDoc, numDoc, nombreDiv);
}

function generarCertificadoAjax(tipoDoc, numDoc, nombreDiv){
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();     	
	parametros = "tipoDoc="+tipoDoc+"&numDoc="+numDoc+"&aleatorio="+aleatorio;  
	url = "generarCertificadoAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById(nombreDiv).innerHTML = "<img src='imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
}

function activarAsistente(idAsistente){	
	var nombreDiv = "divPresentar" + idAsistente;	
	document.getElementById(nombreDiv).innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	activarAsistenteAjax(idAsistente, nombreDiv);
}

function activarAsistenteAjax(idAsistente, nombreDiv){
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	var nombreDiv = "divPresentar" + idAsistente;
	parametros = "idAsistente="+idAsistente+"&aleatorio="+aleatorio;  
	url = "activarAsistenteAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById(nombreDiv).innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
}

function asignarAutor() {
	valor = frmRegistro.search_autor.value;
	datos = valor.split("-")
	id = datos[0];
	
	asignarAutorAjax(id);
}

function asignarAutorAjax(idAsistente){
	aleatorio=Math.random(); 
  	ajax = nuevoAjax();   
  	var nombreDiv = "divResultadoBusqueda" ;
	parametros = "id="+idAsistente+"&aleatorio="+aleatorio;  
	url = "asignarAutorAjax.jsp";  
	ajax.open("POST",url,true);
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');   
	ajax.send(parametros);
	
	ajax.onreadystatechange=function()
	{
	  if (ajax.readyState==4)
	  {
	    if (ajax.status == 200)
	    {          	       	 
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	    else
	    {    
	        document.getElementById(nombreDiv).innerHTML = ajax.responseText;
	    }
	  } 
	  else
	  {
	    document.getElementById(nombreDiv).innerHTML = "<img src='../imagenes/cargando.gif' width='32' height='32' />";
	  }
	};
}