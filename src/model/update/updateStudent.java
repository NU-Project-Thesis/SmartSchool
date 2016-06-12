package model.update;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectionDB;
import utils.Convertor;

public class updateStudent {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	public updateStudent() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	 /**
	   * Update record of Student.
	   * @param Object of class student.java
	   * @param id for update record
	   * @return The updated comment if successful "true", otherwise "false".
	 * @throws NoSuchAlgorithmException 
	   */
	public boolean updateStudentRecord(model.dto.Student stu) throws SQLException, NoSuchAlgorithmException{
		sql = "UPDATE tbstudent SET first_name=?, last_name=?, gender=?, dob=?, email=?, address=?, phone=?, race=?, social_id=?, photo=?, father_name=?, father_phone=?, mother_name=?, mother_phone=? WHERE stu_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, stu.getFirst_name());
		ps.setString(2, stu.getLast_name());
		/*to add char into setString*/
		ps.setString(3, stu.getGender()+"");
		
		/*convert From java.util.Date in to java.sql.Date 
		 *form object getStart_date into startDate
		 */
		ps.setDate(4, Convertor.utilToSQLDate(stu.getDob()));
		
		ps.setString(5,stu.getEmail());
		/*ps.setString(6, ultilities.Encrypt.process(stu.getPassword()));*/
		ps.setString(6, stu.getAddress());
		
		ps.setString(7, stu.getPhone());
		ps.setString(8, stu.getRace());
		ps.setString(9, stu.getSocial_id());
		ps.setString(10, stu.getPhoto().toLowerCase());
		ps.setString(11, stu.getFather_name());
		ps.setString(12, stu.getFather_phone());
		ps.setString(13, stu.getMother_name());
		ps.setString(14, stu.getMother_phone());
		ps.setInt(15, stu.getStu_id());
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
	
	/**
	 * Update student status
	 * */
	public boolean updateStudentState(int stu_id, String status) throws SQLException{
		sql = "UPDATE tbstudent SET status=? WHERE stu_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, status);
		ps.setInt(2, stu_id);
		
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
	
	public static boolean changePassword(int id, String old_pass, String new_pass) throws Exception{
		Connection con = ConnectionDB.getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT password FROM tbstudent WHERE stu_id=? AND password=?");
		
		ps.setInt(1, id);
		ps.setString(2, utils.Encrypt.process(old_pass));
		
		if(ps.executeQuery().next()){
			// update password
			ps.close();
			
			PreparedStatement pps = con.prepareStatement("UPDATE tbstudent SET password=? WHERE stu_id=?");
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
