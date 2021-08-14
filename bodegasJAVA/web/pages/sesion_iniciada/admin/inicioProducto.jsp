<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/template.css">
        <title>superbodegas</title>
    </head>
    <body>
        <header>
            <div id="header">
                <center>
                    Administrador Productos
                </center>
            </div>
        </header>
        <div id="nav">
            <nav>
                <ul>
                    <li><a href="Controlador?accion=adminBodegas">Bodegas</a></li>
                    <li><a href="Controlador?accion=adminProductos">Productos</a></li>
                    <li><a href="Controlador?accion=cerrarsesion">Cerrar Sesion</a></li>
                    <center>
                        <li><a href="#">
                                Bienvenid@:
                                <%
                                    String usuario = (String) session.getAttribute("session_usuario");
                                %>
                                <%=usuario%></a></li>   
                    </center>
                </ul>
            </nav>
        </div>

        <div id="contenido">
            <div>
                <form id="buscar">
                    <input type="text" name="producto_buscar" placeholder="ej:galletas">
                    <input type="submit" name="accion" value="buscar">
                    <br><br>
                    <div>
                        <input type="submit" name="accion" value="Refrescar Datos">
                    </div>

                </form>

            </div>

            <div id="tabla">

                <table>

                    <thead>

                    <th>Bodega</th>
                    <th>Ciudad</th>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    </thead>
                    <tbody>
                        <%
                            Servicios s = new Servicios();
                            String producto = request.getParameter("producto_buscar");
                            //admin puede ver todo, no hace falta recuperar la ciudad
                            String ciudad = "";
                            

                            List<Contenedor> datos = s.getDatosXCiudad(ciudad, producto);
                            for (Contenedor c : datos) {
                        %>
                        <tr>

                            <td><%=c.getBodega()%></td>
                            <td><%=c.getCiudad()%></td>
                            <td><%=c.getProducto()%></td>
                            <td><%=c.getPrecio()%></td>
                            <td><%=c.getStock()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

            </div> 





        </div>


        <div id="footer">
            <section>
                <jsp:include page="../../include/footer.jsp" flush="true" />
            </section>
        </div>


    </body>
</html>
