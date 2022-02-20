package ujes.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection con;
	private static final String DB_DRIVER= "org.postgresql.Driver";
	private static final String DB_CONNECTION= "jdbc:postgresql://ec2-54-209-221-231.compute-1.amazonaws.com:5432/de2ejfdl93uqof";
	private static final String DB_USER= "ihawdciqkgdspx";
	private static final String DB_PASSWORD= "d0a32ddb478ecf1390eb0b275d3ed8278804864c252d4b8c6eb2faebd733a514";
	
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
