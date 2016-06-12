package controller.update;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.ClassEnroll;

/**
 * Servlet implementation class InsertSubject
 */
@WebServlet("/admin/updateStaffEnroll.hrd")
public class UpdateStaffEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStaffEnroll() {
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
		} catch (IOException | ClassNotFoundException | SQLException e) {
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
		} catch (IOException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException, SQLException {

		// create dto
		model.dto.ClassEnroll dto = new model.dto.ClassEnroll();
		dto.setClass_id(Integer.parseInt(request.getParameter("class_id")));
		dto.setSub_id(Integer.parseInt(request.getParameter("sub_id")));
		dto.setClass_enroll(Integer.parseInt(request.getParameter("class_enroll")));
		if (new model.update.UpdateEnroll().updateStaffEnroll(dto)) {
			response.getWriter().write("Success");
			return;
		}

		response.getWriter().write("Fail");
	}

}
