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
 * Servlet implementation class DeleteCourse
 */
@WebServlet("/admin/deleteCourse.hrd")
public class DeleteCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCourse() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		try{
			doProcess(request, response);
		}catch(Exception e){e.printStackTrace();}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		try{
			doProcess(request, response);
		}catch(Exception e){e.printStackTrace();}

	}
	 /**
	   * Create method doProcess type of boolean for delete record Course.
	   * Create variable id type of Integer throw into ModelDelete _
	   * for excuteQuery Delete Record Course from db.  
	   * @return  "true" if delete successful, else  return "false" unsuccessful.
	 * @throws IOException 
	   */
	public void doProcess (HttpServletRequest request, HttpServletResponse response) throws IOException {
		try{
	    int id=Integer.parseInt(request.getParameter("cou_id"));
	    if(new model.delete.deleteCourse().deleteCourseRecord(id)){
	    	response.getWriter().write("Success");
	    	return;
	    }
		}catch(Exception e){e.printStackTrace();}
		response.getWriter().write("Fail");
	    
	    
	  }

}
