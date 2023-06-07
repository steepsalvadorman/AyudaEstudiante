

<%@page import="dao.TutoriaDao"%>
<%@page import="entity.Tutoria"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <center><strong><p class="text-dark">Datos del usuario:</p></strong></center>
                        <center><b>Nombre: <%= session.getAttribute("UsuarioNombre")%> </b></center>
                        <center><b>Apellido: <%= session.getAttribute("UsuarioApellido")%></b></center>
                        <center><b>Roles: <%= String.join(", ", (List<String>) session.getAttribute("UsuarioRoles"))%></b></center>
                    </div>

                    &nbsp;
                    <center>
                        <div class="col-12">
                            <button class="btn btn-primary" onclick="redireccionar('ConsultarExpertoJsp.jsp')">Consultar Experto</button>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary" onclick="redireccionar('CrearTutoriaJsp.jsp')">Registrarse</button>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary" onclick="redireccionar('ReporteTutoriasJsp.jsp')">Reporte Tutorias</button>
                        </div>
                    </center>
                </div>
                <div class="col-10">

                    <% List<Tutoria> tutorias = TutoriaDao.obtenerListaTutorias();
                        request.setAttribute("tutorias", tutorias);
                    %>

                    <div class="container overflow-scroll p-3 bg-light" style="height: 700px;">
                        <div class="card">
                            <div class="card-body">
                                <c:forEach items="${tutorias}" var="tutoria">
                                    <div class="row" style="border: 1px solid black; padding: 10px;">
                                        <div class="col-10">
                                            <h5 class="card-title">Curso: ${tutoria.nombre}</h5>
                                            <h6 class="card-subtitle mb-2">Estado: ${tutoria.estado}</h6>
                                            <h6 class="card-subtitle mb-2">Tutor: ${tutoria.tutor}</h6>
                                        </div>
                                        <div class="col-2">
                                            <label for="clave">RANKING</label>
                                            <input type="number" class="form-control" name="ranking" id="ranking" value="${tutoria.calificacion}">
                                            <button class="btn btn-primary btn-sm float-right mt-2">CALIFICAR</button>
                                        </div>
                                        <p class="card-text">FEEDBACK: ${tutoria.feedback}</p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="footer">
            <strong>Universidad de Lima - Grupo 5</strong>
        </div>
    </body>
</html>


