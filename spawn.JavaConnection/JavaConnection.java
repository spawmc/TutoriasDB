package spawn.JavaConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JavaConnection {
    private String user = "javaConnection";
    private String pwd = "javaConnection";
    private static String db = "Tutoria";
    private String url = "jdbc:mariadb://localhost/" + db;
    private Connection conn = null;
}