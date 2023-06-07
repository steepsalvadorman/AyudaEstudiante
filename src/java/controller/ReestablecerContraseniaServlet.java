/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UsuarioDao;
import entity.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author steve
 */
@WebServlet(name = "ReestablecerContraseniaServlet", urlPatterns = {"/ReestablecerContraseniaServlet"})
public class ReestablecerContraseniaServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("correo");
        String password = request.getParameter("Nclave");

        // Crear un objeto Usuario con los datos ingresados
        Usuario usuario = new Usuario();
        usuario.setEmail(email);
        usuario.setPassword(password);

        // Verificar si la contraseña es repetida
        if (UsuarioDao.verificarContraseniaRepetida(usuario)) {
            // Contraseña repetida, agregar atributo de error y redirigir al JSP
            request.setAttribute("error", "La contraseña ingresada ya ha sido utilizada anteriormente.");
            request.getRequestDispatcher("formulario.jsp").forward(request, response);
        } else {
            // Actualizar la contraseña en la base de datos
            if (UsuarioDao.actualizarContrasenia(usuario)) {
                // Contraseña actualizada correctamente
                response.sendRedirect("contrasenia_actualizada.html");
            } else {
                // Error al actualizar la contraseña
                response.sendRedirect("error_actualizacion.html");
            }
        }
    }
}


