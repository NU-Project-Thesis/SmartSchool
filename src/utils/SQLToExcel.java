package utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/*import model.DBUltility;*/

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.naming.NamingException;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.*;
import org.apache.poi.util.IOUtils;

import connection.ConnectionDB;

import org.apache.poi.hssf.usermodel.HSSFClientAnchor;


/**
 * The purpose of this class is to generate an excel sheet based on the results from a sql query.
 */
public class SQLToExcel
{
        public SQLToExcel()
        {
        }

        public static void main(String[] args) throws ParseException, FileNotFoundException
        {
        	 InputStream my_banner_image = new FileInputStream("WebContent/logo.png");
        	 System.out.println(1);
        	/*         SQLToExcel sqlExcel = new SQLToExcel(); 
                String sqlQuery = "SELECT row_number() over() as No,last_name||' '||first_name as Name,gender as Gender,date_of_birth as DOB,email as Email,phone_number as Phone,abbreviation as School,year FROM tbl_USER u inner join (tbl_education e inner join tbl_school s on e.school_id=s.school_id) on u.user_id=e.user_id where u.user_id=38 or u.user_id=39";
                ResultSet rs = sqlExcel.getResultsetFromSql(sqlQuery);
                sqlExcel.generateExcel(sqlExcel.processResultSet(rs), "Korea Software HRD center");*/
        }

        /**
         * This method returns a database connection given the necessary parameters to create the connection.
         * @throws NamingException 
         * @throws ClassNotFoundException 
         */
        public Connection getDBConnection() throws NamingException, ClassNotFoundException
        {
                try
                {
                	Class.forName("org.postgresql.Driver");
                }
                catch (ClassNotFoundException e)
                {
                        e.printStackTrace();
                }

                Connection conn = null;
                try
                {
                	conn = ConnectionDB.getConnection();
                }
                catch (SQLException e)
                {
                        e.printStackTrace();
                }
                return conn;
        }

