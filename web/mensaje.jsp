<%@page import="dao.MensajeDao"%>
<%@page import="entity.Mensaje"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Mensaje</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <div class="card">
      <div class="card-header">
        Detalles del mensaje
      </div>
      <div class="card-body">
        <% 
          String idParam = request.getParameter("id"); // Obtener el parámetro "id" de la URL
          if (idParam != null) {
            Mensaje mensaje = MensajeDao.obtenerMensajePorId(idParam); // Llamada a la función obtenerMensajePorId() del DAO para obtener el mensaje por su ID
            
            if (mensaje != null) {
              String asunto = mensaje.getAsunto();
              String contenido = mensaje.getContenido();
              String fecha = mensaje.getFecha();
        %>
        
        <h5 class="card-title"><%= asunto %></h5>
        <p class="card-text"><%= contenido %></p>
        <p class="card-text"><%= fecha %></p>
        
        <% } else { %>
        
        <p class="card-text">Mensaje no encontrado.</p>
        
        <% } } else { %>
        
        <p class="card-text">ID de mensaje no proporcionado.</p>
        
        <% } %>
      </div>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


