package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	public static Connection getConnection() {
		try {
			String driver="oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@localhost:1522";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName(driver);
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
