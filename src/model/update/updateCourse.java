package model.update;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.Callable;

import utils.Convertor;

public class updateCourse {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public updateCourse() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	 /**
	   * Update record of Course.
	   * @param Object of class course.java
	   * @param id for update record
	   * @return The updated comment if successful "true", otherwise "false".
	   */
	public boolean updateCourseRecord(model.dto.course course) throws SQLException{
		sql = "UPDATE tbcourse SET cou_name = ?, start_date=?, end_date=?, gen_id=? WHERE cou_id =?";
		ps = con.prepareStatement(sql);
		ps.setString(1, course.getCou_name());
		ps.setDate(2, Convertor.utilToSQLDate(course.getStart_date()));
		
		/*convert From java.util.Date in to java.sql.Date 
		 *form object getEnd_date into endDate
		 */
		ps.setDate(3, Convertor.utilToSQLDate(course.getEnd_date()));
		
		ps.setInt(4, course.getGen_id());
		ps.setInt(5, course.getCou_id());
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
	   * Update record of Course.
	   * @param Object of class course.java
	   * @param id for update record
	   * @return The updated comment if successful "true", otherwise "false".
	   */
	public boolean updateCourseState(int cou_id) throws SQLException{
	
		CallableStatement ps = con.prepareCall("{call upd_coueff_clas_staff(?)}");
		ps.setInt(1, cou_id);
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
