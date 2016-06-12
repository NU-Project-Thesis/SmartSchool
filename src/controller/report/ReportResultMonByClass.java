package controller.report;

import java.io.IOException;
import java.io.PushbackReader;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.layout.CenterLayout;

import com.itextpdf.text.Paragraph;

import model.select.Report;
import net.sf.jasperreports.engine.JRException;
import sun.rmi.server.UnicastRef;

/**
 * Servlet implementation class ReportResultMonByClass
 */
@WebServlet("/admin/ReportResultMonByClass.pdf")
public class ReportResultMonByClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportResultMonByClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int _class = Integer.parseInt(request.getParameter("class_id"));
		System.out.println(_class);

			Date fullDate=null;
			try {
				fullDate = utils.Convertor.stringToDate(request.getParameter("score_date"));
				
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String yearMonth = new SimpleDateFormat("yyy-MM").format(fullDate);
			
			
		Map<String, Object>param = new HashMap<String,Object>();
		
		String filePath=request.getSession().getServletContext().getRealPath("/admin/reportSSM");
		
		param.put("_classId", _class);
		param.put("DateOfResult", yearMonth);
		param.put("FilePath",filePath);
		
		String path = request.getSession().getServletContext().getRealPath("/admin/reportSSM/Result_Monthly_By_Class.jrxml");
		
		try {
			Report.Process(response, param, path);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
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
