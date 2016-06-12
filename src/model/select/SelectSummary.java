package model.select;

import java.sql.*;
import java.util.ArrayList;

import connection.ConnectionDB;

public class SelectSummary {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public SelectSummary() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	/**
	 * Select record from generation
	 * 
	 * @return ResultSet.
	 * @throws SQLException
	 */
	public ResultSet selectSummary() throws SQLException {
		sql = "SELECT * FROM tbgeneration ORDER BY gen_name ASC";
		st = con.createStatement();
		rs = st.executeQuery(sql);
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
