package dao;

import conexion.Conexion;
import entity.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDao {

    //Metodo utilizado para obtener todos los productos de nuestra base de datos
    public static Usuario obtenerUsuario(String email, String pass) throws SQLException {
        Usuario c = null;
        Connection cn = null;
        PreparedStatement ps;
        ResultSet rs;
        try {
            String query = "select * from USUARIO where email=? and password=?";
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                c = new Usuario();
                c.setId(rs.getInt("id"));
                c.setNombres(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
                c.setEmail(rs.getString("email"));
                c.setPassword(rs.getString("password"));
            }
            rs.close();
            ps.close();
            //Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            System.out.println("Error: No se pudo obtener el cliente\n" + e.getMessage());
            throw e;// Conexion.cerrarConexion(cn);
        } finally {
            Conexion.cerrarConexion(cn);
        }
        return c;
    }
    
    
    public static boolean actualizarContrasenia(Usuario usuario) {
    try (Connection conn = Conexion.getConexion()) {
        String sql = "UPDATE usuario SET password = ? WHERE email = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, usuario.getPassword());
            stmt.setString(2, usuario.getEmail());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Manejar el error de la base de datos
            System.out.println("Error al actualizar la contraseña del usuario: " + e.getMessage());
            return false;
        }
    } catch (SQLException e) {
        // Manejar el error de la conexión a la base de datos
        System.out.println("Error de conexión a la base de datos: " + e.getMessage());
        return false;
    }
}


    
    
    
    public static List<Usuario> listaUsuario() throws SQLException {
        Usuario c = null;
        Connection cn = null;
        PreparedStatement ps;
        ResultSet rs;
        List<Usuario> lista=new ArrayList<>();
        try {
            String query = "select * from USUARIO";
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(query);           
            rs = ps.executeQuery();
            while(rs.next()) {
                c = new Usuario();
                c.setId(rs.getInt("id"));
                c.setNombres(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
                c.setEmail(rs.getString("email"));
                c.setPassword(rs.getString("password"));
                lista.add(c);
            }
            rs.close();
            ps.close();
            //Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            System.out.println("Error: No se pudo traer la lista de clientes\n" + e.getMessage());
            throw e;// Conexion.cerrarConexion(cn);
        } finally {
            Conexion.cerrarConexion(cn);
        }
        return lista;
    }
    
    
    
    
    public static List<String> obtenerNombreRolesUsuario(int usuarioId) {
    List<String> roles = new ArrayList<>();

    try (Connection conn = Conexion.getConexion()) {
        String sql = "SELECT r.nombre FROM rol r JOIN usuario_rol ur ON r.id = ur.rol_id WHERE ur.usuario_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, usuarioId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String rolNombre = rs.getString("nombre");
                    roles.add(rolNombre);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return roles;
}

public static boolean guardarUsuario(Usuario usuario) {
    try (Connection conn = Conexion.getConexion()) {
        String sql = "INSERT INTO usuario (nombres, apellidos, email, password) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNombres());
            stmt.setString(2, usuario.getApellidos());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getPassword());

            stmt.executeUpdate();
        } catch (SQLException e) {
            // Manejar el error de la base de datos
            System.out.println("Error al guardar el usuario: " + e.getMessage());
            return false;
        }
    } catch (SQLException e) {
        // Manejar el error de la conexión a la base de datos
        System.out.println("Error de conexión a la base de datos: " + e.getMessage());
        return false;
    }

    return true;
}

    public static boolean verificarContraseniaRepetida(Usuario usuario) {
    try (Connection conn = Conexion.getConexion()) {
        String sql = "SELECT COUNT(*) FROM usuario WHERE email = ? AND password = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getPassword());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            // Manejar el error de la base de datos
            System.out.println("Error al verificar contraseña repetida: " + e.getMessage());
            return false;
        }
    } catch (SQLException e) {
        // Manejar el error de la conexión a la base de datos
        System.out.println("Error de conexión a la base de datos: " + e.getMessage());
        return false;
    }

    return false;
}



public static String obtenerNombrePorUsuarioId(int usuarioId) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String nombre = ""; // Valor por defecto en caso de no encontrar el nombre

    try {
        conn = Conexion.getConexion(); // Obtener conexión a la base de datos

        String query = "SELECT nombres FROM usuario WHERE id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, usuarioId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("nombres");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        Conexion.cerrarRecursos(conn, stmt, rs); // Cerrar recursos (conexión, statement y resultSet)
    }

    return nombre;
}




public static List<String> obtenerNombreRolesUsuario(String nombreUsuario) {
    List<String> roles = new ArrayList<>();

    try (Connection conn = Conexion.getConexion()) {
        String sql = "SELECT r.nombre FROM rol r JOIN usuario_rol ur ON r.id = ur.rol_id JOIN usuario u ON ur.usuario_id = u.id WHERE u.nombres = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nombreUsuario);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String rolNombre = rs.getString("nombre");
                    roles.add(rolNombre);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return roles;
}

    
    
    
    
    
    
    
}
