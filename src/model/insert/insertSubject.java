package model.insert;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class insertSubject {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public insertSubject() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	   /**
	   * Insert a new Subject.
	   * @param Object of class subject.java
	   * @return The inserted comment if successful "true", otherwise "false".
	   */
	public boolean insertSubjectRecord(model.dto.subject sub) throws SQLException{
		sql = "INSERT INTO tbsubject(sub_name,description) VALUES(?, ?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, sub.getSub_name());
		ps.setString(2, sub.getDescription());
		if(ps.executeUpdate()>0){
			ps.close();
			con.close();
			return true;
		}else{
			ps.close();
			con.close();
			return false;
		}
	}
}
