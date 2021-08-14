<%-- 
    Document   : index.jsp
    Created on : 29-jul-2021, 9:57:54
    Author     : leninrkb
--%>
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
            estas en el index
        </div>

        <div id="footer">
            <section>
                <jsp:include page="include/footer.jsp" flush="true" />
            </section>
        </div>


    </body>
</html>
