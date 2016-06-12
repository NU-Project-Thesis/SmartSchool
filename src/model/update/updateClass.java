package model.update;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class updateClass {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public updateClass() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	 /**
	   * Update record of Class.
	   * @param Object of class class.java
	   * @param id for update record
	   * @return The updated comment if successful "true", otherwise "false".
	   */
	public boolean updateClassRecord(model.dto.room room) throws SQLException{
		sql = "UPDATE tbclass SET class_name = ?, cou_id=? WHERE class_id =?";
		ps = con.prepareStatement(sql);
		ps.setString(1, room.getClass_name());
		ps.setInt(2, room.getCou_id());
		ps.setInt(3, room.getClass_id());
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
	
	public boolean updateClassState(int class_id) throws SQLException{
		CallableStatement ps = con.prepareCall("{call upd_clas_staff(?)}");
		ps.setInt(1, class_id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			if(rs.getBoolean(1)){
				ps.close();
				con.close();
				return true;
			}
		}
		ps.close();
		con.close();
		return false;
	}
}
