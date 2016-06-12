package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import connection.ConnectionDB;

public class selectCourse {
	// SELECT c.cou_id,c.cou_name,c.cou_descrip,g.gen_id,g.gen_name FROM
	// tbcourse c INNER JOIN tbgeneration g on c.gen_id = g.gen_id
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";

	public selectCourse() throws ClassNotFoundException, SQLException {
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}

	/**
	 * Select record from tbcourse
	 * 
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet SelectCourseRecord() throws SQLException {
		sql = "SELECT c.cou_id, c.cou_name, c.start_date, c.end_date, c.is_finish, g.gen_id, g.gen_name FROM tbgeneration g inner JOIN tbcourse c on g.gen_id=c.gen_id";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}
	
	/**
	 * Select record from tbcourse where is_finish=false
	 * 
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet SelectActiveCourse() throws SQLException {
		sql = "SELECT cou_id, cou_name, gen_id from tbcourse WHERE is_finish=false";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}

	/**
	 * Select record from tblcourse
	 * 
	 * @param int
	 *            courseID for select by cou_id
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet SelectCourseByID(int courseID) throws SQLException {
		sql = "SELECT c.cou_id, c.cou_name, c.start_date, c.end_date, c.is_finish, g.gen_id, g.gen_name FROM tbgeneration g inner JOIN tbcourse c on g.gen_id=c.gen_id Where cou_id = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, courseID);
		rs = ps.executeQuery();
		return rs;
	}
	
	/**
	 * select course based on gen_id
	 * */
	public ResultSet selectCourseGen(int gen_id) throws SQLException {
		sql = "SELECT c.cou_id, c.cou_name, c.start_date, c.end_date, c.is_finish, g.gen_id, g.gen_name FROM tbgeneration g inner JOIN tbcourse c on g.gen_id=c.gen_id Where C.gen_id = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, gen_id);
		rs = ps.executeQuery();
		return rs;
	}
	
	public void close() throws SQLException{
		if(rs != null)
			rs.close();
		
		if(ps != null)
			ps.close();
		
		if(con != null)
			con.close();
	}
}
