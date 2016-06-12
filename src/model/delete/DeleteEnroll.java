package model.delete;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class DeleteEnroll {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public DeleteEnroll() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	/**
	   * Delete record from tbClassEnroll
	   * @param id for delete
	   * @return The delete comment if successful "true", otherwise "false".
	   * @throws SQLException 
	   */
	public boolean deleteClassEnroll(int id) throws SQLException{
		System.out.println("M"+id);
		try{
			
			CallableStatement ps =con.prepareCall("{call del_classenroll_effstaff(?)}");
			ps.setInt(1, id);
			ps.execute();
			
			System.err.println("M"+id);
			ps.close();
			con.close();
			System.err.println("Ms"+id);
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean deleteStudentEnroll(int id) throws SQLException{
		
		try{
			
			CallableStatement ps =con.prepareCall("{call del_stu_enrol_effstu(?)}");
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
			con.close();
			return true;
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
		
	}
}
