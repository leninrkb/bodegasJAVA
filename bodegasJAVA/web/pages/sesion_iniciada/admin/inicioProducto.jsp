<%@page import="servicios.Producto"%>
<%@page import="servicios.Ciudad"%>
<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/template.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                        <li>
                            <a href="#">
                                Bienvenid@:
                                <%
                                    String usuario = (String) session.getAttribute("session_usuario");
                                %>
                                <%=usuario%>
                            </a>
                        </li>   
                    </center>
                </ul>
            </nav>
        </div>
        <div id="contenido">
            <form id="buscar">
                Producto:
                <input type="text" name="producto_buscar" placeholder="ej:galletas">
                <input type="submit" name="accion" value="buscar">
                <br><br>
                <div>
                    <input type="submit" name="accion" value="Refrescar Datos">
                </div>
            </form>
            <div id="tabla">
                <table>
                    <thead>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    </thead>
                    <tbody>
                        <%
                            Servicios s = new Servicios();
                            String producto = request.getParameter("producto_buscar");

                            List<Producto> datos = s.getProductos(producto);
                            for (Producto c : datos) {
                        %>
                        <tr>
                            <td><%=c.getId()%></td>
                            <td><%=c.getNombre()%></td>
                            <td><%=c.getPrecio()%></td>                          
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div id="servicio">
                Modifique un producto:<br><br>
                <form onsubmit="return enviar()">
                    Producto:<br>
                    <select name="productoID">
                        <%
                            for (Producto c : datos) {
                        %>
                        <option><%=c.getId()%></option>
                        <%
                            }
                        %>
                    </select><br><br>   
                    Nombre:<br>
                    <input type="text" name="productoNombre" value="" required=""><br><br> 
                    Precio:<br>
                    <input type="number" name="precio" value="" required="" min="0"><br><br> 
                    <input type="submit" name="accion" value="editar">
                </form><br>
                <%
                    if (request.getParameter("accion").equals("editar")) {
                        String id = request.getParameter("productoID");
                        String nombre = request.getParameter("productoNombre");
                        Integer precio = Integer.parseInt(request.getParameter("precio"));
                        if (s.editproducto(id, nombre, precio)) {
                %>
                <div id="bien">
                    <section>
                        <jsp:include page="../../../include/puedeComprar.jsp" flush="true" />
                    </section>
                </div>
                <%
                } else {
                %>
                <div id="mal">
                    <section>
                        <jsp:include page="../../../include/mal.jsp" flush="true" />
                    </section>
                </div>
                <%
                        }
                    }
                %>
                <br>
                Agregue un nuevo Producto:<br><br>
                <form>
                    Nombre:<br>
                    <input type="text" name="productoNombreNuevo" value="" required=""><br><br> 
                    Precio:<br>
                    <input type="number" name="precioNuevo" value="" required="" min="0"><br><br> 
                    <input type="submit" name="accion" value="agregar">
                </form><br>
                <%
                    if (request.getParameter("accion").equals("agregar")) {                
                        String nombre = request.getParameter("productoNombreNuevo");
                        Integer precio = Integer.parseInt(request.getParameter("precioNuevo"));
                        if (s.addproducto(nombre, precio)) {
                %>
                <div id="bien">
                    <section>
                        <jsp:include page="../../../include/puedeComprar.jsp" flush="true" />
                    </section>
                </div>
                <%
                } else {
                %>
                <div id="mal">
                    <section>
                        <jsp:include page="../../../include/mal.jsp" flush="true" />
                    </section>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>


        <div id="footer">
            <section>
                <jsp:include page="../../include/footer.jsp" flush="true" />
            </section>
        </div>

        <script>
            function enviar() {
                var productoID = document.getElementById("productoID").value;
                var dataEn = "productoID" + productoID;
                $.ajax({
                    type: 'get',
                    url: 'inicioProducto.jsp',
                    data: dataEn,
                    success: function (resp) {
                        $("#resp").html(resp);
                    }
                });
                return false;
            }
        </script>
        <p id="resp"></p>


    </body>
</html>
