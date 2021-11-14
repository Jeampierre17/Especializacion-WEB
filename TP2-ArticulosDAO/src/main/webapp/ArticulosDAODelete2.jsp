<%@page import="ar.org.centro8.curso.java.web.repositories.jdbc.*"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.interfaces.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ArticuloRepository ar=new ArticuloRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Borrar Artículo</title>
<link href="css/estilos.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="title">
		<h1>¡Eliminó un artículo!</h1>
	</div>

	<div id="form">
		<%
                try {
                  	ar.remove(ar.getById(Integer.parseInt(request.getParameter("id"))));
                    out.println("<h3>Se borro un artículo</h3>");
                } catch (Exception e) {
                    System.out.println(e);
                    out.println("<h3>No se borro el artículo</h3>");
                }
            %>
	</div>

	<div id="form">
		<form action="ArticulosDAO.jsp">
			<input type="submit" value="Volver" class="boton"/>
		</form>
	</div>
</body>
</html>
