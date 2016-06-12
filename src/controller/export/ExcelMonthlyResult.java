package controller.export;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.SQLToExcel;

/**
 * Servlet implementation class ExcelMonthlyResult
 */
@WebServlet("/admin/excelMonthlyResult.hrd")
public class ExcelMonthlyResult extends HttpServlet {
	private String filePath;
	private static final int BUFSIZE = 4096;
	private static final long serialVersionUID = 1L;

	public ExcelMonthlyResult() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String a = request.getServletContext().getRealPath("") + File.separator + "Monthly Result";
		SQLToExcel sqlExcel = new SQLToExcel();
		//String sqlQuery = "select stu_id as ID,concat(first_name,' ',last_name) as Name,gender,dob,email,phone from tbstudent";

		ResultSet rs = null;
		Date fullDate=null;
		try {
			fullDate = utils.Convertor.stringToDate(request.getParameter("score_date"));
			
			
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String yearMonth = new SimpleDateFormat("yyyy-MM").format(fullDate);
		try {
			rs = sqlExcel.getMonthlyResultSet("'"+ yearMonth+ "'");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			sqlExcel.generateExcel(sqlExcel.processResultSet(rs), a,
					request.getSession().getServletContext().getRealPath("admin/image/logohrd.png"), "Monthly Result", true);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		File file = new File(a + ".xls");
		int length = 0;
		ServletOutputStream outStream = response.getOutputStream();
		ServletContext context = request.getServletContext();
		String mimetype = context.getMimeType(a);

		// sets response content type
		if (mimetype == null) {
			mimetype = "application/octet-stream";
		}
		response.setContentType(mimetype);
		response.setContentLength((int) file.length());
		String fileName = (new File(a + ".xls")).getName();

		// sets HTTP header
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		byte[] byteBuffer = new byte[BUFSIZE];
		DataInputStream in = new DataInputStream(new FileInputStream(file));

		// reads the file's bytes and writes them to the response stream
		while ((in != null) && ((length = in.read(byteBuffer)) != -1)) {
			outStream.write(byteBuffer, 0, length);
		}

		in.close();
		outStream.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
