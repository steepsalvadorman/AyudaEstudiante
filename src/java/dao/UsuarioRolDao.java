/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import conexion.Conexion;
import entity.UsuarioRol;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author steve
 */
public class UsuarioRolDao {

    public static boolean guardarUsuarioRol(UsuarioRol usuarioRol) {
    Connection cn = null;
    PreparedStatement stmt = null;

    try {
        cn = Conexion.getConexion();
        String query = "INSERT INTO usuario_rol (usuario_id, rol_id) VALUES (?, ?)";
        stmt = cn.prepareStatement(query);
        stmt.setInt(1, usuarioRol.getUsuarioId());
        stmt.setInt(2, usuarioRol.getRolId());
        stmt.executeUpdate();

        System.out.println("La relación usuario-rol se ha guardado correctamente.");

    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error al guardar la relación usuario-rol:\n" + e.getMessage());
        return false;
    } finally {
        Conexion.cerrarRecursos(cn, stmt, null);
        System.out.println("Se cerraron los recursos.");
    }

    return true;
} 
}
