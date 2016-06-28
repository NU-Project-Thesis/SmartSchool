package model.insert;

import java.sql.*;

import model.select.selectGeneration;
import utils.Convertor;

public class insertGeneration {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public insertGeneration() throws ClassNotFoundException, SQLException{
		con = new connection.ConnectionDB().getConnection();
	}
	
	/**
	 * 
	 * @param gen
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean insertGenerationRecord(model.dto.generation gen) throws SQLException, ClassNotFoundException{
		//INSERT INTO tbgeneration VALUES(4,'1 Generation', '2015-10-10', '2016-10-10','false')
		if (new selectGeneration().checkGeneration() == false) {
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
		return false;
	}
}
