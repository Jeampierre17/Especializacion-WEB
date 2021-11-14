<%@page import="ar.org.centro8.curso.java.web.entities.Articulo"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.utils.html.HtmlTable"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.jdbc.ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.interfaces.I_ArticuloRepository"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.interfaces.I_ClienteRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ArticuloRepository ar=new ArticuloRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Artículo</title>
        <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div id="title">
            <h1>¡Se borrará un artículo!</h1>
        </div>
        <div id="tabla">
            <% 
                //out.println(cr.getById(Integer.parseInt(request.getParameter("id"))));
                List<Articulo>list=new ArrayList();
                list.add(ar.getById(Integer.parseInt(request.getParameter("id"))));
                out.println(new HtmlTable<Articulo>().getTable(list));
            %>
        </div>
        <div id="form">
            ¿Seguro desea borrar?
            <form action="ArticulosDAO.jsp">
                <input type="text" name="borrar" value="no" hidden/>
                <input type="submit" value="No" class="boton"/>
            </form>
            <form action="ArticulosDAODelete2.jsp"> 
                <input type="text" name="borrar" value="si" hidden/>
                <input type="text" name="id" value="<%out.println(request.getParameter("id"));%>" hidden/>
                <input type="submit" value="Si" class="boton"/>
            </form>
            
            <%
                String borrar=request.getParameter("borrar");
                if(borrar!=null && borrar.equals("si")){
                    System.out.println("***************************");
                    System.out.println("***************************");
                    ar.remove(ar.getById(Integer.parseInt(request.getParameter("id"))));
                    System.out.println("***************************");
                    System.out.println("***************************");
                }
            %>
        </div>
    </body>
</html>
