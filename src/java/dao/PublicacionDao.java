
package dao;

import conexion.Conexion;
import entity.Publicacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;


public class PublicacionDao {

    public static List<Publicacion> obtenerListaPublicaciones() {
        List<Publicacion> listaPublicaciones = new ArrayList<>();

        // Establecer conexión con la base de datos
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConexion(); // Método para obtener la conexión a la base de datos

            // Consulta SQL para obtener las publicaciones
            String query = "SELECT * FROM publicacion";

            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            // Iterar sobre los resultados y crear objetos Publicacion
            while (rs.next()) {
                int id = rs.getInt("id");
                byte[] documento = rs.getBytes("documento");
                String publicacion = rs.getString("publicacion");
                String descripcion = rs.getString("descripcion");
                String tipoCurso = rs.getString("tipo_curso");
                String fechaPublicacion = rs.getString("fecha_publicacion");

                Publicacion publicacionObj = new Publicacion(id, documento, publicacion, descripcion, tipoCurso, fechaPublicacion);
                listaPublicaciones.add(publicacionObj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión, el statement y el result set
            Conexion.cerrarRecursos(conn, stmt, rs);
        }

        return listaPublicaciones;
    }
    
    
    
    
   public static int guardarPublicacion(Publicacion publicacion) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet generatedKeys = null;
    int publicacionId = 0;

    try {
        conn = Conexion.getConexion();

        // Consulta SQL para insertar la publicación en la base de datos y obtener el ID generado
        String query = "INSERT INTO publicacion (documento, publicacion, descripcion, tipo_curso, fecha_publicacion) VALUES (?, ?, ?, ?, ?)";

        stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        stmt.setBytes(1, publicacion.getDocumento());
        stmt.setString(2, publicacion.getPublicacion());
        stmt.setString(3, publicacion.getDescripcion());
        stmt.setString(4, publicacion.getTipoCurso());
        stmt.setString(5, publicacion.getFechaPublicacion());
        stmt.executeUpdate();

        // Obtener el ID generado para la publicación
        generatedKeys = stmt.getGeneratedKeys();
        if (generatedKeys.next()) {
            publicacionId = generatedKeys.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        Conexion.cerrarRecursos(conn, stmt, generatedKeys);
    }

    return publicacionId;
}




   
}
