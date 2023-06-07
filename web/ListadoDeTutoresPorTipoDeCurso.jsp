
<%@page import="dao.TutoriaDao"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.Tutoria" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Recursos/Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Recursos/CSSPropio/newcss.css"/>
        <script src="Recursos/Bootstrap/js/bootstrap.min.js"></script>
        <script src="Recursos/JsPropio/ValidaJS.js"></script>
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin-top: -50px;
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <%-- Obtener el término de búsqueda ingresado por el usuario --%>
        <% String searchTerm = request.getParameter("searchTerm"); %>

        <% TutoriaDao tutoriaDao = new TutoriaDao(); %>
        <% List<Tutoria> tutorias = tutoriaDao.obtenerTutoriasPorTerminoDeBusqueda(searchTerm); %>

        <%-- Mostrar los resultados --%>
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Estado</th>
                        <th>Tutor</th>
                        <th>Feedback</th>
                        <th>Calificación</th>
                        <th>Perfil</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Tutoria tutoria : tutorias) {%>
                    <tr>
                        <td><%= tutoria.getNombre()%></td>
                        <td><%= tutoria.getEstado()%></td>
                        <td><%= tutoria.getTutor()%></td>
                        <td><%= tutoria.getFeedback()%></td>
                        <td><%= tutoria.getCalificacion()%></td>
                        <td>
                            <form action="Mensajeria.jsp" method="post" target="_blank">
                                
                                <input type="hidden" name="tutor" value="<%= tutoria.getTutor()%>">
                                <button type="submit">Ver Perfil</button>
                            </form>
                        </td>
                    </tr>
                    <%-- Mostrar más detalles de la tutoría --%>
                    <% }%>
                </tbody>

            </table>
        </div>
    </body>
</html>





