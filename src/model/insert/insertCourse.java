package model.insert;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.Convertor;

public class insertCourse {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public insertCourse() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	   /**
	   * Insert a new Generation.
	   * @param Object of class generation.java
	   * @return The inserted comment if successful "true", otherwise "false".
	   */
	public boolean insertCourseRecord(model.dto.course course) throws SQLException{
		sql = "INSERT INTO tbcourse(cou_name, start_date, end_date, gen_id, is_finish) VALUES(?, ?, ?, ?, ?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, course.getCou_name());
		
		/*convert From java.util.Date in to java.sql.Date 
		 *form object getStart_date into startDate
		 */
		ps.setDate(2, Convertor.utilToSQLDate(course.getStart_date()));
		
		/*convert From java.util.Date in to java.sql.Date 
		 *form object getEnd_date into endDate
		 */
		ps.setDate(3, Convertor.utilToSQLDate(course.getEnd_date()));
		
		ps.setInt(4, course.getGen_id());
		ps.setBoolean(5, course.isIs_finish());
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
