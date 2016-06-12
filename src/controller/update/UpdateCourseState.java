package controller.update;

import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class UpdateCourse
 */
@WebServlet("/admin/updateCouseState.hrd")
public class UpdateCourseState extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateCourseState() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * Create method doProcess type of boolean  
	 * @param getParamater from view_course such as cus_name, cus_startdate , cus_enddate , cus_id,cus_finish   id is auto number _
	   then throw parameter into ModelUpdate and call method updateCourseRecord for excuteQuery Update Record in DB. 
     * @param request
	 * @param respons 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ParseException
	 * @return  "true" if Update successful, else  return "false" unsuccessful.
	 */
	public  void doProcess (HttpServletRequest request, HttpServletResponse response) throws Exception{

	    if(new model.update.updateCourse().updateCourseState(Integer.parseInt(request.getParameter("cou_id")))){
			response.getWriter().write("Success");
			return;
	    }
		response.getWriter().write("Fail");
	}

}
