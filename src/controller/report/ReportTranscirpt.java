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
 * Servlet implementation class ReportCerificate
 */
@WebServlet("/admin/reportTranscirpt.pdf")
public class ReportTranscirpt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException | JRException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (JRException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	 private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, JRException, SQLException{
		 int id = Integer.parseInt(request.getParameter("id"));
		 int couId = Integer.parseInt(request.getParameter("cou_id"));
		 Map<String, Object>param = new HashMap<String,Object>();
		 param.put("stu_id", id);
		 
		 param.put("cou_id", couId);
		 
		 String imagePath = request.getSession().getServletContext().getRealPath("image/student");
		 param.put("imagePath", imagePath);
		 System.out.println(imagePath);
		 
		 String filePath=request.getSession().getServletContext().getRealPath("/admin/reportSSM/");
		 param.put("filePath",filePath);
		 System.out.println(filePath);
		 
		 String pathReport = request.getServletContext().getRealPath("/admin/reportSSM/transcript.jrxml");
		 System.out.println(pathReport);
		 
		 Report.Process(response, param, pathReport);
		 
	 }

}
