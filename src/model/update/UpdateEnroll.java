package model.update;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateEnroll {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";

	public UpdateEnroll() throws ClassNotFoundException, SQLException {
		con = new connection.ConnectionDB().getConnection();
	}

	
	public boolean updateStaffEnroll(model.dto.ClassEnroll enroll) throws SQLException {
		sql = "UPDATE tbclassenroll SET sub_id=?, class_id=? WHERE class_enroll=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, enroll.getSub_id());
		ps.setInt(2, enroll.getClass_id());
		ps.setInt(3, enroll.getClass_enroll());
		if (ps.executeUpdate() > 0) {
			ps.close();
			con.close();
			return true;
		} else {
			ps.close();
			con.close();
			return false;
		}
	}
	
	public boolean updateStudentEnroll(model.dto.StudentEnroll enroll) throws SQLException {
		sql = "UPDATE tbstudentenroll SET stu_id=?, class_id=? description=? WHERE stu_enroll=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, enroll.getStu_id());
		ps.setInt(2, enroll.getClass_id());
		ps.setString(3, enroll.getDescription());
		ps.setInt(4, enroll.getStu_enroll());
		if (ps.executeUpdate() > 0) {
			ps.close();
			con.close();
			return true;
		} else {
			ps.close();
			con.close();
			return false;
		}
	}
	
	public void close() throws SQLException{
		if(ps!=null)
			ps.close();
		if(con!=null)
			con.close();
	}
}
