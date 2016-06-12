package controller.update;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Convertor;

/**
 * Servlet implementation class UpdateCourse
 */
@WebServlet("/admin/updateCourse.hrd")
public class UpdateCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateCourse() {
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

		model.dto.course cus=new model.dto.course();
	    cus.setCou_id(Integer.parseInt(request.getParameter("cou_id")));
	    cus.setCou_name(request.getParameter("cou_name"));
	    SimpleDateFormat dt= new SimpleDateFormat();   
	    cus.setStart_date(Convertor.stringToDate(request.getParameter("start_date")));
		cus.setEnd_date(Convertor.stringToDate(request.getParameter("end_date")));
	    cus.setGen_id(Integer.parseInt(request.getParameter("gen_id")));
	    
	    if(new model.update.updateCourse().updateCourseRecord(cus)){
			response.getWriter().write("Success");
			return;
	    }
		response.getWriter().write("Fail");
	}

}
