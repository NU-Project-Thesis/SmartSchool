package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import connection.ConnectionDB;
import utils.Convertor;

public class selectAttendance {
	// SELECT c.cou_id,c.cou_name,c.cou_descrip,g.gen_id,g.gen_name FROM
	// tbcourse c INNER JOIN tbgeneration g on c.gen_id = g.gen_id
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";

	public selectAttendance() throws ClassNotFoundException, SQLException {
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}

	/**
	 * Select record from tbcourse where is_finish=false
	 * 
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet selectRecord() throws SQLException {
		sql = "SELECT * from viewattendance";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}
	
	public ResultSet selectDailyAttendance() throws SQLException {
		st = con.createStatement();
		return st.executeQuery("SELECT * from dailyattendance");
	}

	public ResultSet selectAttendanceById(int id) throws SQLException {
		ps = con.prepareStatement("SELECT * from viewattendancebyid WHERE stu_id=?");
		ps.setInt(1, id);
		return ps.executeQuery();
	}
	
	public void close() throws SQLException {
		if (rs != null)
			rs.close();

		if (ps != null)
			ps.close();

		if (con != null)
			con.close();
	}
}
