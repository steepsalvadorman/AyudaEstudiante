package controller;

import dao.UsuarioDao;
import java.io.IOException;
import java.util.List;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.Usuario;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "ServletInicioSesion", urlPatterns = {"/ServletInicioSesion"})
public class ServletInicioSesion extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Variables
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        String direccion = "errorLogUsuario.html";

        // Activamos la sesión
        HttpSession sesion = request.getSession();
        if (sesion.isNew()) {
            sesion = request.getSession(true);
        }

        // Obtener la lista de usuarios desde UsuarioDao
        List<Usuario> lista = null;
        try {
            lista = UsuarioDao.listaUsuario();
        } catch (SQLException ex) {
            Logger.getLogger(ServletInicioSesion.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Buscar el usuario coincidente en la lista
        Usuario usuario = lista.stream()
                .filter(u -> u.getEmail().equals(correo) && u.getPassword().equals(clave))
                .findFirst()
                .orElse(null);

        if (usuario != null) {
            // Guardamos los datos del cliente en variables de sesión
            sesion.setAttribute("UsuarioCodigo", usuario.getId());
            sesion.setAttribute("UsuarioNombre", usuario.getNombres());
            sesion.setAttribute("UsuarioApellido", usuario.getApellidos());
            // Obtener el rol del usuario
            // Obtener la lista de roles del usuario
            List<String> roles = UsuarioDao.obtenerNombreRolesUsuario(usuario.getId());
            sesion.setAttribute("UsuarioRoles", roles);

            if (roles.contains("Estudiante") && roles.contains("Estudiante Experto")) {
                direccion = "PrincipalUsuarioExperto.jsp";
            } else if (roles.contains("Estudiante")) {
                direccion = "PrincipalUsuario.jsp";
            } else if (roles.contains("Estudiante Experto")) {
                sesion.setAttribute(clave, roles);
                direccion = "PrincipalExperto.jsp";
            }
        }

        // Redirigir a la dirección correspondiente
        response.sendRedirect(direccion);
    }
}