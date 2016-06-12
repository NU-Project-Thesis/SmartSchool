package model.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class deleteSubject {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public deleteSubject() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	/**
	   * Delete record from subject
	   * @param id for delete
	   * @return The delete comment if successful "true", otherwise "false".
	   * @throws SQLException 
	   */
	public boolean deleteSubjectRecord(int id) throws SQLException{
		sql="DELETE FROM tbsubject WHERE sub_id= ?";
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
