package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class SelectlistStaff {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	
	public SelectlistStaff() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	/**
	 * Select record from generation
	 * 
	 * @return ResultSet.
	 * @throws SQLException
	 */
	public ResultSet SelectStaffRecord() throws SQLException {
		sql = "SELECT * FROM tbstaff";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;

	}
	
	public ResultSet SelectStaffRecordById(int staff_id) throws SQLException{
		sql = "SELECT * FROM tbstaff where staff_id=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, staff_id);
		rs = ps.executeQuery();
		return rs;
	}


	public int getLastID() throws SQLException {
			sql = "SELECT last_value FROM seq_staff;";
			ps = con.prepareStatement(sql);
		//	ps.setInt(1, classID);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1)+1;
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
