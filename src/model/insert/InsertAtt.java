package model.insert;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import connection.ConnectionDB;
import model.dto.AttendanceDTO;

public class InsertAtt {

	/***
	 * @author soklu_000
	 * @param stuArrId
	 *            is array of string that get array from view
	 * @param att
	 *            is object of AttendanceDTO that use for get
	 *            att_type,get_Description,Date
	 * @return true is insert
	 */
	public static boolean process(String[] stuArrId, AttendanceDTO att) throws SQLException, ClassNotFoundException {
		try {
			Connection con = ConnectionDB.getConnection();
			CallableStatement pps = con.prepareCall("{call addatt(?,?,?,?)}");

			// convert from stuArrId array to sql array
			Array arr = con.createArrayOf("integer", stuArrId);

			pps.setArray(1, arr);
			Date d = new Date(att.getAttDate().getTime());
			pps.setDate(2, d);
			pps.setString(3, att.getDescription());
			pps.setString(4, att.getShift());

			pps.executeUpdate();
			pps.close();
			con.close();
			return true;
		} catch (Exception e) {}

		return false;
	}

	public static void main(String[] args) throws ParseException, ClassNotFoundException, SQLException {

		AttendanceDTO att = new AttendanceDTO();
		SimpleDateFormat sd = new SimpleDateFormat("MM-dd-yyyy");
		att.setAttDate(sd.parse("09-03-2015"));
		String a[] = { "1003", "1004" };
		process(a, att);
	}

}
