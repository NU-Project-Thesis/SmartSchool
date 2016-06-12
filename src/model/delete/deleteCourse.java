package model.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class deleteCourse {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public deleteCourse() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	/**
	   * Delete record from Course
	   * @param id for delete
	   * @return The delete comment if successful "true", otherwise "false".
	   * @throws SQLException 
	   */
	public boolean deleteCourseRecord(int id) throws SQLException{
		sql="DELETE FROM tbcourse WHERE cou_id= ?";
		ps = con.prepareStatement(sql);
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
