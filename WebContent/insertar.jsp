<%@page import="java.io.RandomAccessFile"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="com.mysql.cj.jdbc.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connectionDB.*"%>
<%@page  import="java.nio.file.Files"%>
<%@page  import="org.apache.poi.hwpf.extractor.WordExtractor"%>
<%@page  import="org.apache.poi.xwpf.extractor.XWPFWordExtractor"%>
<%@page  import="org.apache.poi.xwpf.usermodel.XWPFDocument"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Presentacion de archivos</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/tether.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<script src="js/bootstrap-select.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script src="js/i18n/defaults-*.min.js"></script>
<link rel="stylesheet" type="text/css"href="css/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"href="css/fondo.css" />
<title>Insert title here</title>
</head>
<body>
<%out.println("<form action='JustificacionVista.jsp' method='post'");
		out.println("<div class='form-group'>");
		out.println("<input id='hecho' class='btn btn-primary btn-lg' type='submit' value='regresar' name='Ok'/>");
		out.println("</div>");
		out.println("</form>");
		String proceso = "";
		
		if (request.getParameter("registrar").compareTo("registrar") == 0) {
			//Aquí obtenemos la ruta de la carpeta donde se encuentra el documento .
			String in = request.getParameter("registrar");
			//String in ="D:\\PROBLEMAS_2_DE _MERCADO.doc";
			System.out.println("request registrar" + in);
			 BaseDeDatos.conectar();
			 System.out.println("hola1");
			File file = new File(in);
			FileInputStream input = new FileInputStream(file);
			FileInputStream inputToSave = new FileInputStream(file);
			System.out.println("FileInputStream" + input);
			InputStream inputFile = input;
			System.out.println("InputStream" + inputFile);
			WordExtractor we = new WordExtractor(inputFile);
			String texto = we.getText();
			System.out.println(texto);
			BaseDeDatos.uploadDocument(1, inputToSave);
			BaseDeDatos.desconectar();
		}else{
	
			
		}
	%>

	<form action=insertar.jsp method=post>
	
	<label><H1>REGISTRO DE ALUMNOS</H1></label>
		<div class='form-group'>
			<label>CODIGO :</label><input class='form-control'
				aria-describedy='emailHelp' name=codigo type=text /><small
				class='form-text text-muted'>Ingrese el codigo del alumno</small>
		</div>

		<div class='form-group'>
			<label>NOMBRE : </label> <input class='form-control'
				aria-describedy='emailHelp' name=nombre type=text />				 <small
				class='form-text text-muted'>Ingrese el nombre del alumno</small>
		</div>

		<div class='form-group'>
			<label>APELLIDO : </label> <input class='form-control'
				aria-describedy='emailHelp' name=apellido type=text /> <small
				class='form-text text-muted'>Ingrese el apellido del alumno</small>
		</div>
		<div class='form-group'>
			<label>FECHA DE NACIMIENTO :</label> <input class='form-control'
				aria-describedy='emailHelp' name=fecha type=text /> <small
				class='form-text text-muted'>Ingrese la fecha de nacimiento del alumno</small>
		</div>

		<div class='form-group'>
			<label>DIRECCION : </label> <input class='form-control'
				aria-describedy='emailHelp' name=direccion type=text /> <small
				class='form-text text-muted'>Ingrese la direccion del alumno</small>
		</div>

		<div class='form-group'>
			<label>TELEFONO : </label> <input class='form-control'
				aria-describedy='emailHelp' name=telefono type=text /> <small
				class='form-text text-muted'>Ingrese el número de telefono del nuevo usuario</small>
		</div>

		<div class='form-group'>
			<label>CONTRASEÑA ::</label> <input class='form-control'
				aria-describedy='emailHelp' name=contrasena type=text /> <small
				class='form-text text-muted'>Ingrese la contraseña para el nuevo usuario</small>
		</div>
		<div class='form-group'>
		<input id='ibutton' class="btn btn-primary btn-lg" type='submit'	value='REGISTRAR' name='registrar'>
		</div>
		
	</form>





</body>
</html>