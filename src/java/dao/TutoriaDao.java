package dao;

import conexion.Conexion;
import static conexion.Conexion.cerrarRecursos;
import entity.Tutoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author steve
 */
public class TutoriaDao {

    
    
    
    public static List<Tutoria> obtenerListaTutorias() {
    List<Tutoria> listaTutorias = new ArrayList<>();
    Connection cn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        String query = "SELECT * FROM tutoria";
        cn = Conexion.getConexion();
        ps = cn.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            Tutoria tutoria = new Tutoria();
            tutoria.setId(rs.getInt("id"));
            tutoria.setNombre(rs.getString("nombre"));
            tutoria.setEstado(rs.getString("estado"));
            tutoria.setTutor(rs.getString("tutor"));
            tutoria.setFeedback(rs.getString("feedback"));
            tutoria.setCalificacion(rs.getInt("calificacion"));

            // También puedes obtener el usuario asociado a la tutoría aquí, si es necesario

            listaTutorias.add(tutoria);
        }
    } catch (SQLException e) {
        System.out.println("Error: No se pudo obtener la lista de tutorías\n" + e.getMessage());
    } finally {
        Conexion.cerrarRecursos(cn, ps, rs);
    }

    return listaTutorias;
}

public static List<Tutoria> obtenerTutoriasPorTerminoDeBusqueda(String searchTerm) {
    List<Tutoria> tutorias = new ArrayList<>();

    if (searchTerm.isEmpty()) {
        return tutorias; // Devuelve una lista vacía si searchTerm está vacío
    }

    // Aquí realizas la consulta a la base de datos usando el término de búsqueda
    // y obtienes los resultados en forma de objetos Tutoria

    // Ejemplo de código para realizar la consulta en la base de datos
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = Conexion.getConexion(); // Método para obtener la conexión a la base de datos
        String query = "SELECT * FROM tutoria WHERE nombre LIKE ? OR estado LIKE ? OR tutor LIKE ? OR feedback LIKE ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, "%" + searchTerm + "%");
        pstmt.setString(2, "%" + searchTerm + "%");
        pstmt.setString(3, "%" + searchTerm + "%");
        pstmt.setString(4, "%" + searchTerm + "%");
        rs = pstmt.executeQuery();

        while (rs.next()) {
            Tutoria tutoria = new Tutoria();
            tutoria.setNombre(rs.getString("nombre"));
            tutoria.setEstado(rs.getString("estado"));
            tutoria.setTutor(rs.getString("tutor"));
            tutoria.setFeedback(rs.getString("feedback"));
            tutoria.setCalificacion(rs.getInt("calificacion"));
            // Obtener más datos de la tutoría y asignarlos al objeto tutoria
            tutorias.add(tutoria);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        cerrarRecursos(conn, pstmt, rs); // Método para cerrar la conexión y otros recursos
    }

    return tutorias;
}






    
    
    
    
    
}
