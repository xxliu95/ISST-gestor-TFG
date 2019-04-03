<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Professor View</title>
</head>
<body>
	<shiro:guest>
		<h2>Login</h2>
		<form action="LoginServlet" method="post">
			Email: <input type="text" name="email" placeholder="Email" />
			Password: <input type="password" name="password"
				placeholder="Password" />
			<button type="submit">Login</button>
		</form>
	</shiro:guest>

	<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
	<h2>
			Vista de
			<shiro:principal />
		</h2>
 
		<p>Nombre: ${professor.name }</p>
		<p>Email: ${professor.email }</p>

		<h3>Listado de tfgs</h3>
		<table border="1">
			<tr>
				<th>Título</th>
				<th>Email alumno</th>
				<th>Nombre del alumno</th>
				<th>Email tutor</th>
				<th>Nombre del tutor</th>
				<th>Estado del TFG</th>
				<th>Memoria</th>
				<th>Acción requerida</th>
			</tr>

			<c:forEach items="${professor.advisedTFGs}" var="tfgi">
				<tr>
					<td>${tfgi.title }</td>
					<td>${tfgi.email }</td>
					<td>${tfgi.name }</td>
					<td>${tfgi.advisor.email }</td>
					<td>${tfgi.advisor.name }</td>
					<td>${tfgi.status }</td>
					<td><c:if test="${tfgi.status > 3}">
							<form action="ServeFileServlet">
								<input type="hidden" name="email" value="${tfgi.email}" />
								<button type="submit">Descargar</button>
							</form>
						</c:if></td>
					<td><c:if test="${tfgi.status == 1}">
							<form action="Form2ProfessorServlet" method="post">
								<input type="hidden" name="email" value="${tfgi.email}" />
								<button type="submit">Aceptar tfg</button>
							</form>
						</c:if></td>
				</tr>
			</c:forEach>

		</table> 
	</shiro:user>
</body>
</html>