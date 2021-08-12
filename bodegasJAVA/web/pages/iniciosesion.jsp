
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
        <div id="nav">
            <nav>
                <ul>
                    <li><a href="Controlador?accion=inicio">Inicio</a></li>
                    <li><a href="Controlador?accion=iniciosesion">Iniciar Sesion</a></li>
                </ul>
            </nav>
        </div>

        <div id="contenido">
            <center>
                <div id="login">
                    <form>
                        <label>LOGIN</label>
                        <br><br>

                        <label>Usuario</label>
                        <br>
                        <input type="text" name="usuario" required="">
                        <br>

                        <label>Password</label>
                        <br>
                        <input type="Password" name="contrasenia" required="">
                        <br><br>

                        <input  id="boton" type="submit" name="accion" value="ingresar">
                    </form>
                </div>
                <%
                    Servicios s = new Servicios();
                    String usuario = request.getParameter("usuario");
                    String contrasenia = request.getParameter("contrasenia");

                    if (usuario != null) {
                        if (!s.login(usuario, contrasenia)) {
                %>
                <jsp:include page="../include/login_fallido.jsp" flush="true" />
                <%
                        }
                    }
                %>

            </center>

        </div>

        <div id="footer">
            <section>
                <jsp:include page="../include/footer.jsp" flush="true" />
            </section>
        </div>


    </body>
</html>