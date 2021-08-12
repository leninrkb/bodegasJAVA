
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
			sesion admin iniciada como: 
                        <%
                        String aa =request.getParameter("usuario");
                        
                        %>
                        
                        <%=aa%>
            </center>
        </div>

        <div id="footer">
            <section>
                <jsp:include page="../../include/footer.jsp" flush="true" />
            </section>
        </div>

        
    </body>
</html>