package model.insert;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectionDB;

public class InsertEnroll {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";

	public InsertEnroll() throws ClassNotFoundException, SQLException {
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}

	public boolean insertStaffEnroll(model.dto.ClassEnroll enroll) throws SQLException {

		CallableStatement ps = con.prepareCall("{call class_enroll(?, ?, ?)}");
		ps.setInt(1, enroll.getStaff_id());
		ps.setInt(2, enroll.getSub_id());
		ps.setInt(3, enroll.getClass_id());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) > 0) {

				System.out.println("inserted");
				ps.close();
				con.close();
				return true;
			}
		}
		ps.close();
		con.close();
		return false;
	}

	public boolean insertStudentEnroll(String[] stu_id, model.dto.StudentEnroll enroll) throws SQLException {
		/* sql = "SELECT student_enroll(stu_id, class_id) VALUES(?, ?)"; */
		try{
		CallableStatement ps = con.prepareCall("{call student_enroll(?,?)}");
		// convert from stuArrId array to sql array
		Array arr = con.createArrayOf("integer", stu_id);
		
		ps.setArray(1, arr);
		ps.setInt(2, enroll.getClass_id());
		ps.executeUpdate();
			ps.close();
			con.close();
			return true;
		}catch(SQLException e){
			
		}
		return false;
	}

	public void close() throws SQLException {
		if (ps != null)
			ps.close();
		if (con != null)
			con.close();
	}
}
