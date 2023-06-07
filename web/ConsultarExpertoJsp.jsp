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
            .centered-iframe {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin-top: -150px; 
            }
        </style>
    </head>
    <body>
        <div class="header">
            <center><b>Bienvenido</b></center>
        </div>


        <div class="container-fluid">
            <div class="row justify-content-center" style="margin-top: 100px;">
                <div class="col-6">
                    <!-- Agregar buscador -->
                    <form action="ListadoDeTutoresPorTipoDeCurso.jsp" method="get" target="WORK">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control form-control-lg" placeholder="Buscar" name="searchTerm">
                            <div class="input-group-append">
                                <button class="btn btn-primary btn-lg" type="submit">Buscar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="centered-iframe">
            <iframe src="" width="1000px" height="400px" name="WORK"></iframe>
        </div>

        <div class="footer">
            <strong>Universidad de Lima - Grupo 5</strong>
        </div>
    </body>
</html>

