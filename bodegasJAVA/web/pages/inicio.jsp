<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
<style type="text/css">
    tr {}

    tr:hover {
        background-color: lightgreen;
        color: black;

    }
</style>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>MegaProductos</title>
        <link rel="icon" href="img/logo.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">
    </head>


    <body>

        <header class="top-navbar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand">
                        <img src="img/logo.png" alt="" style='width: 140px; height:100px;' />
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbars-rs-food">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item"><a class="nav-link" href="Controlador?accion=inicio">Inicio</a></li>
                            <li class="nav-item"><a class="nav-link" href="Controlador?accion=iniciosesion">Iniciar Sesión</a></li>
                        </ul>
                    </div>

                </div>
            </nav>



        </header>

        <div style="height: 150px;"></div>
        <div style="width: 90%; margin: 0 auto;">
            <center> <img src="img/bodega.png" width="10%"> </center>
            <center>
                <p style="font-size: 1.4em; color: black">Productos Existentes En Las Bodegas</p>
            </center>

            <div>
                <div>
                    <center>
                        <p style="font-size: 1.4em; color: black">Ingrese Con Su Usuario Para Realizar Una Compra</p>
                    </center>

                </div>
                <div>
                    <center>
                        <form id="buscar">
                            <input type="text" name="producto" placeholder="Ej: Chocolate">
                            <input type="submit" name="accion" value="Buscar">
                        </form>
                        <br>
                    </center>
                </div>
                <div>
                    <table border=2 width="90%" align="center" cellpadding="8" cellspacing="10" style="color: black" bgcolor="Azure">
                        <thead>
                        <th style="text-align: center">Bodega</th>
                        <th style="text-align: center">Ciudad</th>
                        <th style="text-align: center">Producto</th>
                        <th style="text-align: center">Precio</th>
                        </thead>
                        <tbody>
                            <%
                                String producto = request.getParameter("producto");
                                Servicios s = new Servicios();
                                List<Contenedor> datos = s.getDatos(producto);
                                for (Contenedor c : datos) {
                            %>
                            <tr>
                                <td align="center" ><%=c.getBodega()%></td>
                                <td align="center"><%=c.getCiudad()%></td>
                                <td align="center"><%=c.getProducto()%></td>
                                <td align="center"><%=c.getPrecio()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                </div>
                <div style="width: 90%; padding: 20px; text-align: right;">
                </div>
            </div>
        </div>
        <div id="footer">
            <section>
                <jsp:include page="../include/footer.jsp" flush="true" />
            </section>
        </div>

    </body>

</html>









