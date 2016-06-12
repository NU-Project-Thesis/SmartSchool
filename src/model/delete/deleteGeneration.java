package model.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class deleteGeneration {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";
	public deleteGeneration() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	/**
	   * Delete record from generation
	   * @param id for delete
	   * @return The Update comment if successful "true", otherwise "false".
	   * @throws SQLException 
	   */
	public boolean deleteGenerationRecord(int id) throws SQLException{
		sql="DELETE FROM tbgeneration WHERE gen_id = ?";
		ps = con.prepareStatement(sql);
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
