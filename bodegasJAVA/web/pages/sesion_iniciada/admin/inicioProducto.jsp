<%@page import="servicios.Producto"%>
<%@page import="servicios.Ciudad"%>
<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                        <center>
                            <li><a href="#">
                                    <p></p>
                                    <br>
                                    Bienvenid@:
                                    <%
                                        String usuario = (String) session.getAttribute("session_usuario");
                                    %>
                                    <%=usuario%></a></li>   
                        </center>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item"><a class="nav-link" href="Controlador?accion=adminBodegas">Bodegas</a></li>
                            <li class="nav-item"><a class="nav-link" href="Controlador?accion=adminProductos">Productos</a></li>
                            <li class="nav-item"><a class="nav-link" href="Controlador?accion=cerrarsesion">Cerrar Sesión</a></li>
                        </ul>
                    </div>
                </div>

            </nav>
            <br><br><br><br><br><br><br><br><br>
        </header>          

        <div id="contenido">
            <div>
                <center>
                    <form id="buscar">
                        Producto:
                        <input type="text" name="producto_buscar" placeholder="ej:galletas">
                        <input type="submit" name="accion" value="buscar">
                        <br><br>
                        <div>
                            <input type="submit" name="accion" value="Refrescar Datos">
                        </div>
                    </form>
                </center>
            </div>

            <div id="tabla" class="container text-center">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Vistas Productos</h1>
                    </div>
                </div>
            </div>
            <table border=2 width="90%" align="center" cellpadding="8" cellspacing="10" style="color: black" bgcolor="Azure">
                <thead>
                <th style="text-align: center">ID</th>
                <th style="text-align: center">Producto</th>
                <th style="text-align: center">Precio</th>
                </thead>
                <tbody>
                    <%
                        Servicios s = new Servicios();
                        String producto = request.getParameter("producto_buscar");

                        List<Producto> datos = s.getProductos(producto);
                        for (Producto c : datos) {
                    %>
                    <tr>
                        <td align="center"><%=c.getId()%></td>
                        <td align="center"><%=c.getNombre()%></td>
                        <td align="center"><%=c.getPrecio()%></td>                          
                    </tr>
                    <% }%>
                </tbody>
            </table>



            <div id="servicio">
                <div class="container text-center">
                    <div class="row">
                        <div class="col-lg-12">
                            <br><br><br><br><br<br>
                            <h1>Administrar Productos</h1>
                            <h1>Modifique las propiedades de un Producto</h1>
                        </div>
                    </div>
                </div>

                <div>

                    <div class="contact-box">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <table cellpadding="10" cellspacing="12" align="left	">
                                        <form>
                                            <div class="row justify-content-center">
                                                <div class="col-lg-6 col-md-8">
                                                    <div class="card bg-dark border-0">
                                                        <div class="card-body px-lg-5 py-lg-5">

                                                            <form onsubmit="return enviar()">
                                                                <div class="form-group mb-3">
                                                                    <div class="input-group input-group-merge input-group-alternative">
                                                                        <label class="col-sm-3 col-form-label text-light bg-dark">Producto</label>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                        </div>
                                                                        <select name="productoID">
                                                                            <%
                                                                                for (Producto c : datos) {
                                                                            %>
                                                                            <option><%=c.getId()%></option>
                                                                            <%
                                                                                }
                                                                            %>
                                                                        </select><br><br>   

                                                                    </div>
                                                                </div>

                                                                <div class="form-group mb-3">
                                                                    <div class="input-group input-group-merge input-group-alternative">
                                                                        <label class="col-sm-3 col-form-label text-light bg-dark">Nombre</label>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                        </div>
                                                                        <input class="form-control" type="text"  name="productoNombre" value="" required=""><br><br> 
                                                                    </div>
                                                                </div>

                                                                <div class="form-group mb-3">
                                                                    <div class="input-group input-group-merge input-group-alternative">
                                                                        <label class="col-sm-3 col-form-label text-light bg-dark">Precio</label>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                        </div>
                                                                        <input class="form-control" type="number" name="precio" required="" min="0" value="0">
                                                                    </div>
                                                                    <br><br>
                                                                    <div class="text-center">
                                                                        <input type="submit" class="btn btn-primary" name="accion" value="editar">
                                                                    </div>
                                                                </div>

                                                            </form>
                                                            <%
                                                                if (request.getParameter("accion").equals("editar")) {
                                                                    String id = request.getParameter("productoID");
                                                                    String nombre = request.getParameter("productoNombre");
                                                                    Integer precio = Integer.parseInt(request.getParameter("precio"));
                                                                    if (s.editproducto(id, nombre, precio)) {
                                                            %>
                                                            <center class="bg-success  display-4 text-dark"> <jsp:include page="../../../include/puedeComprar.jsp" flush="true" /></center>
                                                            <%
                                                            } else {
                                                            %>
                                                            <center  class="bg-danger display-4 text-dark"> <jsp:include page="../../../include/mal.jsp" flush="true" /> </center>
                                                            <%
                                                                    }
                                                                }
                                                            %>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>

                                    </table>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div>
                    <div class="container text-center">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>Nuevo Producto</h1>
                                <h1>Ingresar Un Nuevo Producto A La Empresa</h1>
                            </div>
                        </div>
                    </div>

                    <div>

                        <div class="contact-box">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <table cellpadding="10" cellspacing="12" align="left	">
                                            <form>
                                                <div class="row justify-content-center">
                                                    <div class="col-lg-6 col-md-8">
                                                        <div class="card bg-dark border-0">
                                                            <div class="card-body px-lg-5 py-lg-5">

                                                                <form>
                                                                    <div class="form-group mb-3">
                                                                        <div class="input-group input-group-merge input-group-alternative">
                                                                            <label class="col-sm-3 col-form-label text-light bg-dark">Nombre</label>
                                                                            <div class="input-group-prepend">
                                                                                <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                            </div>
                                                                            <input class="form-control" type="text" required="" name="productoNombreNuevo">
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group mb-3">
                                                                        <div class="input-group input-group-merge input-group-alternative">
                                                                            <label class="col-sm-3 col-form-label text-light bg-dark">Precio</label>
                                                                            <div class="input-group-prepend">
                                                                                <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                            </div>
                                                                            <input class="form-control" type="number" required="" name="precioNuevo" min="0" step="any">
                                                                        </div>
                                                                    </div>


                                                                    <div class="text-center">
                                                                        <input type="submit" class="btn btn-primary" name="accion" value="agregar">
                                                                    </div>

                                                                </form>
                                                                <%
                                                                    if (request.getParameter("accion").equals("agregar")) {
                                                                        String nombre = request.getParameter("productoNombreNuevo");
                                                                        Integer precio = Integer.parseInt(request.getParameter("precioNuevo"));
                                                                        if (s.addproducto(nombre, precio)) {
                                                                %>
                                                                <center class="bg-success  display-4 text-dark"> <jsp:include page="../../../include/puedeComprar.jsp" flush="true" /></center>
                                                                <%
                                                                } else {
                                                                %>
                                                                <center  class="bg-danger display-4 text-dark"> <jsp:include page="../../../include/mal.jsp" flush="true" /> </center>
                                                                <%
                                                                        }
                                                                    }
                                                                %>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>

                                        </table>

                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>
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


