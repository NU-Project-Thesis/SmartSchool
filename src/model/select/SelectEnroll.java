package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import connection.ConnectionDB;
import model.dto.StaffDTO;

public class SelectEnroll {
	
	private Connection con = null;
	private PreparedStatement pps =null;
	private ResultSet rs  = null;
	
	/**
	 * Select Staff Enroll
	 * */
	public SelectEnroll() throws ClassNotFoundException, SQLException{
		con=ConnectionDB.getConnection();
	}
	
	public ResultSet selectStaffEnroll() throws SQLException{
		pps = con.prepareStatement("SELECT * FROM viewStaffEnroll"); 
		rs = pps.executeQuery();
		return rs;
	}
	
	public ResultSet selectStudentEnroll() throws SQLException{
		pps = con.prepareStatement("SELECT * FROM viewStudentEnroll"); 
		rs = pps.executeQuery();
		return rs;
	}

	/*select available staff*/
	public ResultSet availableInstructor() throws SQLException{
		pps = con.prepareStatement("SELECT staff_id, first_name, last_name FROM tbstaff WHERE status <> 'drop' AND position='Instructor'"); 
		rs = pps.executeQuery();
		return rs;
	}
	
	/*select available student*/
	public ResultSet availableStudent() throws SQLException{
		pps = con.prepareStatement("SELECT stu_id, first_name, last_name FROM tbstudent WHERE status='available'"); 
		rs = pps.executeQuery();
		return rs;
	}
	
	public void close() throws SQLException{
		if(rs != null)
			rs.close();
		
		if(pps != null)
			pps.close();
		
		if(con != null)
			con.close();
	}
	
}
