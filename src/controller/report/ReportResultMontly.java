package controller.report;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
 * Servlet implementation class ReportResultMontly
 */
@WebServlet("/ReportResultMontly.pdf")
public class ReportResultMontly extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportResultMontly() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("score_date"));
		Date fullDate=null;
		try {
			fullDate = utils.Convertor.stringToDate(request.getParameter("score_date"));
			
			
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String yearMonth = new SimpleDateFormat("yyy-MM").format(fullDate);
		System.out.println(yearMonth);
		String filePath=request.getSession().getServletContext().getRealPath("/admin/reportSSM");
		Map<String, Object>param = new HashMap<String,Object>();
		
		param.put("date_score", yearMonth);
		param.put("FilePath",filePath);
		
		String path =request.getServletContext().getRealPath("/admin/reportSSM/Result_Monthly.jrxml");
		try {
			Report.Process(response, param,path);
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
