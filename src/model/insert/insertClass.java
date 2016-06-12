package model.insert;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectionDB;

public class insertClass {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public insertClass() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	   /**
	   * Insert a new Room.
	   * @param Object of class room.java
	   * @return The inserted comment if successful "true", otherwise "false".
	   */
	public boolean insertClassRecord(model.dto.room room) throws SQLException{
		sql = "INSERT INTO tbclass(class_name, cou_id) VALUES(?, ?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, room.getClass_name());
		ps.setInt(2, room.getCou_id());
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
