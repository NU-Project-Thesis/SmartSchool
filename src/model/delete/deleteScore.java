package model.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class deleteScore {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public deleteScore() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	/**
	   * Delete record from Class
	   * @param id for delete
	   * @return The delete comment if successful "true", otherwise "false".
	   * @throws SQLException 
	   */
	public boolean deleteScoreRule(int id) throws SQLException{
		sql="DELETE FROM tbrule WHERE rule_id= ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		if(ps.executeUpdate()>0){
			ps.close();
			con.close();
			return true;
		}
		ps.close();
		con.close();
		return false;
	}
}
