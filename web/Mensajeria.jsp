<%@page import="dao.UsuarioDao"%>
<%@page import="dao.RolDao"%>
<%@page import="entity.Rol"%>
<%@page import="dao.PublicacionDao"%>
<%@page import="entity.Publicacion"%>
<%@page import="dao.TutoriaDao"%>
<%@page import="entity.Tutoria"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:::Bienvenido al Sistema:::</title>
        <link rel="stylesheet" href="Recursos/CSSPropio/newcss.css"/>
        <link rel="stylesheet" href="Recursos/Bootstrap/css/bootstrap.min.css">
        <script src="Recursos/Bootstrap/js/bootstrap.min.js"></script>
        <script src="Recursos/JsPropio/ValidaJS.js"></script>





        <style>
            .card {
                margin-bottom: 20px;
            }
            .btn.btn-primary {
                margin-bottom: 20px;
                width: 120%;
            }
            .publicacion-card {
                border: 1px solid black;
                padding: 10px;
                background-color: #f8f9fa;
                border-radius: 10px;
            }
            .publicacion-title {
                font-size: 18px;
                font-weight: bold;
            }
            .publicacion-subtitle {
                font-size: 14px;
                font-weight: normal;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <center><b>Bienvenido</b></center>
        </div>
        <%
            String tutor = request.getParameter("tutor");
            String primeraParte = "";

            if (tutor != null) {
                String[] partes = tutor.split(" ");
                if (partes.length > 0) {
                    primeraParte = partes[0];
                }
            }

            List<String> roles = UsuarioDao.obtenerNombreRolesUsuario(primeraParte);

            // Imprimir los roles en la consola
            System.out.println("Roles:");
            for (String rol : roles) {
                System.out.println(rol);
            }

            String respuesta = String.join(", ", roles);
        %>





        <div class="container-fluid" style="margin-top: 100px;">
            <div class="row mt-4">
                <div class="col-md-2">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <p class="text-dark"><strong>Datos del usuario:</strong></p>
                                <p><b>Nombre: <%= tutor%></b></p>
                                <p><b>Roles: <%=  respuesta%></b></p>
                            </div>
                            <div class="mt-3 d-flex justify-content-center">
                                <button class="btn btn-primary btn-block btn-sm" onclick="redireccionar('EnviarMensaje.jsp')">Enviar Mensaje</button>
                            </div>
                            <div class="mt-3 d-flex justify-content-center">
                                <button class="btn btn-primary btn-block btn-sm" onclick="redireccionar('ConsultarTutorias.jsp')">Consultar Tutorias</button>
                            </div>


                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <% List<Publicacion> publicaciones = PublicacionDao.obtenerListaPublicaciones();
                        request.setAttribute("publicaciones", publicaciones);
                    %>
                    <div class="container overflow-scroll p-3 bg-light" style="height: 700px;">
                        <div class="card">
                            <div class="card-body">
                                <c:forEach items="${publicaciones}" var="publicacion">
                                    <div class="row border mb-3 p-3 publicacion-card">
                                        <div class="col-md-10">
                                            <h5 class="publicacion-title">Publicacion: ${publicacion.publicacion}</h5>
                                            <h6 class="publicacion-subtitle">Descripcion: ${publicacion.descripcion}</h6>
                                            <h6 class="publicacion-subtitle">Tipo Curso: ${publicacion.tipoCurso}</h6>
                                        </div>
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




