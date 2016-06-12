package controller.report;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
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
 * Servlet implementation class ReportAttendance
 */
@WebServlet("/admin/ReportAttendance.pdf")
public class ReportAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Date fromDate = null;
		Date toDate = null;
		try {
			fromDate = utils.Convertor.stringToDate(request.getParameter("fromDate"));
			toDate = utils.Convertor.stringToDate(request.getParameter("toDate"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String createBy = request.getParameter("createBy");
		
		 String path =request.getServletContext().getRealPath("/admin/reportSSM/Atttendance.jrxml");
		 String filePath=request.getSession().getServletContext().getRealPath("/admin/reportSSM");
		
		 Map<String, Object> param = new HashMap<String,Object>();
		 param.put("fromDate", fromDate);
		 param.put("toDate", toDate);
		 param.put("CreateBy",createBy);
		 param.put("FilePath",filePath);
		 
		 try {
			Report.Process(response, param,path);
		} catch (ClassNotFoundException | JRException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
