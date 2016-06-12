package controller.update;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateRoom
 */
@WebServlet("/admin/updateRoomState.hrd")
public class UpdateRoomState extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateRoomState() {
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
	 * 
	 * @param getparamater
	 *            from view such as room_id,room_name,cous_id id is auto number
	 *            then throw parameter into ModelUpdate and call method
	 *            updateClassRecord for excuteQuery Update Record in DB.
	 * @param request
	 * @param respons
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ParseException
	 * @return "true" if Update successful, else return "false" unsuccessful.
	 * @throws IOException
	 */
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int class_id = Integer.parseInt(request.getParameter("class_id"));
		if (new model.update.updateClass().updateClassState(class_id)) {
			response.getWriter().write("Success");
			return;
		}
		response.getWriter().write("Fail");

	}

}
