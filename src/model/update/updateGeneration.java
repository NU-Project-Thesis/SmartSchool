package model.update;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.Convertor;

public class updateGeneration {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";

	public updateGeneration() throws ClassNotFoundException, SQLException {
		con = new connection.ConnectionDB().getConnection();
	}

	/**
	 * Update record of Generation.
	 * 
	 * @param Object
	 *            of class generation.java
	 * @param id
	 *            for update record
	 * @return The inserted comment if successful "true", otherwise "false".
	 */
	public boolean updateGenerationRecord(model.dto.generation gen) throws SQLException {
		sql = "UPDATE tbgeneration SET gen_name =?, start_date=?, end_date=? WHERE gen_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, gen.getGen_name());
		ps.setDate(2, Convertor.utilToSQLDate(gen.getStart_date()));

		/*
		 * convert From java.util.Date in to java.sql.Date form object
		 * getEnd_date into endDate
		 */
		ps.setDate(3, Convertor.utilToSQLDate(gen.getEnd_date()));

		ps.setInt(4, gen.getGen_id());
		if (ps.executeUpdate() > 0) {
			ps.close();
			con.close();
			return true;
		} else {
			ps.close();
			con.close();
			return false;
		}
	}

	/**
	 * Update record of Generation.
	 * 
	 * @param Object
	 *            of class generation.java
	 * @param id
	 *            for update record
	 * @return The inserted comment if successful "true", otherwise "false".
	 */
	public boolean updateGenerationState(int gen_id) throws SQLException {
		
		CallableStatement ps = con.prepareCall("{call upd_geneff_cou_clas_staff(?)}");
		ps.setInt(1, gen_id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			if(rs.getBoolean(1)){
				ps.close();
				con.close();
				return true;
			}
		}
		ps.close();
		con.close();
		return false;
	}
}
