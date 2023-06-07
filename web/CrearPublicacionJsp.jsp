<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Publicación</title>
    <link rel="stylesheet" href="Recursos/Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Recursos/CSSPropio/newcss.css"/>
    <script src="Recursos/Bootstrap/js/bootstrap.min.js"></script>
    <script src="Recursos/JsPropio/ValidaJS.js"></script>
    <script>
        function mostrarNombreArchivo() {
            var inputFile = document.getElementById('documento');
            var publicacionInput = document.getElementById('publicacion');

            if (inputFile.files.length > 0) {
                var fileName = inputFile.files[0].name;
                var extension = fileName.substr(fileName.lastIndexOf('.') + 1);
                var nameWithoutExtension = fileName.substr(0, fileName.lastIndexOf('.'));
                publicacionInput.value = nameWithoutExtension;
            } else {
                publicacionInput.value = '';
            }
        }
    </script>
</head>
<body>
    <div class="header">
        <center><b>Bienvenido</b></center>
    </div>

    <div style="margin-top: 100px" class="container">
        <h1>Agregar Publicación</h1>
        <form action="guardarPublicacionServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="documento">Documento:</label>
                <input type="file" class="form-control" name="documento" id="documento" required onchange="mostrarNombreArchivo()">
            </div>

            <div class="form-group">
                <label for="publicacion">Publicación:</label>
                <input type="text" class="form-control" name="publicacion" id="publicacion" value="" required>
            </div>

            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea class="form-control" name="descripcion" required></textarea>
            </div>

            <div class="form-group">
                <label for="tipo_curso">Tipo de Curso:</label>
                <input type="text" class="form-control" name="tipo_curso" required>
            </div>

            <div class="form-group">
                <label for="fecha_publicacion">Fecha de Publicación:</label>
                <input type="text" class="form-control" name="fecha_publicacion" required>
            </div>

            <input type="submit" class="btn btn-primary" value="Guardar">
            <input type="button" class="btn btn-primary" value="Volver" onclick="Volver()">
        </form>
    </div>

    <div class="footer">
        <strong>Universidad de Lima - Grupo 5</strong>
    </div>
    
</body>
</html>







