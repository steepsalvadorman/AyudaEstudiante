<%-- 
    Document   : reestablecer-contras
    Created on : 4 jun. 2023, 16:52:05
    Author     : steve
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:::Reestablecer Contraseña:::</title>
        <link rel="stylesheet" href="Recursos/Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Recursos/CSSPropio/newcss.css"/>
        <script src="Recursos/Bootstrap/js/bootstrap.min.js"></script>
        <script src="Recursos/JsPropio/ValidaJS.js"></script>


    </head>
    <body>
        <div class="header">
            <strong>Seguridad del Sistema</strong>
        </div>

        <div class="center-container">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div>
                        <center><img src="Recursos/img/logo2.jpg" alt="imagen" style="width: 300px; height: 220px;"></center>
                    </div>
                    
                    &nbsp;
    
                    <form name="formulario" method="post" id="formulario" action="ReestablecerContraseniaServlet">
                        <div class="form-group">
                            <label for="correo">Correo</label>
                            <input type="text" placeholder="Correo" name="correo" id="correo" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="clave">Contraseña Nueva</label>
                            <input type="password" placeholder="Contraseña" name="Nclave" id="clave" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <button class="btn btn-primary w-100" type="button" onclick="ValidaReestablecerContraseña()">Reestablecer Contraseña</button>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary w-100" type="button" onclick="Volver()">Volver</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

        <div class="footer">
            <strong>Universidad de Lima - Grupo 5</strong>
        </div>



    </body>
</html>
