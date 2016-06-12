package model.update;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class updateSubject {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public updateSubject() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	 /**
	   * Update record of Subject.
	   * @param Object of class subject.java
	   * @param id for update record
	   * @return The updated comment if successful "true", otherwise "false".
	   */
	public boolean updateSubjectRecord(model.dto.subject sub) throws SQLException{
		sql = "UPDATE tbsubject SET sub_name = ?, description=? WHERE sub_id =?";
		ps = con.prepareStatement(sql);
		ps.setString(1, sub.getSub_name());
		ps.setString(2, sub.getDescription());
		ps.setInt(3, sub.getSub_id());
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
	
	/**
	 * Update Subject Status
	 * */
	public boolean updateSubjectState(int sub_id) throws SQLException{
		sql = "UPDATE tbsubject SET active=not active WHERE sub_id =?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, sub_id);
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
