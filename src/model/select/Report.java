package model.select;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import connection.ConnectionDB;
import jdk.internal.org.xml.sax.InputSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

public class Report{
	
	public static void Process(HttpServletResponse response, Map<String,Object>param, String path) throws JRException, ClassNotFoundException, SQLException, IOException{
		java.sql.Connection con = ConnectionDB.getConnection();
		InputStream input=new FileInputStream(new File(path));
		System.out.println(input+"1");
		JasperReport jasper = JasperCompileManager.compileReport(input);
		System.out.println(jasper+"2");
		JasperPrint print= JasperFillManager.fillReport(jasper, param,con);
		System.out.println(print+"3");
		JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
		con.close();				
	}
	
	public static void main(String[] args) throws ClassNotFoundException, JRException, SQLException, IOException {
		Report.Process(null, null, "");
	}

}
