
package controller.select;

import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Convertor;

/**
 * Servlet implementation class ListRoom
 */
@WebServlet("/admin/listClass.hrd")
public class ListRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListRoom() {
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
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * Create method doProcess Select database and convert JSON.
	 * 
	 * @param response
	 * @throws Exception
	 * @try catch Exception
	 */
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			model.select.selectClass lst = new model.select.selectClass();
			String room = Convertor.convertResultSetIntoJSON(lst.SelectClassRecord()).toString();
			lst.close();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(room);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
