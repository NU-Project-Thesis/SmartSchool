package controller.insert;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Convertor;

/**
 * Servlet implementation class CourseInsert
 */
@WebServlet("/admin/courseInsert.hrd")
public class InsertCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertCourse() {
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
			model.dto.course cus = new model.dto.course();
			cus.setCou_name(request.getParameter("cou_name"));
			cus.setStart_date(Convertor.stringToDate(request.getParameter("start_date")));
			cus.setEnd_date(Convertor.stringToDate(request.getParameter("end_date")));
			cus.setGen_id(Integer.parseInt(request.getParameter("gen_id")));
			cus.setIs_finish(Boolean.parseBoolean(request.getParameter("is_finish")));

			if (new model.insert.insertCourse().insertCourseRecord(cus)) {
				response.getWriter().write("Success");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().write("Fail");

	}

}
