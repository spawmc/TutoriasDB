
/**
 * Driver:
 *      https://downloads.mariadb.com/Connectors/java/connector-java-1.5.5/
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
    private boolean msgConnection = false;

    /**
     * Constructor para iniciar la conección a la base de datos
     */
    public JavaConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver"); // Driver para mariaDB
            conn = (Connection) DriverManager.getConnection(url, user, pwd);
            if (conn != null) {
                if (!msgConnection) {
                    JOptionPane.showMessageDialog(null, "¡Conexión con exito!", "", JOptionPane.INFORMATION_MESSAGE);
                    msgConnection = true;
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Problemas al conectar a la base de datos :(", "ERROR",
                    JOptionPane.ERROR_MESSAGE);
        } catch (ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, e);
            e.printStackTrace();
        }
    }

    public void setMsgConnection(boolean msgConnection) {
        this.msgConnection = msgConnection;
    }

    /**
     * Recibe un String con la consulta y retorna el resultado en forma de ResultSet
     */
    public ResultSet getQuery(String query) {
        Statement state = null; // Para la creacion de la consulta
        ResultSet resultado = null;
        try {
            state = (Statement) conn.createStatement(); //Se crea el Statement
            resultado = state.executeQuery(query); //Mediante el Statement se trae la consulta que le mandamos por parametro
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return resultado;
    }

    private Statement stateInsert = null;

    /**
     * Se genera el procedimiento para generar un INSERT dentro de la base de datos
     * @param numpersonal Numero de personal para el tutor
     * @param nombre Nombre del tutor
     * @param apellidoP Apellido paterno del tutor
     * @param apellidoM Apellido Materno del tutor
     * @param email Email del tutor
     */
    public void insertTutor(int numpersonal, String nombre, String apellidoP, String apellidoM, String email) {

        try {
            //Se genera el INSERT dejando los valores con el signo '?' para después poder ingresar los datos mediante setInt o setString
            stateInsert = conn.prepareStatement(
                    "INSERT INTO tutor (numpersonal, nombre, apellidoP, apellidoM, email) VALUES ( ?, ?, ?, ?, ?)");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            // Se insertan los datos al INSERT más no se ejecuta
            ((PreparedStatement) stateInsert).setInt(1, numpersonal);
            ((PreparedStatement) stateInsert).setString(2, nombre);
            ((PreparedStatement) stateInsert).setString(3, apellidoP);
            ((PreparedStatement) stateInsert).setString(4, apellidoM);
            ((PreparedStatement) stateInsert).setString(5, email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Funcion para ejecutar el INSERT
     */
    public void runStatementInsert() {
        try {
            ((PreparedStatement) stateInsert).executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Función para cerrar la conexion
     */
    public void CloseConnection() {
        try {
            conn.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Problemas al cerrar la base de datos :(", "ERROR",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

}