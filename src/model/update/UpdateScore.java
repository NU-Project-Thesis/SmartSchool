package model.update;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectionDB;
import model.dto.ScoreDTO;

public class UpdateScore {
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	
	public UpdateScore() throws ClassNotFoundException, SQLException{
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}
	
	/**	
	 * @author soklu_000
	 * @return true if insert done
	 * @param object ScoreDTO 
	 * this method process for update into table tbscore
	 * **/
	
	public static boolean process(int id, float score) throws ClassNotFoundException, SQLException{
		
		Connection con = ConnectionDB.getConnection();
		PreparedStatement pps = con.prepareStatement("UPDATE tbscore set score=? WHERE score_id=?");
		System.out.println(id);
		System.out.println(score);
		new model.update.UpdateScore();
		pps.setFloat(1, score);
		pps.setInt(2, id);
		
		if(pps.executeUpdate()>0){
			return true;
		}
		return false;
	}
	
	public boolean updateScoreRule(model.dto.ScoreRule dto) throws SQLException{
		sql = "UPDATE tbrule SET grade=?, rank_lower=?, rank_top=?, cou_id=?, detail_grade=? WHERE rule_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getGrade());
		ps.setInt(2, dto.getRank_lower());
		ps.setInt(3, dto.getRank_top());
		ps.setInt(4, dto.getCou_id());
		ps.setString(5, dto.getDetail_grade());
		ps.setInt(6, dto.getRule_id());
		
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
