package controller;

import dao.UsuarioDao;
import dao.UsuarioRolDao;
import entity.Usuario;
import entity.UsuarioRol;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("correo");
        String password = request.getParameter("clave");
        String[] tiposUsuario = request.getParameterValues("tipoUsuario[]");

        // Crear un objeto Usuario con los datos ingresados
        // Obtener el id del usuario guardado
        try {
            Usuario usuario = new Usuario(nombre, apellidos, email, password);
            UsuarioDao.guardarUsuario(usuario);
            Usuario usuarioguardado = UsuarioDao.obtenerUsuario(email, password);

            // Guardar en la tabla usuario_rol
            if (tiposUsuario != null && tiposUsuario.length >= 1) {
                if ("Estudiante".equals(tiposUsuario[0])) { //ingresaria por aca
                    UsuarioRol usuarioRol = new UsuarioRol(usuarioguardado.getId(), 2);
                    UsuarioRolDao.guardarUsuarioRol(usuarioRol);
                } else if ("Estudiante Experto".equals(tiposUsuario[0])) { //ingresaria
                    UsuarioRol usuarioRol = new UsuarioRol(usuarioguardado.getId(), 1);
                    UsuarioRolDao.guardarUsuarioRol(usuarioRol);
                }
                if (tiposUsuario.length == 2 && "Estudiante Experto".equals(tiposUsuario[1])) {
                    UsuarioRol usuarioRol = new UsuarioRol(usuarioguardado.getId(), 1);
                    UsuarioRol usuarioRol2 = new UsuarioRol(usuarioguardado.getId(), 2);
                    UsuarioRolDao.guardarUsuarioRol(usuarioRol);
                    UsuarioRolDao.guardarUsuarioRol(usuarioRol2);
                }
            } else {
                // Manejo de error o comportamiento alternativo si no se seleccionó ninguna opción
            }

            response.sendRedirect("registro_exitoso.html");

        } catch (SQLException ex) {
            Logger.getLogger(RegistroServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("errorRegistro.html");
        }

    }

}
