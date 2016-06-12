package model.select;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itextpdf.text.pdf.draw.DottedLineSeparator;

import connection.ConnectionDB;
import model.dto.StaffDTO;
import model.dto.Student;
import utils.Encrypt;

public class SelectLogin {

	private Connection con = null;
	private PreparedStatement pps = null;

	public SelectLogin() throws ClassNotFoundException, SQLException {
		con = ConnectionDB.getConnection();
	}

	public StaffDTO procesStaf(StaffDTO staf) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException {

		pps = con.prepareStatement(
				"select * FROM tbstaff where email=? and pasword=?");
		pps.setString(1, staf.getEmail());
		pps.setString(2, Encrypt.process(staf.getPassword()));
		System.out.println(Encrypt.process(staf.getPassword()));
		StaffDTO dto = null;
		ResultSet rs = pps.executeQuery();
		if (rs.next()) {
			dto = new StaffDTO();
			dto.setId(rs.getInt("staff_id"));
			dto.setFirstName(rs.getString("first_name"));
			dto.setLastName(rs.getString("last_name"));
			dto.setGender(rs.getString("gender").charAt(0));
			dto.setEmail(rs.getString("email"));
			dto.setPhoto(rs.getString("photo"));
			dto.setPhone(rs.getString("phone"));
			dto.setPassword(rs.getString("pasword"));
			dto.setPosition(rs.getString("position"));
			dto.setStatus(rs.getString("status"));
			return dto;
		}
		return null;
	}

	public Student procesStudent(Student stu) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException {

		pps = con.prepareStatement(
				"select * FROM tbstudent where email=? and password=?");
		pps.setString(1, stu.getEmail());
		pps.setString(2, Encrypt.process(stu.getPassword()));
		ResultSet rs = pps.executeQuery();
		Student dto = new Student();
		if (rs.next()) {
			dto.setStu_id(rs.getInt("stu_id"));
			dto.setFirst_name(rs.getString("first_name"));
			dto.setLast_name(rs.getString("last_name"));
			dto.setGender(rs.getString("gender").charAt(0));
			dto.setDob(rs.getDate("dob"));
			dto.setEmail(rs.getString("email"));
			dto.setPassword(rs.getString("password"));
			dto.setAddress(rs.getString("address"));
			dto.setPhone(rs.getString("phone"));
			dto.setRace(rs.getString("race"));
			dto.setSocial_id(rs.getString("social_id"));
			dto.setPhoto(rs.getString("photo"));
			dto.setFather_name(rs.getString("father_name"));
			dto.setFather_phone(rs.getString("father_phone"));
			dto.setMother_name(rs.getString("mother_name"));
			dto.setMother_phone(rs.getString("mother_phone"));
			dto.setStatus(rs.getString("status"));
			return dto;
			
		}
		return null;
	}

	public void close() throws SQLException {

		if (pps != null)
			pps.close();

		if (con != null)
			con.close();
	}

}
