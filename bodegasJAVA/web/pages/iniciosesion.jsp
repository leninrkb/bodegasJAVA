
<%@page import="modelo.Servicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <br><br><br><br><br><br><br>
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-12">

                    <h1> Ingrese Sus Datos</h1>

                </div>
            </div>
        </div>
        <!-- End All Pages -->

        <!-- Start Contact -->
        <div id="contenido">
            <div class="contact-box">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">

                        </div>
                    </div>

                    <div class="container mt--8 pb-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-5 col-md-7">
                                <div class="card bg-dark border-0 mb-0">

                                    <div class="card-body px-lg-5 py-lg-1">
                                        <div class="text-center text-muted mb-4">
                                        </div>
                                        <br>
                                        <div id="login">
                                            <form>
                                                <div class="form-group mb-3">
                                                    <div class="input-group input-group-merge input-group-alternative">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="ni ni-badge"></i></span>
                                                        </div>
                                                        <input name="usuario" class="form-control pl-3" placeholder="Ingrese Su Nombre de Usuario" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group input-group-merge input-group-alternative">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="ni ni-key-25"></i></span>
                                                        </div>
                                                        <input name="contrasenia"class="form-control pl-3" placeholder="Ingrese Su Contraseña" type="Password">
                                                    </div>
                                                </div>

                                                <div class="text-center">
                                                    <input id="boton"class="btn btn-primary my-4" type="submit" name="accion" value="ingresar">
                                                </div>
                                            </form>
                                        </div>
                                        <%
                                            Servicios s = new Servicios();
                                            String usuario = request.getParameter("usuario");
                                            String contrasenia = request.getParameter("contrasenia");

                                            if (usuario != null) {
                                                if (!s.login(usuario, contrasenia)) {
                                        %>
                                        <center class="text-warning"><jsp:include page="../include/login_fallido.jsp" flush="true" /></center>
                                            <%
                                                    }
                                                }
                                            %>

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
                <jsp:include page="../include/footer.jsp" flush="true" />
            </section>
        </div>

    </body>
</html>