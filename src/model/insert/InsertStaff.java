package model.insert;

import java.security.NoSuchAlgorithmException;
import java.sql.*;

import connection.ConnectionDB;
import model.dto.StaffDTO;
import utils.Encrypt;

public class InsertStaff {

	/***
	 * @author soklu_000
	 * @param <b>Object StaffDTO</b> This method will insert data in to table
	 *        tbStaff and insert no need field staff_status
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws NoSuchAlgorithmException
	 * */
	public boolean insertProcess(StaffDTO staff)
			throws ClassNotFoundException, SQLException,
			NoSuchAlgorithmException {

		new connection.ConnectionDB();
		Connection con = ConnectionDB.getConnection();
		PreparedStatement pps = con
				.prepareStatement("INSERT INTO tbstaff (first_name,last_name,gender,"
						+ "position,phone,email,pasword,photo)"
						+ "VALUES(?,?,?,?,?,?,?,?);");

		pps.setString(1, staff.getFirstName());
		pps.setString(2, staff.getLastName());
		pps.setString(3, String.valueOf(staff.getGender()));
		pps.setString(4, staff.getPosition());
		pps.setString(5, staff.getPhone());
		pps.setString(6, staff.getEmail());

		// encrypt block
		pps.setString(7, Encrypt.process(staff.getPassword()));
		pps.setString(8, staff.getPhoto());
		if (pps.executeUpdate() > 0) {
			pps.close();
			con.close();
			return true;
		}
		pps.close();
		con.close();
		return false;
	}
}
