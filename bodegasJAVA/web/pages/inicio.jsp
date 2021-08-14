
<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
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
                    Superbodegas
                </center>
            </div>

        </header>
        <div id="nav">
            <nav>
                <ul>
                    <li><a href="Controlador?accion=inicio">Inicio</a></li>
                    <li><a href="Controlador?accion=iniciosesion">Iniciar Sesion</a></li>
                </ul>
            </nav>
        </div>

        <div id="contenido">
            <div>
                <form id="buscar">
                    <input type="text" name="producto" placeholder="ej:galletas">
                    <input type="submit" name="accion" value="buscar">
                </form>
            </div>
            <center>
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
                                String producto = request.getParameter("producto");
                                Servicios s = new Servicios();
                                List<Contenedor> datos = s.getDatos(producto);
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
            </center>
        </div>

        <div id="footer">
            <section>
                <jsp:include page="../include/footer.jsp" flush="true" />
            </section>
        </div>


    </body>
</html>



