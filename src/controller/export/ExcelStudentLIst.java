package controller.export;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.ParseException;

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
 * Servlet implementation class Excel
 */
@WebServlet("/admin/export-student.hrd")
public class ExcelStudentLIst extends HttpServlet {
	private String filePath;
	private static final int BUFSIZE = 4096;
	private static final long serialVersionUID = 1L;

	public ExcelStudentLIst() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String a = request.getServletContext().getRealPath("") + File.separator + "Student List";
		SQLToExcel sqlExcel = new SQLToExcel();
		String sqlQuery = "select stu_id as ID,concat(first_name,' ',last_name) as Name,gender,dob,email,phone from tbstudent";

		ResultSet rs = null;
		try {
			rs = sqlExcel.getResultsetFromSql(sqlQuery);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		try {
			sqlExcel.generateExcel(sqlExcel.processResultSet(rs), a,
					request.getSession().getServletContext().getRealPath("admin/image/logohrd.png"), "Student List", false);
		} catch (ParseException e) {
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
