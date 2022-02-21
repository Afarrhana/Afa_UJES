package ujes.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection con;
	private static final String DB_DRIVER= "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION= "jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_c52d31833f8842d";
	private static final String DB_USER= "b2fcdfacffe805";
	private static final String DB_PASSWORD= "67b805ee";
	
	public static Connection getConnection() {
		// TODO Auto-generated method stub
		try {
			//load driver
			Class.forName(DB_DRIVER);
			
			try {
				//create connection
				con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
				System.out.println("Connected");
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
