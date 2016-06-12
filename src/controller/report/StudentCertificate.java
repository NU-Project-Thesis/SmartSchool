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
 * Servlet implementation class StudentCertificate
 */
@WebServlet("/StudentCertificate.pdf")
public class StudentCertificate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentCertificate() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*int id = Integer.parseInt(request.getParameter("id"));
		 Map<String, Object>param = new HashMap<String,Object>();
		 param.put("stuId", id);
		 
		 String filePath=request.getSession().getServletContext().getRealPath("/reportSSM");
		 param.put("filePath",filePath);
		 
		 String path =request.getServletContext().getRealPath("/reportSSM/certificate.jrxml");
		 try {
			Report.Process(response, param,path);
		} catch (ClassNotFoundException | JRException | SQLException e) {
			e.printStackTrace();
		}*/
		int couId = Integer.parseInt(request.getParameter("cou_id"));
		int id = Integer.parseInt(request.getParameter("id"));

		 Map<String, Object>param = new HashMap<String,Object>();
		 param.put("stuId",id);
		 param.put("cou_id", couId);
		 
		 
		 String filePath=request.getSession().getServletContext().getRealPath("/reportSSM");
		 param.put("filePath",filePath);
		 
		 /*System.out.println(path);*/
		 String path =request.getServletContext().getRealPath("/reportSSM/certificate.jrxml");
		 try {
			Report.Process(response, param,path);
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
