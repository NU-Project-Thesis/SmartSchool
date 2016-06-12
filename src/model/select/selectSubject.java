package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class selectSubject {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public selectSubject() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	   /**
	   * Select All record from tbsubject
	   * @return ResultSet
	   * @throws SQLException 
	   */
	public ResultSet SelectSubjectRecord() throws SQLException{
		sql = "SELECT * FROM tbsubject";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}
	
	/**
	   * Select record from tbsubject
	   * @param int subID for select by sub_id
	   * @return ResultSet
	   * @throws SQLException 
	   */
	public ResultSet SelectSubjectByID(int subID) throws SQLException{
		sql = "SELECT * FROM tbsubject Where sub_id = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, subID);
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
