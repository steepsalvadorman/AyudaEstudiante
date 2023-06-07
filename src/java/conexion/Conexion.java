package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {

    public static Connection getConexion() {
        Connection cn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tutobox", "root", "admin");
            System.out.println("Conexion Satisfactoria :)");
            

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error de Conexión\n" + e);
        }
        return cn;
    }

    //Metodo utilizado para cerrar la conexion
    public static synchronized void cerrarConexion(Connection cn) {
        try {
            cn.close();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        getConexion();
    }

    
    public static void cerrarRecursos(Connection conn, PreparedStatement stmt, ResultSet rs) {
    try {
        if (rs != null) {
            rs.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    try {
        if (stmt != null) {
            stmt.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    try {
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    
    
}
