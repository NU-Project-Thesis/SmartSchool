package model.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectionDB;

public class DeleteStaff {
	
	
	/***
	 * @param staff_id is staff id 
	 * this method is update by staff_id,
	 * update status to drop so equal delete
	 * @return if update done this method return true
	 * */
	public static Boolean deleteProcess(int staff_id) throws ClassNotFoundException, SQLException{
		
		Connection con = ConnectionDB.getConnection();
		PreparedStatement pps = con.prepareStatement("update tbstaff set status='drop' where staff_id=?");
		pps.setInt(1, staff_id);
		
		if(pps.executeUpdate()>0){
			return true;
		}
		return false;
	}
	
}
