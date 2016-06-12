package controller.delete;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteStudent
 */
@WebServlet("/admin/deleteStudent.hrd")
public class DeleteStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	    int id=Integer.parseInt(request.getParameter("stu_id"));
	    if(new  model.delete.deleteStudent().deleteStudentRecord(id)){
	    	response.getWriter().write("Success");
	    	return;
	 
	    }
  	 }catch(Exception e){e.printStackTrace();}
  response.getWriter().write("Fail");
  
	    }

}
