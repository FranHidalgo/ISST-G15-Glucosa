<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TMPS00015</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Economica'
	rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Lato'
		rel='stylesheet' type='text/css'>
		<!--menu-->
		<link rel="stylesheet" href="css/superfish.css" media="screen">
			<script src="js/jquery-1.9.0.min.js"></script>
			<script src="js/hoverIntent.js"></script>
			<script src="js/superfish.js"></script>
			<script>
				// initialise plugins
				jQuery(function() {
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
					<h1>
						<a href="medico.html">Control de Glucosa</a>
					</h1>
					<h2>Consulta de datos</h2>
				</div>
				<div class="menu">
					<ul class="sf-menu" id="example">
						<li><a href="doctorData.jsp">Consulta de datos</a></li>
						<li><a href="medicoProfile.jsp">Perfil</a></li>
						<li><a href="logOut">Log Out</a></li>
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
		<form action="seleccionaPaciente" action="SeleccionaPaciente"
				method="post">
				<select name="paciente" id="paciente">
					<c:forEach items="${pacientes}" var="paciente">
						<option><c:out value="${paciente}" /></option>
					</c:forEach>
				</select>
				<button type="submit">Seleccionar paciente</button>

			</form>
			
			<div class="clearing"></div>
		</div>
	</div>
	<!--wrap4-->
	<div class="wrap3">
		<div class="container">
			<div class="footer">
				Grupo 15 ISST - Sistema de Control de Glucosa
				<div id="fecha">
					<script type="text/javascript">
						var fecha = new Date();
						var date = fecha.toLocaleDateString("en-US");
						var hora = " " + fecha.getHours() + ":"
								+ fecha.getMinutes()
						document.getElementById("fecha").innerHTML = date
								+ hora;
					</script>
				</div>
			</div>
			<div class="clearing"></div>
		</div>
	</div>
	<div class="shadows2"></div>
</body>
</html>