import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class JavaConnection {
    /**
     * Configuración basica para la conección
     */
    private String user = "javaConnection";
    private String pwd = "javaConnection";
    private static String db = "Tutorias";
    private String url = "jdbc:mariadb://localhost/" + db;
    private Connection conn = null;

    /**
     * Constructor para iniciar la conección a la base de datos
     */
    public JavaConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver"); // Driver para mariaDB
            conn = (Connection) DriverManager.getConnection(url, user, pwd);
            if (conn != null) {
                JOptionPane.showMessageDialog(null, "¡Conexión con exito!", "", JOptionPane.INFORMATION_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Problemas al conectar a la base de datos :(", "ERROR",
                    JOptionPane.ERROR_MESSAGE);
        } catch (ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, e);
            e.printStackTrace();
        }
    }

    public ResultSet getQuery(String query) {
        Statement state = null; // Para la creacion de la consulta
        ResultSet resultado = null;
        try {
            state = (Statement) conn.createStatement();
            resultado = state.executeQuery(query);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return resultado;
    }

}