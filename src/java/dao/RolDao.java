package dao;

import conexion.Conexion;
import static conexion.Conexion.getConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RolDao {

   
   public static int obtenerRolIdPorUsuarioId(int usuarioId) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    int rolId = -1; // Valor por defecto que indica que no se encontró ningún rol

    try {
        conn = getConexion(); // Obtener conexión a la base de datos

        String query = "SELECT rol_id FROM usuario_rol WHERE usuario_id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, usuarioId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            rolId = rs.getInt("rol_id");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        Conexion.cerrarRecursos(conn, stmt, rs); // Cerrar recursos (conexión, statement y resultSet)
    }

    return rolId;
}




    
    
}
