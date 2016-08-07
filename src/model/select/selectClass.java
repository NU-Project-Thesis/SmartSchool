package model.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.ConnectionDB;

public class selectClass {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement st = null;
	private String sql = "";

	public selectClass() throws ClassNotFoundException, SQLException {
		new connection.ConnectionDB();
		con = ConnectionDB.getConnection();
	}

	/**
	 * Select All record from tbclass
	 * 
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet SelectClassRecord() throws SQLException {
		sql = "SELECT cls.class_id,	cls.class_name,	cls.active,	course.cou_id,	course.cou_name,	gen.gen_name,	gen.gen_id FROM tbclass cls INNER JOIN tbcourse course ON cls.cou_id = course.cou_id INNER JOIN tbgeneration gen ON course.gen_id = gen.gen_id";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}
	//select active class
	
	/**
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet SelectActiveClass() throws SQLException {
		sql = "SELECT cl.class_id,cl.class_name,g.gen_id, g.gen_name FROM tbgeneration g inner JOIN tbcourse c on g.gen_id=c.gen_id inner JOIN tbclass cl on c.cou_id = cl.cou_id WHERE g.is_finish=FALSE";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}


	/**
	 * Select record from tblClass
	 * 
	 * @param int
	 *            classID for select by class_id
	 * @return ResultSet
	 * @throws SQLException
	 */
	public ResultSet SelectClassByID(int classID) throws SQLException {
		sql = "SELECT * FROM tbclass Where class_id = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, classID);
		rs = ps.executeQuery();
		return rs;
	}
	
	public void close() throws SQLException{
		if(rs != null)
			rs.close();
		
		if(ps != null)
			ps.close();
		
		if(con != null)
			con.close();
	}
}
