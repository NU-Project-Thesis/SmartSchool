package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class selectStudent {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	
	public selectStudent() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	   /**
	   * Select All record from tbstudent
	   * @return ResultSet
	   * @throws SQLException 
	   */
	public ResultSet SelectStudentRecord() throws SQLException{
		sql = "SELECT * FROM tbstudent";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}
	
	public ResultSet SelectStudentCourse(int id) throws SQLException{
		sql = "SELECT * FROM view_cou_stu WHERE stu_id=? and is_finish=true";
		ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		return ps.executeQuery();
	}
	
	public ResultSet SelectStudentById(int id) throws SQLException{
		ps = con.prepareStatement("SELECT * FROM tbstudent WHERE stu_id=?");
		ps.setInt(1, id);
		rs = ps.executeQuery();
		return rs;
	}
	
	/**
	   * Select record from tbstudent
	   * @param int stuID for select by stu_id
	   * @return ResultSet
	   * @throws SQLException 
	   */
	public ResultSet SelectClassByID(int classID) throws SQLException{
		sql = "SELECT * FROM tbstudent Where stu_id = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, classID);
		rs = ps.executeQuery();
		return rs;
	}
	public int getLastID() throws SQLException{
		sql = "SELECT last_value FROM seq_tbstudent;";
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
