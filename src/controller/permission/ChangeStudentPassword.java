package controller.permission;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Student;
import model.update.updateStudent;;

/**
 * Servlet implementation class ChangeStudentPassword
 */
@WebServlet("/changeStudentPassword.hrd")
public class ChangeStudentPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStudentPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = ((Student)request.getSession().getAttribute("stu")).getStu_id();
		String old_pass = request.getParameter("old_password");
		String new_pass = request.getParameter("new_password");
		try {
			if(updateStudent.changePassword(id, old_pass, new_pass)){
				System.out.println("Success");
				response.getWriter().write("Success");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Fail");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
