
<%@page import="servicios.Bodega"%>
<%@page import="servicios.Producto"%>
<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //HttpSession session = (HttpSession) request.getSession(); %>
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
                    Compra Cliente
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
                            String ciudad = s.ciudadUsuario(usuario);
                            session.setAttribute("session_ciudad", ciudad);

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

            <div id="servicio">
                <form>
                    Bodega:
                    <select name="bodegaID_compra">
                        <%
                            List<Bodega> bodega = s.bodegasCiudad(ciudad);
                            for (Bodega b : bodega) {
                        %>
                        <option value="<%=b.getBodegaID()%>"><%=b.getBodega()%></option>
                        <%                            }
                        %>
                    </select>
                    <br><br>


                    Producto:
                    <select name="productoID_compra">
                        <%
                            for (Contenedor c : datos) {

                        %>

                        <option value="<%=c.getProductoID()%>"><%=c.getProducto()%></option>

                        <%                            }
                        %>
                    </select>
                    <br><br>

                    Cantidad:
                    <input type="number" name="cantidad_compra" required="" min="0" value="0">
                    <input type="submit" name="accion" value="comprar">

                </form>

                <%
                    String accion = request.getParameter("accion");
                    if (accion.equals("comprar")) {
                        //captura el nmbre del producto igual al id seleccionado en el combo
                        String productoID = request.getParameter("productoID_compra");
                        for (Contenedor c : datos) {
                            if (c.getProductoID().equals(productoID)) {
                                session.setAttribute("session_producto", c.getProducto());
                                session.setAttribute("session_productoID", c.getProductoID());
                                break;
                            }
                        }

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
                    <jsp:include page="../../include/noPuedeComprar.jsp" flush="true" /><br>
                    <form>
                        Puede revisar el mismo producto en otra bodega:
                        <input type="submit" name="accion" value="vamos">
                    </form>
                </div>


                <%                    }
                    }
                %>
            </div>
        </div>

        <div id="footer">
            <section>
                <jsp:include page="../../include/footer.jsp" flush="true" />
            </section>
        </div>


    </body>
</html>