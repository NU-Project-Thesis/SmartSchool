package controller.delete;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteRoom
 */
@WebServlet("/admin/deleteRoom.hrd")
public class DeleteRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRoom() {
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
		} catch(Exception e) {
		
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	 /**
	   * Create method doProcess type of boolean for delete record Room.
	   * Create variable id type of Integer throw into ModelDelete _
	   * for excuteQuery Delete Record Room from db.  
	   * @return  "true" if delete successful, else  return "false" unsuccessful.
	 * @throws IOException 
	   */
	public void  doProcess (HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ParseException, IOException{
	   try{  int id=Integer.parseInt(request.getParameter("gen_id"));
	    if(new model.delete.deleteClass().deleteClassRecord(id)){
	    	response.getWriter().write("Success");
			return;

	    }
	   }catch(Exception e){e.printStackTrace();}
		response.getWriter().write("Fail");
	    
	  }

}
