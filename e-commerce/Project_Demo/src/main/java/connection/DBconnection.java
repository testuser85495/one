package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	public static Connection drivConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
		} catch (Exception e) {
			e.getStackTrace();
		}
		return conn;
	}

}
