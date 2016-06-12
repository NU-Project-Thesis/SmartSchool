package model.insert;

import java.sql.*;

import utils.Convertor;

public class insertGeneration {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public insertGeneration() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	   /**
	   * Insert a new Generation.
	   * @param Object of class generation.java
	   * @return The inserted comment if successful "true", otherwise "false".
	   */
	public boolean insertGenerationRecord(model.dto.generation gen) throws SQLException{
		//INSERT INTO tbgeneration VALUES(4,'1 Generation', '2015-10-10', '2016-10-10','false')
		sql = "INSERT INTO tbgeneration(gen_name, start_date, end_date, is_finish) VALUES(?, ?, ?, ?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, gen.getGen_name());
		
		/*convert From java.util.Date in to java.sql.Date 
		 *form object getStart_date into startDate
		 */
		java.sql.Date startDate =  Convertor.utilToSQLDate(gen.getStart_date());
		ps.setDate(2, startDate);
		
		/*convert From java.util.Date in to java.sql.Date 
		 *form object getEnd_date into endDate
		 */
		java.sql.Date endDate = Convertor.utilToSQLDate(gen.getEnd_date());
		ps.setDate(3, endDate);
		
		ps.setBoolean(4, gen.isIs_finish());
		if(ps.executeUpdate()>0){
			ps.close();
			con.close();
			return true;
		}else{
			ps.close();
			con.close();
			return false;
		}
	}
}
