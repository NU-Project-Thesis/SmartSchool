package connection;

import java.sql.*;

public class ConnectionDB {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("org.postgresql.Driver");
		//Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-54-83-59-154.compute-1.amazonaws.com:5432/d399q8qhkv0nni","icslkkbiwvowel","bwmQ3TR2Ai9I9wrmPfwzL2sSIj");		
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/hrd","postgres","7778");
		return con;	
	}
}
