package controller.report;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.select.Report;
import net.sf.jasperreports.engine.JRException;

/**
 * Servlet implementation class StudentTranscript
 */
@WebServlet("/StudentTranscript.pdf")
public class StudentTranscript extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentTranscript() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*int id = Integer.parseInt(request.getParameter("id"));
		 Map<String, Object>param = new HashMap<String,Object>();
		 param.put("stu_id", id);
		 
		 String imagePath = request.getSession().getServletContext().getRealPath("image/student");
		 param.put("imagePath", imagePath);
		 System.out.println(imagePath);
		 
		 String filePath=request.getSession().getServletContext().getRealPath("/reportSSM/");
		 param.put("filePath",filePath);
		 System.out.println(filePath);
		 
		 String pathReport = request.getServletContext().getRealPath("/reportSSM/transcript.jrxml");
		 System.out.println(pathReport);
		 
		 try {
			Report.Process(response, param, pathReport);
		} catch (ClassNotFoundException | JRException | SQLException e) {
			e.printStackTrace();
		}*/
		
		int id = Integer.parseInt(request.getParameter("id"));
		 int couId = Integer.parseInt(request.getParameter("cou_id"));
		 Map<String, Object>param = new HashMap<String,Object>();
		 param.put("stu_id", id);
		 
		 param.put("cou_id", couId);
		 
		 String imagePath = request.getSession().getServletContext().getRealPath("image/student");
		 param.put("imagePath", imagePath);
		 System.out.println("1KP " + imagePath + request.getSession().getServletContext().getRealPath("image/student"));
		 
		 String filePath=request.getSession().getServletContext().getRealPath("/reportSSM/");
		 param.put("filePath",filePath);
		 System.out.println("2KP " + filePath);
		 
		 String pathReport = request.getServletContext().getRealPath("/reportSSM/transcript.jrxml");
		 System.out.println("3KP " + pathReport);
		 
		 try {
			Report.Process(response, param, pathReport);
		} catch (ClassNotFoundException | JRException | SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
