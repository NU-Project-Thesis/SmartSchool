package controller.insert;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.ScoreRule;
import utils.Convertor;

/**
 * Servlet implementation class CourseInsert
 */
@WebServlet("/admin/insertScoreRule.hrd")
public class InsertScoreRule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertScoreRule() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create method doProcess type of boolean
	 * 
	 * @param getParamater
	 *            from view_course such as cus_name, cus_startdate , cus_enddate
	 *            , cus_id,cus_finish id is auto number _ then throw into
	 *            ModelInsert call method insertCourseRecvord excuteQuery insert
	 *            into DB.
	 * @return "true" if insert successful, else return "false" unsuccessful.
	 * @throws IOException
	 **/
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			
			model.dto.ScoreRule dto = new ScoreRule();
			dto.setCou_id(Integer.parseInt(request.getParameter("cou_id")));
			dto.setDetail_grade(request.getParameter("detail_grade"));
			dto.setGrade(request.getParameter("grade"));
			dto.setRank_lower(Integer.parseInt(request.getParameter("rank_lower")));
			dto.setRank_top(Integer.parseInt(request.getParameter("rank_top")));;
			
			if (new model.insert.InsertScore().insertScoreRule(dto)) {
				response.getWriter().write("Success");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().write("Fail");

	}

}
