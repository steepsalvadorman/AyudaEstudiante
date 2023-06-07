<%@page import="controller.guardarPublicacionServlet"%>
<%@page import="dao.PublicacionDao"%>
<%@page import="entity.Publicacion"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>:::Bienvenido al Sistema:::</title>
    <link rel="stylesheet" href="Recursos/Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Recursos/CSSPropio/newcss.css"/>
    <script src="Recursos/Bootstrap/js/bootstrap.min.js"></script>
    <script src="Recursos/JsPropio/ValidaJS.js"></script>
    <style>
        .card {
            margin-bottom: 20px;
        }
        .btn.btn-primary {
            margin-bottom: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="header">
        <center><b>Bienvenido</b></center>
    </div>

    <div class="container-fluid">
        <div class="row" style="margin-top: 100px;">
            <div class="col-2" style="align-content: center;">
                <div style="border: 1px solid black; padding: 10px;">
                    <center><strong><p class="text-dark">Datos del Profesor:</p></strong></center>
                    <center><b>Nombre: <%= session.getAttribute("UsuarioNombre")%> </b></center>
                    <center><b>Apellido: <%= session.getAttribute("UsuarioApellido")%></b></center>
                    <center><b>Rol: <%= String.join(", ", (List<String>) session.getAttribute("UsuarioRoles"))%></b></center>
                </div>
                &nbsp;
                <center>
                    <div class="col-12">
                        <button class="btn btn-primary" onclick="redireccionar('CrearPublicacionJsp.jsp')">Crear Publicacion</button>
                    </div>
                    <div class="col-12">
                        <button class="btn btn-primary" onclick="redireccionar('RevisarMensajesJsp.jsp')">Revisar mensajes</button>
                    </div>
                    <div class="col-12">
                        <button class="btn btn-primary" onclick="redireccionar('CrearTutoriaJsp.jsp')">Crear Tutorias</button>
                    </div>
                </center>
            </div>
            <div class="col-10">
                <% List<Publicacion> publicaciones = PublicacionDao.obtenerListaPublicaciones();
                    request.setAttribute("publicaciones", publicaciones);
                %>

                <div class="container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Documento</th>
                                <th>Publicacion</th>
                                <th>Descripcion</th>
                                <th>Tipo de Curso</th>
                                <th>Fecha de Publicacion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Publicacion publicacion : publicaciones) { %>
                                <tr>
                                    <td><%= guardarPublicacionServlet.obtenerNombreArchivo(publicacion.getPublicacion()) %></td>
                                    <td><%= publicacion.getPublicacion()%></td>
                                    <td><%= publicacion.getDescripcion() %></td>
                                    <td><%= publicacion.getTipoCurso() %></td>
                                    <td><%= publicacion.getFechaPublicacion() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <strong>Universidad de Lima - Grupo 5</strong>
    </div>
</body>
</html>

