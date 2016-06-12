package model.insert;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import connection.ConnectionDB;
import model.dto.ScoreDTO;
import utils.Convertor;

public class InsertScore {

	
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	
	public InsertScore() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	/***
	 * @author soklu_000
	 * @param Object
	 *            ScoreDTO
	 * @return true is insert done
	 * 
	 *         this method use to insert data into table tbscore
	 */

	public static boolean process(String score[], String stuId[], ScoreDTO scoreDto, int class_id)
			throws ClassNotFoundException, SQLException {
		Connection con = null;
		CallableStatement ps = null;
		con = ConnectionDB.getConnection();
		ps = con.prepareCall("{call addScore(?,?,?,?,?,?)}");
		Array arrScore = con.createArrayOf("numeric", score);
		ps.setArray(1, arrScore);

		// using for get of year and month for check in postgresql function
		SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM");
		ps.setString(2, sd.format(scoreDto.getScoreDate()));

		ps.setDate(3, Convertor.utilToSQLDate(scoreDto.getScoreDate()));

		Array arrStuId = con.createArrayOf("integer", stuId);
		ps.setArray(4, arrStuId);

		ps.setInt(5, scoreDto.getSubId());
		ps.setInt(6, class_id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) > 0) {
				ps.close();
				con.close();
				return true;
			}
		}

		ps.close();
		con.close();
		return false;

	}
	
	public boolean insertScoreRule(model.dto.ScoreRule dto) throws SQLException{
		sql = "INSERT INTO tbrule(grade, rank_lower, rank_top, cou_id, detail_grade) VALUES(?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getGrade());
		ps.setInt(2, dto.getRank_lower());
		ps.setInt(3, dto.getRank_top());
		ps.setInt(4, dto.getCou_id());
		ps.setString(5, dto.getDetail_grade());
		
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
}
