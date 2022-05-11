package untils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

    public static Connection getConnection() throws SQLException {
        try {
            Connection con = null;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433; databaseName=SHOPPING; user = sa; password = sa";
            con = DriverManager.getConnection(url);
            return con;
        } catch (Exception e) {
        }
        return null;
    }
}