        /**
         * This method returns a ResultSet for the given sql query.
         * @throws NamingException 
         * @throws ClassNotFoundException 
         */
        public ResultSet getResultsetFromSql(String sql) throws NamingException, ClassNotFoundException
        {
                Connection conn = getDBConnection();
                ResultSet rs = null;
                try
                {
                        Statement stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);
                }
                catch (SQLException e)
                {
                        e.printStackTrace();
                }
                return rs;
        }
        
        public ResultSet getMonthlyResultSet(String date) throws NamingException, ClassNotFoundException
        {
                Connection conn = getDBConnection();
                ResultSet rs = null;
                try
                {
                        String sql = "SELECT rank() over ("+
                    "ORDER BY (RS.Total_score) DESC) AS rank, RS.* "+
                    "FROM ( SELECT DISTINCT concat ( to_char(tbg.start_date, 'YYYY'), '-', to_char( tbg.end_date + INTERVAL '1 year', 'YYYY' ) ) AS academic_year, "+
                    "tbg.gen_name,"+
                    "initcap(tbs.first_name||' '||tbs.last_name) AS Fullname,"+
                    "tbs.gender,"+
                    "substr(tbcla.class_name,0,4) AS class_name,"+
                    "to_char(Tweb.web, '99.99') AS Web,"+
                    "to_char(TJava.java, '99.99') AS Java,"+
                    "to_char(Tkorean.korea, '99.99') AS korea,"+
                    "TAtt.Total_att,"+
                    "to_char( ( CASE WHEN Tweb.web IS NULL THEN 0 ELSE Tweb.web END + CASE WHEN TJava.java IS NULL THEN 0 ELSE TJava.java END + CASE WHEN Tkorean.korea IS NULL THEN 0 ELSE Tkorean.korea END+ CASE WHEN TAtt.Total_att IS NULL THEN 10 ELSE TAtt.Total_att END ), '99.99' ) AS Total_score,"+
                    "to_char(now(),'dd Month YYYY')AS make_at,"+
                    "to_char(Tweb.date_sc,'Month') AS Monthly "+
                    "FROM tbstudent tbs "+
                    "INNER JOIN tbstudentenroll tbstu_en ON tbs.stu_id = tbstu_en.stu_id "+
                    "INNER JOIN tbscore tbsc ON tbs.stu_id = tbsc.stu_id "+
                    "INNER JOIN tbclass tbcla ON tbcla.class_id = tbstu_en.class_id "+
                    "INNER JOIN tbcourse tbcou ON tbcla.cou_id = tbcou.cou_id "+
                    "INNER JOIN tbgeneration tbg ON tbg.gen_id = tbcou.gen_id "+
                    "LEFT JOIN "+
                    "( SELECT tbsq.stu_id AS stu_id, "+
                    "tbsc.score_date AS date_sc,"+
                    "(tbsc.score * 0.25) AS web "+
                    "FROM tbstudent tbsq "+
                    "INNER JOIN tbscore tbsc ON tbsq.stu_id = tbsc.stu_id "+
                    "WHERE to_char(tbsc.score_date, 'YYYY-MM') = "+date+
                    " AND tbsc.sub_id = 1005 ) AS Tweb ON Tweb.stu_id = tbsc.stu_id "+
                    "LEFT JOIN"+
                    "( SELECT tbsq.stu_id AS stu_id,"+
                    "(tbsc.score * 0.35) AS java "+
                    "FROM tbstudent tbsq "+
                    "INNER JOIN tbscore tbsc ON tbsq.stu_id = tbsc.stu_id "+
                    "WHERE to_char(tbsc.score_date, 'YYYY-MM') = "+date+
                    " AND tbsc.sub_id = 1004 ) AS TJava ON TJava.stu_id = tbsc.stu_id "+
                    "LEFT JOIN"+
                    "( SELECT tbsq.stu_id AS stu_id,"+
                    "(tbsc.score * 0.30) AS korea "+
                    "FROM tbstudent tbsq "+
                    "INNER JOIN tbscore tbsc ON tbsq.stu_id = tbsc.stu_id "+
                    "WHERE to_char(tbsc.score_date, 'YYYY-MM') = "+date+
                    " AND tbsc.sub_id = 1006 ) AS Tkorean ON Tkorean.stu_id = tbsc.stu_id "+
                    "LEFT JOIN"+
                    "( SELECT S.stu_id AS stu_id,"+
                    "10 - ( CASE WHEN TA.No_Permission IS NULL THEN 0 ELSE TA.No_Permission END+ CASE WHEN TP.Permission IS NULL THEN 0 ELSE TP.Permission END+ CASE WHEN TL.Late IS NULL THEN 0 ELSE TL.Late END ) AS Total_att "+
                    "FROM "+
                    "( SELECT DISTINCT stu_id "+
                    "FROM tbattendance "+
                    "WHERE to_char(att_date, 'YYYY-MM') = "+date + ") S "+
                    "LEFT JOIN"+
                    "( SELECT stu_id,"+
                    "COUNT (stu_id) AS No_Permission "+
                    "FROM tbattendance "+
                    "WHERE description = 'No Permission' "+
                    "AND to_char(att_date, 'YYYY-MM') = "+date+
                    " GROUP BY stu_id ) AS TA ON S.stu_id = TA.stu_id "+
                    "LEFT JOIN"+
                    "( SELECT stu_id,"+
                    "COUNT (stu_id) * 0.50 AS Permission "+
                    "FROM tbattendance "+
                    "WHERE description = 'Permission' "+
                    "AND to_char(att_date, 'YYYY-MM') ="+date+
                    "GROUP BY stu_id ) AS TP ON TP.stu_id = S.stu_id "+
                    "LEFT JOIN"+
                    "( SELECT stu_id,"+
                    "COUNT (stu_id) * 0.25 AS Late "+
                    "FROM tbattendance "+
                    "WHERE description = 'Late'"+
                    " AND to_char(att_date, 'YYYY-MM') = "+date+
                    " GROUP BY stu_id ) AS TL ON TL.stu_id = S.stu_id ) AS TAtt ON TAtt.stu_id = tbsc.stu_id) AS RS ";
                        PreparedStatement ps = conn.prepareStatement(sql);
                        rs = ps.executeQuery();
                }
                catch (SQLException e)
                {
                        e.printStackTrace();
                }
                return rs;
        }

        /**
         * This method returns a Map with keys as row numbers and values as another LinkedHashMap containing key as column
         * name and value as column value , present in the ResulSet. We have used LinkedHashMap because it maintains the
         * order in which the values are put in the Map.
         */
        public Map<String, LinkedHashMap<String, String>> processResultSet(ResultSet rs)
        {
                ArrayList<String> columnNames = new ArrayList<String>();
                LinkedHashMap<String, String> rowDetails = new LinkedHashMap<String, String>();
                Map<String, LinkedHashMap<String, String>> resultMap = new LinkedHashMap<String, LinkedHashMap<String, String>>();
                ResultSetMetaData rsm = null;

                if (rs != null)
                {
                        try
                        {
                                rsm = (ResultSetMetaData) rs.getMetaData();
                                for (int i = 1; i <= rsm.getColumnCount(); i++)
                                {
                                        System.out.println(i + " -> " + rsm.getColumnName(i));
                                        columnNames.add(rsm.getColumnName(i));
                                }
                        }
                        catch (SQLException e)
                        {
                                e.printStackTrace();
                        }
                }

                try
                {
                        int rowCount = 1;
                        while (rs.next())
                        {
                                for (int i = 1; i <= rsm.getColumnCount(); i++)
                                {
                                        rowDetails.put(rsm.getColumnName(i), rs.getString(i));
                                }
                                resultMap.put(new Integer(rowCount).toString(), rowDetails);
                                rowCount++;
                                rowDetails = new LinkedHashMap<String, String>();
                        }
                }
                catch (SQLException e)
                {
                        e.printStackTrace();
                }
                return resultMap;
        }

        /**
         * This method generates an excel sheet containing data from the given Map. The name of the excel sheet will be the
         * String passed as a parameter.
         * @throws ParseException 
         * @throws IOException 
         */
        public void generateExcel(Map<String, LinkedHashMap<String, String>> resultMap, String name,String logo, String sheetName, boolean landscapse) throws ParseException, IOException
        {
                FileOutputStream fileOut = null;
           
                try
                {
                        HSSFWorkbook wb = new HSSFWorkbook();
                        
                        HSSFCellStyle headerStyle = wb.createCellStyle();
                        HSSFSheet sheet3 = wb.createSheet(sheetName);
                        sheet3.getPrintSetup().setLandscape(landscapse);
                        sheet3.getPrintSetup().setPaperSize(PrintSetup.A4_PAPERSIZE);
                        sheet3.setMargin(Sheet.RightMargin, 0.59  /*inches*/  );
                        sheet3.setMargin(Sheet.LeftMargin, 0.59 /* inches*/  );
                        sheet3.setMargin(Sheet.TopMargin, 0.46 /* inches */ );
                        sheet3.setMargin(Sheet.BottomMargin, 0.46 /* inches*/  );
                        
                        /* Read the input image into InputStream */
                        InputStream my_banner_image = new FileInputStream(logo);
                        /* Convert Image to byte array */
                        byte[] bytes = IOUtils.toByteArray(my_banner_image);
                        /* Add Picture to workbook and get a index for the picture */
                        int my_picture_id = wb.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
                        /* Close Input Stream */
                        my_banner_image.close();                
                        /* Create the drawing container */
                        HSSFPatriarch drawing = sheet3.createDrawingPatriarch();
                        /* Create an anchor point */
                        ClientAnchor my_anchor = new HSSFClientAnchor();
                        /* Define top left corner, and we can resize picture suitable from there */
                        my_anchor.setCol1(0);
                        my_anchor.setRow1(1);
                        
                        
                        /* Invoke createPicture and pass the anchor point and ID */
                        HSSFPicture  my_picture = drawing.createPicture(my_anchor, my_picture_id);
                      /*double scale = 0.73;*/
                      double scale = 0.50;
                        /* Call resize method, which resizes the image */
                        
                        my_picture.resize(scale);          
                        
             /*           //Returns an object that handles instantiating concrete classes
                        CreationHelper helper = wb.getCreationHelper();
                      
                        //Creates the top-level drawing patriarch.
                        Drawing drawing = sheet3.createDrawingPatriarch();
                      
                        //Create an anchor that is attached to the worksheet
                        ClientAnchor anchor = helper.createClientAnchor();
                        //set top-left corner for the image
                        anchor.setCol1(100);
                        anchor.setRow1(200);
                      
                        //Creates a picture
                        Picture pict = drawing.createPicture(anchor, pictureIdx);
                        //Reset the image to the original size
                        pict.resize();
                        */
                        
                     
                        
                        
                        HSSFFont headerFont = wb.createFont();
                        //headerFont.setBoldweight(Font.BOLD);
                        HSSFFont my_font=wb.createFont();
                        /* set the weight of the font */
                        my_font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                        my_font.setFontName("Calibri");
                        my_font.setFontHeightInPoints((short) 11.5);
                        headerStyle.setFillForegroundColor(HSSFColor.GREY_50_PERCENT.index);
                        headerStyle.setFillBackgroundColor(HSSFColor.GREY_50_PERCENT.index);
                        headerStyle.setAlignment(CellStyle.VERTICAL_TOP);
                        headerStyle.setAlignment(CellStyle.ALIGN_CENTER);
                        headerStyle.setWrapText(true);
                        headerStyle.setFont(my_font);
                     //   headerStyle.setFillForegroundColor(HSSFColor.WHITE.index);
                      //  headerStyle.setFillBackgroundColor(HSSFColor.WHITE.index);
                      //  headerStyle.setFont(headerFont);

                        try
                        {
                                fileOut = new FileOutputStream( name + ".xls");
                        }
                        catch (FileNotFoundException e)
                        {
                                e.printStackTrace();
                        }
                      
                      
                        //cell.setCellStyle(style);
                        
                        HSSFRow sessionname = sheet3.createRow(0);
                        HSSFCell title = sessionname.createCell(1);
                        String crLf = Character.toString((char)13) + Character.toString((char)10);
                        title.setCellStyle(headerStyle);
                        
                        title.setCellValue("Korea Software HRD Center"+crLf+
"#12, St 323, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh"+crLf+
"Tel: (855) 23 99 13 14, Fax (855) 23 99 14 15"+crLf+
"Email: info.kshrd@gmail.com, phirum.gm@gmail.com"+crLf+
"Website: www.kshrd.com.kh, Facebook:facebook.com/ksignhrd");
                      //  sheet3.addMergedRegion(CellRangeAddress.valueOf("D1:H1"));
                        sheet3.addMergedRegion(CellRangeAddress.valueOf("B1:G7"));
                        /*sheet3.addMergedRegion(CellRangeAddress.valueOf("C1:F7"));*/
                        
                        HSSFCellStyle style=wb.createCellStyle();
                        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
                        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
                        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
                        style.setAlignment(CellStyle.ALIGN_CENTER);
                        style.setFont(my_font);
                        HSSFRow row = sheet3.createRow(8);

                        Map<String, LinkedHashMap<String, String>> rMap = resultMap;
                        Map<String, String> columnDetails = rMap.get("1");

                        Set<String> s = columnDetails.keySet();
                        int cellNo = 0;
                        for (String s1 : s)
                        {
                                HSSFCell cell0 = row.createCell(cellNo);
                                cell0.setCellStyle(style);
                                cell0.setCellValue((s1).toUpperCase());
                                cellNo++;
                        }
                     
                        HSSFFont datafont=wb.createFont();
                        /* set the weight of the font */
                         datafont.setFontName("SansSerif");
                        datafont.setFontHeightInPoints((short) 10);
                        
                        HSSFCellStyle datastyle=wb.createCellStyle();
                        datastyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                        datastyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
                        datastyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
                        datastyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
                        datastyle.setFont(datafont);
                        
                        HSSFCellStyle datastylecenter=wb.createCellStyle();
                        datastylecenter.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                        datastylecenter.setBorderTop(HSSFCellStyle.BORDER_THIN);
                        datastylecenter.setBorderRight(HSSFCellStyle.BORDER_THIN);
                        datastylecenter.setBorderLeft(HSSFCellStyle.BORDER_THIN);
                        datastylecenter.setFont(datafont);
                        datastylecenter.setAlignment(CellStyle.ALIGN_CENTER);
                        
                        int i;
                        for (i = 1; i <= rMap.size(); i++)
                        {
                                columnDetails = rMap.get(new Integer(i).toString());
                                System.out.println(i);
                                HSSFRow nextrow = sheet3.createRow(8 + i);
                                Set<String> set = columnDetails.keySet();
                                int cellNum = 0;
                                for (String s2 : set)
                                {	
                                	
                                        HSSFCell a=nextrow.createCell(cellNum);
                                        if(cellNum==3){
                                        a.setCellValue(columnDetails.get(s2).replace("-","").replaceFirst("(\\d{4})(\\d{2})(\\d{2})", "$3-$2-$1"));
                                        a.setCellStyle(datastyle);
                                        }
                                       // System.out.println(cellNum+"   "+columnDetails.get(s2));
                                        else if(cellNum==2|cellNum==6|cellNum==7)
                                        	{a.setCellValue(columnDetails.get(s2).toUpperCase());
                                        	a.setCellStyle(datastylecenter);
                                        	}
                                        else
                                        {a.setCellStyle(datastyle);
                                        	a.setCellValue(columnDetails.get(s2));
                                        }
                                        cellNum++;
                                }
                        }
                      
                    	

                     
                        sheet3.autoSizeColumn(0);
                        sheet3.autoSizeColumn(1);
                        sheet3.autoSizeColumn(2);
                        sheet3.autoSizeColumn(3);
                        sheet3.autoSizeColumn(4);
                        sheet3.autoSizeColumn(5);
                        sheet3.autoSizeColumn(6);
                        
                        HSSFRow nextrow = sheet3.createRow(8 + i+3);
                        HSSFCell a1=nextrow.createCell(1);
                        a1.setCellValue("Total : ");
                        a1.setCellStyle(headerStyle);
                        HSSFCell a=nextrow.createCell(2);
                        a.setCellType(HSSFCell.CELL_TYPE_FORMULA);
                        a.setCellFormula("rows(A10:A"+(8+i)+")");
                        a.setCellStyle(datastyle);
                        
                        nextrow = sheet3.createRow(8 +i+4);
                        a1=nextrow.createCell(1);
                        a1.setCellValue("Men : ");
                        a1.setCellStyle(headerStyle);
                        a=nextrow.createCell(2);
                        a.setCellStyle(datastyle);
                        a.setCellType(HSSFCell.CELL_TYPE_FORMULA);
                  //      System.out.println("COUNTIF(C11:C"+(9+i)+","\"M\")");
                       a.setCellFormula("COUNTIF(C10:C"+(8+i)+",\"M\")");
                       
                       nextrow = sheet3.createRow(8 +i+5);
                       a1=nextrow.createCell(1);
                       a1.setCellValue("Women : ");
                       a1.setCellStyle(headerStyle);
                       a=nextrow.createCell(2);
                       a.setCellType(HSSFCell.CELL_TYPE_FORMULA);
                 //      System.out.println("COUNTIF(C11:C"+(9+i)+","\"M\")");
                      a.setCellFormula("COUNTIF(C10:C"+(8+i)+",\"F\")");
                      HSSFCellStyle datestyle=wb.createCellStyle();
                      datestyle.setAlignment(CellStyle.VERTICAL_TOP);
                      datestyle.setAlignment(CellStyle.ALIGN_CENTER);
                      datestyle.setWrapText(true);
                      datestyle.setFont(my_font);
                      datestyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                      datestyle.setAlignment(CellStyle.ALIGN_CENTER);
                      sheet3.addMergedRegion(CellRangeAddress.valueOf("F"+(8+i+7) +":G"+(8+i+7)));
                      sheet3.addMergedRegion(CellRangeAddress.valueOf("F"+(8+i+8) +":G"+(8+i+8)));
                      sheet3.addMergedRegion(CellRangeAddress.valueOf("F"+(8+i+9) +":G"+(8+i+9)));
                      System.out.println("F"+(9+i+6) +":G"+(9+i+6));
                      nextrow = sheet3.createRow(8 +i+6);
                      a1=nextrow.createCell(5);
                      a1.setCellValue("Date: "+new SimpleDateFormat("dd-MMM-YYYY").format(new Date()));
                      a1.setCellStyle(datestyle);
                   
                      datestyle.setBorderBottom(HSSFCellStyle.BORDER_NONE);
                      nextrow = sheet3.createRow(8 +i+7);
                      a1=nextrow.createCell(5);
                      a1.setCellValue("Admin and HR Manager");
                      a1.setCellStyle(datestyle);
                      nextrow = sheet3.createRow(8 +i+8);
                      a1=nextrow.createCell(5);
                      a1.setCellValue("Dr. Kim Taekyung");
                      a1.setCellStyle(datestyle);
                      
                      
                 //     a1.setCellValue("Chen Phirum");
                      
                       		
                        
                        a.setCellStyle(datastyle);
                        
                        
                        wb.write(fileOut);
                        fileOut.flush();
                        fileOut.close();
                }
                catch (FileNotFoundException fe)
                {
                        fe.printStackTrace();
                }
                catch (IOException e)
                {
                        e.printStackTrace();
                }
               
        }
}