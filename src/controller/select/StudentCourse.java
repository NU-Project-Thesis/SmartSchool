package controller.select;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Student;
import utils.Convertor;
import model.select.selectStudent;

/**
 * Servlet implementation class StudentCourse
 */
@WebServlet("/studentCourse.hrd")
public class StudentCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentCourse() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id = ((Student)request.getSession().getAttribute("stu")).getStu_id();
    	try {
    		selectStudent dao = new selectStudent();
			String s = Convertor.convertResultSetIntoJSON(dao.SelectStudentCourse(id)).toString();
			dao.close();
			response.getWriter().write(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
