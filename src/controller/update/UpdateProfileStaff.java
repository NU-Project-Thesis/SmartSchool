package controller.update;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.update.UpdateStaff;

/**
 * Servlet implementation class UpdateSubject
 */
@WebServlet("/admin/updateProfileStaff.hrd")
public class UpdateProfileStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProfileStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		model.dto.StaffDTO staff = new model.dto.StaffDTO();
		int staff_id = ((model.dto.StaffDTO) request.getSession().getAttribute("user")).getId();
		staff.setId(staff_id);
		staff.setFirstName(request.getParameter("first_name"));
		staff.setLastName(request.getParameter("last_name"));
		staff.setGender(request.getParameter("gender").charAt(0));
		staff.setPhone(request.getParameter("phone"));

		try {
			new model.update.UpdateStaff();
			if (UpdateStaff.updateProfile(staff)) {
				response.getWriter().write("Success");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		try {
			response.getWriter().write("Fail");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
