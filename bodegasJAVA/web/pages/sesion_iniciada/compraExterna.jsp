
<%@page import="servicios.Bodega"%>
<%@page import="servicios.Producto"%>
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
                    Compra Externa Cliente
                </center>
            </div>

        </header>
        <div id="nav">
            <nav>
                <ul>
                    <li><a href="Controlador?accion=inicioCliente">Inicio Cliente</a></li>
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
                            String ciudad = "";
                            String producto = (String) session.getAttribute("session_producto");

                            List<Contenedor> datos = s.getDatosXCiudad(ciudad, producto);
                            for (Contenedor c : datos) {
                                if (!c.getCiudad().equals((String) session.getAttribute("session_ciudad"))) {
                        %>
                        <tr>

                            <td><%=c.getBodega()%></td>
                            <td><%=c.getCiudad()%></td>
                            <td><%=c.getProducto()%></td>
                            <td><%=c.getPrecio()%></td>
                            <td><%=c.getStock()%></td>
                        </tr>
                        <% }
                            }%>
                    </tbody>
                </table>
            </div>

            <div id="servicio">
                <form>
                    Bodega:
                    <select name="bodegaID_compra">
                        <%
                            for (Contenedor b : datos) {
                                if (producto.equals(b.getProducto())) {
                                    if (!b.getCiudad().equals((String) session.getAttribute("session_ciudad"))) {

                        %>
                        <option value="<%=b.getBodegaID()%>"><%=b.getBodega()%></option>
                        <%
                                    }
                                }
                            }
                        %>
                    </select>
                    <br><br>


                    Producto:
                    <div id="alerta">
                        <%= session.getAttribute("session_producto")%>
                    </div>
                    <br><br>

                    Cantidad:
                    <input type="number" name="cantidad_compra" required="" min="0" value="0">
                    <input type="submit" name="accion" value="comprar">

                </form>

                <%
                    String accion = request.getParameter("accion");
                    if (accion.equals("comprar")) {
                        String productoID = (String) session.getAttribute("session_productoID");
                        String bodegaID = request.getParameter("bodegaID_compra");
                        Integer cantidad = Integer.parseInt(request.getParameter("cantidad_compra"));

                        if (s.verificarCompra(bodegaID, productoID, cantidad)) {
                            if (s.comprar(bodegaID, productoID, cantidad)) {

                %>
                <br>
                <div id="bien">
                    <jsp:include page="../../include/puedeComprar.jsp" flush="true" />
                </div>

                <%                }
                } else {
                %>
                <br>
                <div id="alerta">
                    <jsp:include page="../../include/noPuedeComprar.jsp" flush="true" />

                </div>

                <%                    }
                    }
                %>
            </div>






        </div>



    </body>
</html>
