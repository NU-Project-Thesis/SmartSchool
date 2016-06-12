package model.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class deleteClass {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public deleteClass() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	/**
	   * Delete record from Class
	   * @param id for delete
	   * @return The delete comment if successful "true", otherwise "false".
	   * @throws SQLException 
	   */
	public boolean deleteClassRecord(int id) throws SQLException{
		sql="DELETE FROM tbclass WHERE class_id= ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		if(ps.executeUpdate()>0){
			ps.close();
			con.close();
			return true;
		}
		ps.close();
		con.close();
		return false;
	}
}
