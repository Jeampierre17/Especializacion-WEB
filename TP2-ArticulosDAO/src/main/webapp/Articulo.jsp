<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.connectors.Connector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetShop</title>
        <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div id="title">
            <h1>Artículos</h1>
        </div>
        
        <div id="form">
            <form>
                <table>
                    <tr><td>Nombre:             </td><td><input type="text" name="nombre"   required minlength="3" maxlength="40" style="width: 200px;" /></td></tr>
                    <tr><td>Descripción:           </td><td><input type="text" name="descripcion" style="width: 300px;" /></td></tr>
                         <tr><td>Tipo Artículo:      </td>
                        <td>
                            <select name="tipoArticulo" style="width: 208px;" >
                             <option value="" selected disabled >Selecciona aquí</option>
                                <option value="PRENDA" >PRENDA </option>
                                <option value="JUGUETE"  >JUEGUETE </option>
                                <option value="ALIMENTO"  >ALIMENTO</option>
                                <option value="SNACK"  >SNACK</option>
                                <option value="ACCESORIO"  >ACCESORIO </option>
                                <option value="CORREAS">CORREAS</option>
                                <option value="MEDICAMENTO">MEDICAMENTO</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td>Especie Recomendada:      </td>
                        <td>
                            <select name="especieRecomendada" style="width: 208px;" >
                           		 <option value="" selected disabled >Selecciona aquí</option>
                                <option value="CANINO" >CANINO</option>
                                <option value="FELINO"  >FELINO </option>
                                <option value="AVEZ"  >AVEZ  </option>
                                <option value="PEZ"  >PEZ </option>
                                <option value="ROEDOR">ROEDOR</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td>Costo: </td><td><input type="number"   name="costo"   value="0"   required    style="width: 70px;"  /></td>
                    <tr><td>Precio: </td><td><input type="number"   name="precio"   value="0"   required    style="width: 70px;"  /></td>
                    <tr><td>Stock: </td><td><input type="number"   name="stock"   value="0"   required    style="width: 70px;"  /></td>
                    <tr><td>Stock Mínimo: </td><td><input type="number"   name="minimo"   value="0"   required    style="width: 70px;"  /></td>
                    <tr><td>Stock Máximo </td><td><input type="number"   name="maximo"   value="0"   required    style="width: 70px;"  /></td>
                        <tr>
                            <td>
                                Activo: 
                           </td>
                        </tr>
                         <tr>
                            <td>
                                <input type="radio" name="Activo" value="true">Si<br><!-- comment -->
                                <input type="radio" name="Activo" value="False">No<br><!-- comment -->

                            </td>
                        </tr>
                     <tr><td>Comentarios:        </td><td><input type="text"  name="comentarios"  minlength="0" maxlength="255" style="width: 400px;" /></td></tr>
                    <tr>
                        <td><input type="reset"  value="Limpiar" class="boton"/></td>
                        <td><input type="submit" value="Enviar"  class="boton"/></td>
                    </tr>
                     </table>
                    </form>
                    </div>
                    
                  
        
        <%
            //Articulo
            String nombre=request.getParameter("nombre");    
            String descripcion=request.getParameter("descripcion");  //required
            String tipoArticulo=request.getParameter("tipoArticulo");                    //required
            String especieRecomendada=request.getParameter("especieRecomendada");               //requiredired
            int costo= 0;
                    if(request.getParameter("costo")!=null) costo=Integer.parseInt(request.getParameter("costo"));
            int precio= 0;
                    if(request.getParameter("precio")!=null) precio=Integer.parseInt(request.getParameter("precio"));
            int stock= 0;
                    if(request.getParameter("stock")!=null) stock=Integer.parseInt(request.getParameter("stock"));
            int sMinimo= 0;
                    if(request.getParameter("minimo")!=null) sMinimo=Integer.parseInt(request.getParameter("minimo"));
            int sMaximo= 0;
                    if(request.getParameter("maximo")!=null) sMaximo=Integer.parseInt(request.getParameter("maximo"));
            String comentarios=request.getParameter("comentarios");
            boolean Activo= true;
           	 		if(request.getParameter("Activo")!=null) Activo=Boolean.valueOf(request.getParameter("Activo")).booleanValue();
            
            
            String sqlArticulo="insert into articulos (nombre,descripcion, tipo, especieRecomendada,costo,precio,stock,stockMinimo, stockMaximo,comentarios, activo) values (?,?,?,?,?,?,?,?,?,?,?)";
            
            if(nombre!=null && descripcion !=null &&  especieRecomendada !=null && costo !=0 && precio !=0 && stock !=0 && sMinimo !=0 && sMaximo !=0){
					
            	System.out.println("Prueba Ok");
            	
                try (Connection conn= Connector.getConnection()){
                    PreparedStatement ps= conn.prepareStatement(sqlArticulo,PreparedStatement.RETURN_GENERATED_KEYS);
                    
                    ps.setString(1,nombre);
                    ps.setString(2,descripcion);
                    ps.setString(3,tipoArticulo);                    
                    ps.setString(4,especieRecomendada);
                    ps.setInt(5,costo);
                    ps.setInt(6,precio);
                    ps.setInt(7,stock);
                    ps.setInt(8,sMinimo);
                    ps.setInt(9,sMaximo);
                    ps.setString(10,comentarios);
                    ps.setBoolean(11, Activo);
                    
                    ps.execute();
                    System.out.println("Prueba Ok, ok");
                    
                    int idArt=0;
                    ResultSet rs=ps.getGeneratedKeys();
                    if(rs.next()) idArt=rs.getInt(1);
                    if(idArt!=0){
                        out.println("<div class='info'>¡Se ha guardado el artículo con el ID: "+idArt+" !</div>"); 
                        
                    }else{
                        out.println("<div class='error'>Debe completar todos los parametros!</div>");  
                    }

                } catch (Exception e) {
                    System.out.println(e);
                    out.println("<div class='error'>¡No se pudo guardar!</div>");
                }
            }else{
                out.println("<div class='error'>¡Debe completar todos los parametros!</div>");  
                System.out.println("Prueba Falla");
            }
        %>
        
        <div id="tabla">
            
            <form>
                Nombre Artículo: 
              
     		 <input type="search" name="buscarArticulo" placeholder="Buscar Articulo..." />
            </form>
            
            <table>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Tipo Articulo</th>
                    <th>Especie Recomendada</th>
                    <th>Costo</th>
                    <th>Stock</th>
                    <th>Stock Mínimo</th>
                    <th>Stock Máximo</th>
                    <th>Comentarios</th>
                    <th>Activo</th>
                </tr>
                <%
                    String buscarArticulo=request.getParameter("buscarArticulo");
                    try (ResultSet rs=Connector
                            .getConnection()
                            .createStatement()
                            .executeQuery("select * from articulos where nombre like '%"+buscarArticulo+"%'")
                    ){
                        while(rs.next()){
                            out.println("<tr>");
                            out.println("<td>"+rs.getInt("id")+"</td>");
                            out.println("<td>"+rs.getString("nombre")+"</td>");
                            out.println("<td>"+rs.getString("descripcion")+"</td>");
                            out.println("<td>"+rs.getString("tipo")+"</td>");
                            out.println("<td>"+rs.getString("especieRecomendada")+"</td>");
                            out.println("<td>"+rs.getInt("costo")+"</td>");
                            out.println("<td>"+rs.getInt("stock")+"</td>");
                            out.println("<td>"+rs.getInt("stockMinimo")+"</td>");
                            out.println("<td>"+rs.getInt ("stockMaximo")+"</td>");
                            out.println("<td>"+rs.getString("comentarios")+"</td>");
                            out.println("<td>"+rs.getBoolean("activo")+"</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </table>
        </div>
    </body>
</html>
