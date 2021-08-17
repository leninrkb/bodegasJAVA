
<%@page import="servicios.Bodega"%>
<%@page import="servicios.Producto"%>
<%@page import="servicios.Contenedor"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //HttpSession session = (HttpSession) request.getSession(); %>

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
                            <li class="nav-item"><a class="nav-link" href="Controlador?accion=inicioCliente">Inicio Cliente</a></li>
                            <li class="nav-item"><a class="nav-link" href="Controlador?accion=cerrarsesion">Cerrar Sesión</a></li>
                        </ul>
                    </div>
                </div>

            </nav>
            <br><br><br><br><br><br><br><br><br>
        </header>    

        <div id="contenido">
            <div id="tabla" class="container text-center">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Perfil Cliente</h1>
                    </div>
                </div>
            </div>

            <div>
                <center>
                    <form id="buscar">
                        Producto:
                        <input type="text" name="producto_buscar" placeholder="ej:galletas">
                        <input type="submit" name="accion" value="buscar">
                        <br><br>
                        <div>
                            <input type="submit" name="accion" value="Refrescar Datos">
                            <br><br><br>
                        </div>
                    </form>
                </center>
            </div>


            <div id="tabla">
                <table border=2 width="90%" align="center" cellpadding="8" cellspacing="10" style="color: black" bgcolor="Azure">
                    <thead>
                    <th style="text-align: center">Bodega</th>
                    <th style="text-align: center">Ciudad</th>
                    <th style="text-align: center">Producto</th>
                    <th style="text-align: center">Precio</th>
                    <th style="text-align: center">Stock</th>
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
                            <td align="center"><%=c.getBodega()%></td>
                            <td align="center"><%=c.getCiudad()%></td>
                            <td align="center"><%=c.getProducto()%></td>
                            <td align="center"><%=c.getPrecio()%></td>
                            <td align="center"><%=c.getStock()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>

            <div id="servicio">

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
                                                                        <label class="col-sm-3 col-form-label text-light bg-dark">Bodega</label>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                        </div>

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


                                                                    </div>
                                                                </div>

                                                                <div class="form-group mb-3">
                                                                    <div class="input-group input-group-merge input-group-alternative">
                                                                        <label class="col-sm-3 col-form-label text-light bg-dark">Producto</label>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                        </div>
                                                                        <select name="productoID_compra">
                                                                            <%
                                                                                for (Contenedor c : datos) {

                                                                            %>

                                                                            <option value="<%=c.getProductoID()%>"><%=c.getProducto()%></option>

                                                                            <%                            }
                                                                            %>
                                                                        </select>
                                                                        <br><br> 
                                                                    </div>
                                                                </div>

                                                                <div class="form-group mb-3">
                                                                    <div class="input-group input-group-merge input-group-alternative">
                                                                        <label class="col-sm-3 col-form-label text-light bg-dark">Cantidad</label>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                                                                        </div>
                                                                        <input class="form-control" type="number" name="cantidad_compra" required="" min="0" value="0">
                                                                    </div>
                                                                    <br><br>
                                                                    <div class="text-center">
                                                                        <input type="submit" class="btn btn-primary" name="accion" value="comprar">
                                                                    </div>
                                                                </div>

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
                                                                <center class="bg-success  display-4 text-dark"> <jsp:include page="../../include/puedeComprar.jsp" flush="true" /></center>
                                                            </div>

                                                            <%                }
                                                            } else {
                                                            %>
                                                            <br>
                                                            <div id="alerta" class="bg-warning text-dark">
                                                               <center> <jsp:include page="../../include/noPuedeComprar.jsp" flush="true" /><br></center>
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




        <div id="footer">
            <section>
                <jsp:include page="../../include/footer.jsp" flush="true" />
            </section>
        </div>


    </body>
</html>