package model.select;

import java.sql.*;
import java.util.ArrayList;

import connection.ConnectionDB;

public class selectGeneration {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public selectGeneration() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	/**
	 * Select record from generation
	 * 
	 * @return ResultSet.
	 * @throws SQLException
	 */
	public ResultSet SelectGenerationRecord() throws SQLException {
		sql = "SELECT * FROM tbgeneration ORDER BY gen_name ASC";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;

	}
	
	/**
	 * Select record from generation that is_finish is false
	 * 
	 * @return ResultSet.
	 * @throws SQLException
	 */
	public ResultSet selectActiveGen() throws SQLException {
		sql = "SELECT * FROM tbgeneration WHERE is_finish=false order by gen_id asc";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;

	}
	
	/**
	   * Select record from generation
	   * @param int genID for select by gen_id
	   * @return ResultSet
	   * @throws SQLException 
	   */
	public ResultSet SelectGenerationByID(int genID) throws SQLException{
		sql = "SELECT * FROM tbgeneration Where gen_id = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, genID);
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
