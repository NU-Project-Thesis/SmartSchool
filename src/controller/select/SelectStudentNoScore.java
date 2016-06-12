package controller.select;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Convertor;

/**
 * Servlet implementation class SelectStudentNoScore
 */
@WebServlet("/admin/selectStudentNoScore.hrd")
public class SelectStudentNoScore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectStudentNoScore() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int staff_id = ((model.dto.StaffDTO)request.getSession().getAttribute("user")).getId();
			/*int class_id = Integer.parseInt(request.getParameter("class_id"));*/
			int class_id = 0;
			response.setContentType("application/json");
			String students = Convertor
					.convertResultSetIntoJSON(new model.select.SelectScore().studentNoScore(staff_id, class_id))
					.toString();
			System.out.println(students);
			new model.select.SelectScore().close();
			response.getWriter().write(students);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
