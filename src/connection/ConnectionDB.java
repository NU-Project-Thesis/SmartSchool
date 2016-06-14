package connection;

import java.sql.*;
import java.util.Properties;

public class ConnectionDB {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("org.postgresql.Driver");
		String dbURL = "jdbc:postgresql://ec2-54-235-183-5.compute-1.amazonaws.com:5432/dens2trs9hr5jq";
		Properties properties = new Properties();
		properties.put("user", "rooyaxadgvkcve");
		properties.put("password", "ymhLi7EbQgYC9rjNeLlp3CWQ_y");
		properties.put("ssl", "true");
		properties.put("sslfactory", "org.postgresql.ssl.NonValidatingFactory");
		//TESting
		Connection con = DriverManager.getConnection(dbURL, properties);
		//Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-54-83-59-154.compute-1.amazonaws.com:5432/d399q8qhkv0nni","icslkkbiwvowel","bwmQ3TR2Ai9I9wrmPfwzL2sSIj");
		//Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/hrd","postgres","7778");
		return con;	
	}
}
