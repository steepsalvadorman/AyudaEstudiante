<%-- 
    Document   : DeterminarSesion
    Created on : 1 jun. 2023, 13:30:27
    Author     : steve
--%>

<%@page import="javax.servlet.http.HttpSession"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("UsuarioNombre")!= null)
    { // si la sesion existe
    }
    else
    {
        response.sendRedirect("LogUsuario.html");
    }   
%>