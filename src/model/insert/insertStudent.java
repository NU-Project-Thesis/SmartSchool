package model.insert;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.Convertor;
import utils.Encrypt;

public class insertStudent {
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";

	public insertStudent() throws ClassNotFoundException, SQLException {
		con = new connection.ConnectionDB().getConnection();
	}

	/**
	 * Insert a new Student.
	 * 
	 * @param Object
	 *            of class student.java
	 * @return The inserted comment if successful "true", otherwise "false".
	 * @throws NoSuchAlgorithmException 
	 */
	public boolean insertStudentRecord(model.dto.Student stu) throws SQLException, NoSuchAlgorithmException {
		sql = "INSERT INTO tbstudent(first_name, last_name, gender, dob, email, password, address, phone, race, social_id, photo, father_name, father_phone, mother_name, mother_phone, status) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, stu.getFirst_name());
		ps.setString(2, stu.getLast_name());
		/* to add char into setString */
		ps.setString(3, String.valueOf(stu.getGender()));

		/*
		 * convert From java.util.Date in to java.sql.Date form object
		 * getStart_date into startDate
		 */
		ps.setDate(4, Convertor.utilToSQLDate(stu.getDob()));

		ps.setString(5, stu.getEmail());
		ps.setString(6, Encrypt.process(stu.getPassword()));
		ps.setString(7, stu.getAddress());
		ps.setString(8, stu.getPhone());
		ps.setString(9, stu.getRace());
		ps.setString(10, stu.getSocial_id());
		ps.setString(11, stu.getPhoto());
		ps.setString(12, stu.getFather_name());
		ps.setString(13, stu.getFather_phone());
		ps.setString(14, stu.getMother_name());
		ps.setString(15, stu.getMother_phone());
		ps.setString(16, "available");
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
}
