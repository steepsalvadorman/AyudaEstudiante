/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.PublicacionDao;
import entity.Publicacion;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import java.util.Base64;

/**
 *
 * @author steve
 */
@WebServlet(name = "guardarPublicacionServlet", urlPatterns = {"/guardarPublicacionServlet"})
@MultipartConfig
public class guardarPublicacionServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Obtener los valores de los parámetros del formulario
            Part filePart = request.getPart("documento");
            String fileName = filePart.getSubmittedFileName();
            String publicacion = request.getParameter("publicacion");
            String descripcion = request.getParameter("descripcion");
            String tipoCurso = request.getParameter("tipo_curso");
            String fechaPublicacion = request.getParameter("fecha_publicacion");

            // Leer los bytes del archivo
            InputStream documentoStream = filePart.getInputStream();
            byte[] documentoBytes = documentoStream.readAllBytes();

            // Crear el objeto Publicacion
            Publicacion publicacionGuardada = new Publicacion(documentoBytes, publicacion, descripcion, tipoCurso, fechaPublicacion);

            // Guardar la publicación en la base de datos y obtener el ID generado
            int publicacionId = PublicacionDao.guardarPublicacion(publicacionGuardada);
            publicacionGuardada.setId(publicacionId);

            // Agregar el nombre del archivo como atributo en la solicitud
            request.setAttribute("nombreArchivo", fileName);

            // Redirigir al JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("PrincipalExperto.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static String obtenerNombreArchivo(String nombreCompleto) {
        int indicePunto = nombreCompleto.lastIndexOf(".");
        if (indicePunto != -1) {
            return nombreCompleto.substring(0, indicePunto);
        }
        return nombreCompleto;
    }

}
