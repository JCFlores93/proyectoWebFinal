<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		    $('#insertar').click(function(){
			 $('#data').attr('action', 'insertar.jsp');
			});	
	});
</script>
</head>
<body>
		<form action='insertar.jsp' method='post' id='data'>
	<p>Ingrese el código del alumno :<input type='text' name='codigo'/></p>
	<div>
	<input type='file' accept = '.doc' id='seleccionar' class='btn btn-primary btn-lg'name='registrar' value='registrar'/>
	<input type='submit' id='insertar' class='btn btn-primary btn-lg' name='registrar' value='registrar'/>
	
	
	<input type='submit' id='modificar' class='btn btn-primary btn-lg' name='modificar' value='modificar'/>
	<input type='submit' id='eliminar' class='btn btn-primary btn-lg' name='eliminar' value='eliminar'/>
	</div>
	</form>
	<div class="container">
		<div class="row">
			<div class='col-md-12'>
				<H2>PRESENTE SU JUSTIFICACIÓN</H2>
			</div>
		</div>
		<div class="row">
			<div class='col-md-12'>
				<%	
		HttpSession sesion = request.getSession();
		String idAlumno = (String) sesion.getAttribute("usuario");
		String nomAlumno = (String) sesion.getAttribute("nombre");
		String apeAlumno = (String) sesion.getAttribute("apellido");
		out.println("<H4>BIENVENIDO :" + nomAlumno + "" + apeAlumno+"</H4></BR>");
		out.println("<H4>Usuario Activo:" + idAlumno+"</H4>");
		%>
			</div>
		</div>

		
		
		<div class="row">
			<div id="FirstText" class="col-md-12">
				<h2>Reglamento de Asistencia y Justificaciones</h2>
			</div>
		</div>
		<div class="row">
			<div id="SecondText" class="col-md-12">
				<h2>ARTÍCULO N° X1</h2>
			</div>
		</div>
		<div class="row">
			<div id="SecondText" class="col-md-12">
				<h3>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</h3>
			</div>
		</div>
		<div class="row">
			<div id="ThirdText" class="col-md-12">
				<h2>ARTÍCULO N° X2</h2>
			</div>
		</div>
		<div class="row">
			<div id="SecondText" class="col-md-12">
				<h3>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</h3>
			</div>
		</div>
		<div class="row">
			<div id="FourthText" class="col-md-12">
				<h2>ARTÍCULO N° X3</h2>
			</div>
		</div>
		<div class="row">
			<div id="FifthText" class="col-md-12">
				<h3>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</h3>
			</div>
		</div>
		<div class="row">
			<div id="SixthText" class="col-md-12">
				<h3>ARTÍCULO N° X4</h3>
			</div>
		</div>
		<div class="row">
			<div id="SeventhText" class="col-md-12">
				<h3>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</h3>
			</div>
		</div>
		

		
			
				
	<!--  		<div class="row">
					<img class="img-responsive col-md-8 col-md-offset-2"
						src="img/sist5.png">
				</div>
				<div class="row">
					<div id='fform' class="col-md-6">
						<form id="myform" method="post" action="principal.jsp"
							name="formLogin">
							<section class="content">
							<h2>DATOS DEL PERSONAL</h2>
							<span class="input input--hoshi"> <input
								class="input__field input__field--hoshi" type="text"
								id="input-1" name="usuario" value="" /> <label
								class="input__label input__label--hoshi input__label--hoshi-color-1"
								for="input-1"> <span
									class="input__label-content input__label-content--hoshi">CODIGO
										DEL PERSONAL</span>
							</label>
							</span> <br>
							<span class="input input--hoshi"> <input
								class="input__field input__field--hoshi" type="password"
								id="input-1" name="contrasena" /> <label
								class="input__label input__label--hoshi input__label--hoshi-color-1"
								for="input-1"> <span
									class="input__label-content input__label-content--hoshi">CONTRASEÑA</span>
							</label>
							</span>
							<br>

							<!-- <button type="button" class="btn btn-primary btn-lg">Large button</button>-->
			<!-- 				<input class="btn btn-primary btn-lg" id="boton" type="submit"
								name="enviar" value="enviar" /> </section>
						</form>
					</div>

					<div id='fform' class="col-md-6">
						<form id="myform" method="post" action="principalAdmin.jsp"
							name="formLogin">
							<section class="content">
							<h2>DATOS DEL ADMINISTRADOR</h2>
							<span class="input input--hoshi"> <input
								class="input__field input__field--hoshi" type="text"
								id="input-1" name="usuario" value="" /> <label
								class="input__label input__label--hoshi input__label--hoshi-color-1"
								for="input-1"> <span
									class="input__label-content input__label-content--hoshi">CODIGO
										DEL ADMINISTRADOR</span>
							</label>
							</span> <br>
							<span class="input input--hoshi"> <input
								class="input__field input__field--hoshi" type="password"
								id="input-1" name="contrasena" /> <label
								class="input__label input__label--hoshi input__label--hoshi-color-1"
								for="input-1"> <span
									class="input__label-content input__label-content--hoshi">CONTRASEÑA</span>
							</label>
							</span>
							<br>

							<!-- <button type="button" class="btn btn-primary btn-lg">Large button</button>-->
						<!--	<input class="btn btn-primary btn-lg" id="boton" type="submit"
								name="enviar" value="enviar" /> </section>
						</form>
					</div>-->
				</div>


			
</body>
</html>