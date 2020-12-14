import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        JavaConnection conexion = new JavaConnection();
        ResultSet resultado;
        resultado = conexion.getQuery("SELECT * FROM alumno");
        String nombres;

        try {
            while (resultado.next()) {
                nombres = resultado.getString("nombre");
                System.out.println("Nombre: " + nombres);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
