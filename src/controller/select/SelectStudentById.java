package controller.select;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Student;
import utils.Convertor;

/**
 * Servlet implementation class SelectStudentById
 */
@WebServlet("/SelectStudentById.hrd")
public class SelectStudentById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStudentById() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = ((Student)request.getSession().getAttribute("stu")).getStu_id();
		String gen;
		try {
			model.select.selectStudent lst = new model.select.selectStudent();
			gen = Convertor.convertResultSetIntoJSON(lst.SelectStudentById(id)).toString();
			lst.close();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(gen);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
