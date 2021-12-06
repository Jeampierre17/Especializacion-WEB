<%-- 
    Document   : ClientesDAODelete
    Created on : 1 oct. 2021, 21:22:06
    Author     : carlos
--%>

<%@page import="ar.org.centro8.curso.java.web.entities.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.utils.html.HtmlTable"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.web.repositories.interfaces.I_ClienteRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ClienteRepository cr=new ClienteRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Cliente</title>
        <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div id="title">
            <h1>Se borrara un cliente!</h1>
        </div>
        <div id="tabla">
            <% 
                //out.println(cr.getById(Integer.parseInt(request.getParameter("id"))));
                List<Cliente>list=new ArrayList();
                list.add(cr.getById(Integer.parseInt(request.getParameter("id"))));
                out.println(new HtmlTable().getTable(list));
            %>
        </div>
        <div id="form">
            Desea Borrar?
            <form action="ClientesDAO.jsp">
                <input type="text" name="borrar" value="no" hidden/>
                <input type="submit" value="No"/>
            </form>
            <form action="ClientesDAODelete2.jsp"> 
                <input type="text" name="borrar" value="si" hidden/>
                <input type="text" name="id" value="<%out.println(request.getParameter("id"));%>" hidden/>
                <input type="submit" value="Si"/>
            </form>
            
            <%
                String borrar=request.getParameter("borrar");
                if(borrar!=null && borrar.equals("si")){
                    System.out.println("***************************");
                    System.out.println("***************************");
                    cr.remove(cr.getById(Integer.parseInt(request.getParameter("id"))));
                    System.out.println("***************************");
                    System.out.println("***************************");
                }
            %>
        </div>
    </body>
</html>
