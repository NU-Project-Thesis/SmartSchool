package model.update;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectionDB;
import model.dto.StaffDTO;

public class UpdateStaff {

	
	/***
	 * @author soklu_000
	 * @param staff is object StaffDTO 
	 * @return true if update success
	 * this method process update data to tbStaff
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws NoSuchAlgorithmException
	 * */
	public static boolean updateProcess(StaffDTO staff) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement pps = con.prepareStatement("UPDATE tbstaff set first_name=?,last_name=?,"
				+ "gender=?,position=?,phone=?,email=? ,photo=? "
				+ "WHERE staff_id=?");
		
		pps.setString(1, staff.getFirstName());
		pps.setString(2, staff.getLastName());
		pps.setString(3, String.valueOf(staff.getGender()));
		pps.setString(4, staff.getPosition());
		pps.setString(5, staff.getPhone());
		pps.setString(6, staff.getEmail());
		//encrypt password then update
		/*pps.setString(7, Encrypt.process(staff.getPassword()));*/
		pps.setString(7, staff.getPhoto());
		pps.setInt(8, staff.getId());
		
		
		if(pps.executeUpdate()>0){
			pps.close();
			con.close();
			return true;
		}
		
		return false;
	}
	
	public static boolean updateProfile(StaffDTO staff) throws SQLException, ClassNotFoundException{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement pps = con.prepareStatement("UPDATE tbstaff set first_name=?,last_name=?,"
				+ "gender=?,phone=?"
				+ "WHERE staff_id=?");
		pps.setString(1, staff.getFirstName());
		pps.setString(2, staff.getLastName());
		pps.setString(3, String.valueOf(staff.getGender()));
		pps.setString(4, staff.getPhone());
		pps.setInt(5, staff.getId());
		
		if(pps.executeUpdate()>0){
			pps.close();
			con.close();
			return true;
		}
		return false;
	}
	
	public static boolean updateImage(StaffDTO staff) throws SQLException, ClassNotFoundException{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement pps = con.prepareStatement("UPDATE tbstaff set photo=? WHERE staff_id=?");
		pps.setString(1, staff.getPhoto());
		pps.setInt(2, staff.getId());
		
		if(pps.executeUpdate()>0){
			pps.close();
			con.close();
			return true;
		}
		return false;
	}
	
	public static boolean updateStaffState(int staff_id, String status) throws ClassNotFoundException, SQLException{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement pps = con.prepareStatement("UPDATE tbstaff set status=? WHERE staff_id=?");
		
		pps.setString(1, status);
		pps.setInt(2, staff_id);
		
		if(pps.executeUpdate()>0){
			pps.close();
			con.close();
			return true;
		}
		
		return false;
	}
	
	public static boolean changePassword(int id, String old_pass, String new_pass) throws Exception{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT pasword FROM tbstaff WHERE staff_id=? AND pasword=?");
		
		ps.setInt(1, id);
		ps.setString(2, utils.Encrypt.process(old_pass));
		
		if(ps.executeQuery().next()){
			// update password
			ps.close();
			
			PreparedStatement pps = con.prepareStatement("UPDATE tbstaff SET pasword=? WHERE staff_id=?");
			pps.setString(1, utils.Encrypt.process(new_pass));
			pps.setInt(2, id);
			pps.executeUpdate();
			pps.close();
			con.close();
			return true;
		}
		ps.close();
		con.close();
		return false;
		
	}
}
