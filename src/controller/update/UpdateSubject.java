package controller.update;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateSubject
 */
@WebServlet("/admin/updateSubject.hrd")
public class UpdateSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSubject() {
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
		} catch (ClassNotFoundException | SQLException | IOException e) {
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
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * Create method doProcess type of boolean
	 * 
	 * @param getparamater
	 *            from view such as sub_id,sun_name,sub_descript _ then throw
	 *            parameter into ModelUpdate and call method updateSubjectRecord
	 *            for excuteQuery Update Record in DB.
	 * @param request
	 * @param respons
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ParseException
	 * @return "true" if Update successful, else return "false" unsuccessful.
	 * @throws IOException 
	 */
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		model.dto.subject sub = new model.dto.subject();
		sub.setSub_id(Integer.parseInt(request.getParameter("sub_id")));
		sub.setSub_name(request.getParameter("sub_name"));
		sub.setDescription(request.getParameter("description"));
		if (new model.update.updateSubject().updateSubjectRecord(sub)) {
			response.getWriter().write("Success");
			return;
		}
		response.getWriter().write("Fail");
	}
}
