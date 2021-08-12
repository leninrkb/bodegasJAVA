
<%@page import="servicios.Producto"%>
<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession session2 = (HttpSession) request.getSession(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/template.css">
        <title>superbodegas</title>
    </head>
    <body>
        <div id="nav">
            <nav>
                <ul>
                    <li><a href="Controlador?accion=cerrarsesion">Cerrar Sesion</a></li>
                </ul>
            </nav>
        </div>

        <div id="contenido">
            <center>
                sesion cliente iniciada como: 
                <%
                    String usuario = (String)session2.getAttribute("session_usuario");
                %>
                <%=usuario%>
            </center>

            <div>
                <form id="buscar">
                    <input type="text" name="producto" placeholder="ej:galletas">
                    <input type="submit" name="accion" value="buscar">
                </form>
            </div>

            <div id="tabla">

                <table>

                    <thead>
                    <th>Bodega</th>
                    <th>Ciudad</th>
                    <th>Producto</th>
                    <th>Precio</th>
                    </thead>
                    <tbody>
                        <%
                            Servicios s = new Servicios();
                            String producto = request.getParameter("producto");
                            String ciudad = s.ciudadUsuario(usuario);

                            List<Contenedor> datos = s.getDatosXCiudad(ciudad, producto);
                            for (Contenedor c : datos) {
                        %>
                        <tr>
                            <td><%=c.getBodega()%></td>
                            <td><%=c.getCiudad()%></td>
                            <td><%=c.getProducto()%></td>
                            <td><%=c.getPrecio()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

            </div> 

            <div id="servicio">
                <form>
                    Producto:
                    <select name="producto">
                        <%
                            for (Contenedor c : datos) {
                        %>
                        <option><%=c.getProducto()%></option>
                        <%                            }
                        %>
                    </select>
                    <br><br>

                    <input type="submit" name="accion" value="comprar">
                </form>
            </div>


        </div>

        <div id="footer">
            <section>
                <jsp:include page="../../include/footer.jsp" flush="true" />
            </section>
        </div>


    </body>
</html>