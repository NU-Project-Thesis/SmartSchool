package controller.insert;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.insert.InsertAtt;
import utils.Convertor;

/**
 * Servlet implementation class InsertAtten
 */
@WebServlet("/admin/insertAtten.hrd")
public class InsertAtten extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertAtten() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			model.dto.AttendanceDTO atten = new model.dto.AttendanceDTO();
			atten.setAttDate(Convertor.stringToDate(request.getParameter("att_date")));
			atten.setDescription(request.getParameter("description"));
			atten.setShift(request.getParameter("shift"));
			String[] stu_id = request.getParameter("stu_id").split(",");
			new model.insert.InsertAtt();
			if (InsertAtt.process(stu_id, atten)) {
				System.out.println("Success");
				response.getWriter().write("Success");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("Fail");
		response.getWriter().write("Fail");

	}

}
