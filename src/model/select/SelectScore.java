package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import connection.ConnectionDB;
import model.dto.ScoreDTO;
import utils.Convertor;

public class SelectScore {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";

	public SelectScore() throws ClassNotFoundException, SQLException {
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}

	public ResultSet scorePermission(int staffid) throws SQLException {
		ps = con.prepareStatement("select * from score_permission where staff_id=?");
		ps.setInt(1, staffid);
		return ps.executeQuery();

	}
	
	public ResultSet studentNoScore(int staff_id, int class_id) throws SQLException {
		/*
		 * this method is used to select student for inserting
		 * */
		ps = con.prepareStatement("select * from sel_stu_no_sc "
									+ "where staff_id=?");
		ps.setInt(1, staff_id);
		/*ps.setInt(2, class_id);*/
		return ps.executeQuery();

	}
	
	public ResultSet studentWithScore(int staff_id, int class_id, Date d) throws SQLException, ParseException {
		/*change only sql statement
		 * this method is used to select student for inserting
		 * */
		ps = con.prepareStatement("select * from display_stu_with_score "
				+ "WHERE staff_id = ? AND to_char(score_date,'YYYY-MM') = ?");
		
		ps.setInt(1, staff_id);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
		System.out.println(sd.format(d));
		System.out.println(sd.parse(sd.format(d)+"-01"));
		//ps.setDate(2, Convertor.utilToSQLDate(sd.parse(sd.format(d)+"-01")));
		//ps.setDate(3, Convertor.utilToSQLDate(sd.parse(sd.format(d)+"-29")));
		ps.setString(2, sd.format(d));
		return ps.executeQuery();

	}


	/**
	 * Select All record from tbclass
	 * 
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet SelectClassRecord() throws SQLException {
		sql = "SELECT * from view";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}
	
	public ResultSet selectScoreRule() throws SQLException {
		sql = "SELECT * from viewscorerule";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}

	public void close() throws SQLException {
		if (rs != null)
			rs.close();

		if (ps != null)
			ps.close();

		if (con != null)
			con.close();
	}
	
}
