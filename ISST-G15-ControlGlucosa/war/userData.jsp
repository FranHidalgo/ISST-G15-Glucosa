<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TMPS00015</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Economica' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<link type="text/css" href="css/jquery.simple-dtpicker.css" rel="stylesheet" />
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">

<!--menu-->
<link rel="stylesheet" href="css/superfish.css" media="screen">
<script src="js/jquery-1.9.0.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.mtz.monthpicker.js"></script>
<script type="text/javascript" src="js/jquery.simple-dtpicker.js"></script>

<script>

		// initialise plugins
		jQuery(function(){
			jQuery('#example').superfish({
				//useClick: true
			});
		});

		</script>
</head>
<body>


<div class="wrap1">
<div class="container">
  <div class="header">
    <div class="logo">
      <h1><a href="paciente.html">Control de Glucosa</a></h1>
      <h2>Consulta de datos</h2>
    </div>
    <div class="menu">
      <ul class="sf-menu" id="example">
        <li><a href="userData.jsp">Consulta de datos</a></li>
        <li class="current"> <a href="enterData.html">Formulario</a></li>
        <li> <a href="userProfile.jsp">Perfil</a></li>
        <li> <a href="logOut">Log Out</a></li>
      </ul>
    </div>
  </div>
  <div class="clearing"></div>
</div>
<div class="clearing"></div>
</div>
<!--header-wrap-->
<div class="wrap2">
<div class="container">
	
	<style>
	.demo {
		width:100%;
		height:100%;
		border:1px solid #C0C0C0;
		border-collapse:collapse;
		padding:5px;
	}
	.demo th {
		border:1px solid #C0C0C0;
		padding:5px;
		background:#F0F0F0;
	}
	.demo td {
		border:1px solid #C0C0C0;
		text-align:left;
		padding:5px;
	}
</style>

<p>Estas son sus medidas de Glucosa</p>
<p>Elegir entre día concreto o mes.</p>
    </br>
<select id = "diaomes" onChange="mostrar(this.value);">
	<option value="mes">Mes</option>
	<option value="dia">Día</option>
	  </select>

<script>
function mostrar(val) {
if (val=="dia"){
     $("#dia").show();
    $("#mes").hide();}
	else{
	$("#dia").hide();
    $("#mes").show();}
	}
</script>
    </br>
    </br>

<p> Seleccione fecha de la medición</p>
  
  <div id="mes">
 <input type="text" id="fechaMedicionmes" name="datemes" value="" onchange="obtenerFecha()">
<script type="text/javascript">
	$(function(){
	$('*[name=datemes]').monthpicker();
    });
	</script></div>
  
  <div id="dia" style="display:none">
   <input type="text" id="fechaMediciondia" name="datedia" value="" onchange="obtenerFecha()">
<script type="text/javascript">
	$(function(){
	$('*[name=datedia]').appendDtpicker();
    });
	</script></div>
    </br>
    </br>

<script src="http://d3js.org/d3.v3.min.js"></script>

<div id="tablaDatos"></div>
<div id="graficaDatos"></div>


//tablaDatos 
<script type="text/javascript">    
	//Imprimir por pantalla la tabla con el CSV
	d3.text("datosGlucosaCSV.csv", function(datasetText) {
	var parsedCSV = d3.csv.parseRows(datasetText);
	var sampleHTML = d3.select("#tablaDatos")
	    .append("table")
	    .style("border-collapse", "collapse")
	    .style("border", "2px black solid")
	    .selectAll("tr")
	    .data(parsedCSV)
	    .enter().append("tr")
	    .selectAll("td")
	    .data(function(d){return d;})
	    .enter().append("td")
	    .style("border", "1px black solid")
	    .style("padding", "5px")
	    .on("mouseover", function(){d3.select(this).style("background-color", "aliceblue")})
	    .on("mouseout", function(){d3.select(this).style("background-color", "white")})
	    .text(function(d){return d;})
	    .style("font-size", "12px");
	});

    </script>

	<script type="text/javascript">
	function obtenerFecha(){
	var compruebames = document.getElementById("diaomes").value;
	if (compruebames == "mes"&&document.getElementById("fechaMedicionmes").value!=""){
			var fecha = $('#fechaMedicionmes').monthpicker('getDate');
			//mostrarTablaMensual(fecha);
			//alert("Mostrando Tabla de fecha "+fecha+ " En la opción " + compruebames);
        }
		  else if (compruebames == "dia"){
			var fecha = $('#fechaMediciondia').handleDtpicker('getDate');
			//mostrarTablaDiaria(fecha);
			//alert("Mostrando Tabla de fecha "+fecha+ " En la opción " + compruebames);
			}
	}
	</script>

		
<div class="clearing"></div>
</div>
</div>
<!--wrap4-->
<div class="wrap3">
	<div class="container">
	  <div class="footer"> Grupo 15 ISST - Sistema de Control de Glucosa 
	  <div id= "fecha">
			<script type="text/javascript">
				var fecha = new Date();
				var date = fecha.toLocaleDateString("en-US");
				var hora = " " + fecha.getHours() + ":" + fecha.getMinutes() 
				document.getElementById("fecha").innerHTML = date + hora;
			</script>
		</div>
		</div>
	<div class="clearing"></div>
</div>
</div>
<div class="shadows2">
</div>
</body>
</html>
