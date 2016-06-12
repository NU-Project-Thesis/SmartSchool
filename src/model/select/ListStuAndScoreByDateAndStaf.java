package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import connection.ConnectionDB;
import model.dto.ScoreDTO;

public class ListStuAndScoreByDateAndStaf {

	private Connection con = null;
	private PreparedStatement pps = null;

	public ListStuAndScoreByDateAndStaf() throws ClassNotFoundException, SQLException {
		con = ConnectionDB.getConnection();
	}

	/***
	 * @author soklu_000
	 * @param int
	 *            Staff_id is number of staffid in tbStaff
	 * @param String
	 *            yearAndmm is date that want to see student name that have in
	 *            this yearAndmm(Year and Month)
	 * @param String
	 *            gen is genaration of this student
	 * @param String
	 *            cou is course of this student
	 * @note yearAndmm format is ("yyyy-MM") this method select student follow
	 *       staff ID and student are in this Month, genaration, course
	 * @return ResultSet
	 */
	public ResultSet process(int staff_id, String yearAndmm, String gen, String cou)
			throws ClassNotFoundException, SQLException, ParseException {
		pps = con.prepareStatement("SELECT tbstu.stu_id,tbstu.first_name ||' '||tbstu.last_name as FullName,"
				+ "tbstu.gender," + "tbscr.score_date," + "tbscr.score, " + "tbsub.sub_name," + "tbg.gen_name, "
				+ "tbc.cou_name," + "tbcla.class_name " + "FROM tbgeneration tbg "
				+ "INNER JOIN tbcourse tbc ON tbg.gen_id=tbc.gen_id "
				+ "INNER JOIN tbclass tbcla ON tbc.cou_id=tbcla.cou_id "
				+ "INNER JOIN tbclassenroll tbc_en ON tbc_en.class_id=tbcla.class_id "
				+ "INNER JOIN tbstaff tbs ON tbc_en.staff_id =tbs.staff_id "
				+ "INNER JOIN tbsubject tbsub ON  tbsub.sub_id = tbc_en.sub_id "
				+ "INNER JOIN tbstudentenroll tbs_en ON tbs_en.class_id = tbcla.class_id "
				+ "INNER JOIN tbstudent tbstu ON tbstu.stu_id = tbs_en.stu_id "
				+ "INNER JOIN tbscore tbscr ON tbscr.stu_id= tbstu.stu_id " + "where tbs.staff_id=? "
				+ "AND concat(extract(YEAR from tbscr.score_date),'-',extract(MONTH from tbscr.score_date)) = ? "
				+ "AND tbg.gen_name=? AND tbc.cou_name=? ");

		pps.setInt(1, staff_id);

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM");
		Date d = sf.parse(yearAndmm);
		pps.setString(2, sf.format(d));

		pps.setString(3, gen);
		pps.setString(4, cou);
		return pps.executeQuery();
	}
	
	public void close() throws SQLException{
		if(pps!=null)
			pps.close();
		if(con!=null)
			con.close();
	}

}
