

<%@page import="dao.MensajeDao"%>
<%@page import="entity.Mensaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bandeja de entrada</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <div class="card">
      <div class="card-header">
        Bandeja de entrada
      </div>
      <div class="card-body">
        <div class="list-group">
          <% 
            List<Mensaje> mensajes = MensajeDao.obtenerMensajes(); // Llamada a la función obtenerMensajes() para obtener la lista de mensajes
            
            for (Mensaje mensaje : mensajes) { // Iterar sobre la lista de mensajes
              String id = mensaje.getId();
              String asunto = mensaje.getAsunto();
              String contenido = mensaje.getContenido();
              String fecha = mensaje.getFecha();
          %>
          
          <a href="mensaje.jsp?id=<%= id %>" class="list-group-item list-group-item-action">
            <h5 class="mb-1"><%= asunto %></h5>
            <p class="mb-1"><%= contenido %></p>
            <small class="text-muted"><%= fecha %></small>
          </a>
          
          <% } // Fin del bucle for %>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>




