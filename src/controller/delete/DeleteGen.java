package controller.delete;


import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteGen
 */
@WebServlet("/admin/deleteGen.hrd")
public class DeleteGen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteGen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (Exception e) {
				e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	 /**
	   * Create method doProcess type boolean for delete record generation.
	   * Create variable id type of Integer throw into ModelDelete _
	   * for excuteQuery Delete Record generation from db.  
	   * @return  "true" if delete successful, else  return "false" unsuccessful.
	 * @throws IOException 
	   */
     public void doProcess (HttpServletRequest request, HttpServletResponse response) throws IOException{
    try{
	     int id=Integer.parseInt(request.getParameter("gen_id"));
	    if(new model.delete.deleteGeneration().deleteGenerationRecord(id)){
	    	response.getWriter().write("Success");
	    	return;
	    	
	    }
    	 }catch(Exception e){e.printStackTrace();}
    response.getWriter().write("Fail");
	    }
}
