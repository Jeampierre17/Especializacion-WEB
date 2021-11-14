<%@page import="ar.org.centro8.curso.java.web.entities.Articulo"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.jdbc.ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.web.enums.TipoArticulo"%>
<%@page import="ar.org.centro8.curso.java.web.enums.EspecieRecomendada"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.interfaces.I_ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.utils.html.HtmlTable"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.jdbc.*"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.interfaces.*"%>
<%@page import="ar.org.centro8.curso.java.web.entities.*"%>
<%@page import="ar.org.centro8.curso.java.web.enums.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ArticuloRepository ar=new ArticuloRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PetShop</title>
<link href="css/estilos.css" type="text/css" rel="stylesheet" />
</head>
<body>

        
	<div id="title">
		<h1>Mantenimiento de Artículos</h1>
	</div>

	<div id="form">
		<form>
			<table>
				<tr>
					<td>Nombre:</td>
					<td><input type="text" name="nombre" required maxlength="20"
						style="width: 200px;" /></td>
				</tr>

				<tr>
					<td>Descripción:</td>
					<td><input type="text" name="descripcion" required
						style="width: 300px;" /></td>
				</tr>
				<tr>
					<td>Tipo Artículo:</td>
					<td><select name="tipo" style="width: 208px;">
							<%
							for (TipoArticulo t : TipoArticulo.values()) {
								out.println("<option value='" + t + "' >" + t + "</option>");
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Especie Recomendada:</td>
					<td><select name="especieRecomendada" style="width: 208px;">
							<%
							for (EspecieRecomendada e : EspecieRecomendada.values()) {
								out.println("<option value='" + e + "' >" +e + "</option>");
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Costo:</td>
					<td><input type="number" name="costo" value="0" required
						style="width: 70px;" /></td>
				<tr>
					<td>Precio:</td>
					<td><input type="number" name="precio" value="0" required
						style="width: 70px;" /></td>
				<tr>
					<td>Stock:</td>
					<td><input type="number" name="stock" value="0" required
						style="width: 70px;" /></td>
				<tr>
					<td>Stock Mínimo:</td>
					<td><input type="number" name="stockMinimo" value="0" required
						style="width: 70px;" /></td>
				<tr>
					<td>Stock Máximo</td>
					<td><input type="number" name="stockMaximo" value="0" required
						style="width: 70px;" /></td>
				<tr>
					<td>Comentarios:</td>
					<td><input type="text" name="comentarios" maxlength="255"
						style="width: 400px;" /></td>
				</tr>

				<tr>
					<td>Activo:</td>
				</tr>
				<tr>
					<td><input type="radio" name="activo" value="true">Sí<br>
						<input type="radio" name="activo" value="false">No<br>

					</td>
				</tr>
				<tr>
					<td><input type="reset" value="Limpiar" class="boton" /></td>
					<td><input type="submit" value="Enviar" class="boton" /></td>
				</tr>

			</table>
		</form>
	</div>

	<%
            try{
            	//articulo
        		String nombre = request.getParameter("nombre"); 						//required
        		String descripcion = request.getParameter("descripcion");
        		//if (descripcion==null) descripcion="";//required
        		TipoArticulo tipo = TipoArticulo.valueOf(request.getParameter("tipo"));
        		EspecieRecomendada especie = EspecieRecomendada.valueOf(request.getParameter("especieRecomendada")); //required
        		double costo = 0; 														//required
        		if(request.getParameter("costo")!=null) costo=Double.parseDouble(request.getParameter("costo"));
        		double precio = 0; //required
        		if(request.getParameter("precio")!=null) precio=Double.parseDouble(request.getParameter("precio"));
        		int stock = 0; //required
        		if(request.getParameter("stock")!=null) stock=Integer.parseInt(request.getParameter("stock"));
        		int stockMinimo = 0; //required
        		if(request.getParameter("stockMinimo")!=null) stockMinimo=Integer.parseInt(request.getParameter("stockMinimo"));
        		int stockMaximo = 0; //required
        		if(request.getParameter("stockMaximo")!=null) stockMaximo=Integer.parseInt(request.getParameter("stockMaximo"));
        		String comentarios = request.getParameter("comentarios");
        		boolean activo=Boolean.valueOf(request.getParameter("activo"));
        	
        		if (nombre != null && descripcion != null && especie != null && costo !=0 && precio !=0 && stock !=0 && stockMinimo !=0 && stockMaximo !=0) {

        		System.out.println("Prueba Ok");

    			Articulo articulo = new Articulo(nombre, descripcion, tipo, especie, costo, precio, stock, stockMinimo,
    			stockMaximo, comentarios, activo);
    			ar.save(articulo);
    			if (articulo.getId() != 0) {
    		out.println("<div class='info'>¡Se pudo guardar un articulo con id=" + articulo.getId() + "!</div>");
    			} else {
    		out.println("<div class='error'>¡No se pudo guardar!</div>");
    			}
        		}else{
                    out.println("<div class='error'>¡Debe completar todos los parametros!</div>");  

        		}

    	} catch (Exception e) {
    		out.println("<div class='error'>¡Debe completar todos los parametros requeridos!</div>");
    	}
    	%>




	<div id="tabla">

		<form>
			Nombre Articulo: <input type="text" name="buscarNombreArticulo"
				value="" />
		</form>

		<%
            
                out.println(
                		new HtmlTable<Articulo>().getTable(ar.getLikeNombre(request.getParameter("buscarNombreArticulo")), 
                				"ArticulosDAODelete.jsp" ));
                		
            %>
	</div>
</body>
</html>
