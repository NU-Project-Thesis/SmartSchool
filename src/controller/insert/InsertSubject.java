package controller.insert;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertSubject
 */
@WebServlet("/admin/insertSubject.hrd")
public class InsertSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSubject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  {
		// TODO Auto-generated method stub
	
			try {
				doProcess(request, response);
			} catch (IOException e) {
				e.printStackTrace();
			}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
			try {
				doProcess(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	/**
	   * Create method doProcess type of boolean  
	   * @param getparamater from view such as sub_name, sub_descript, id is auto number _
	     then throw parameter into ModelInsert and call method  insertSubjectRecord for excuteQuery insert into DB. 
       * @return  "true" if insert successful, else  return "false" unsuccessful.
	 * @throws IOException 
	 */
	public  void doProcess (HttpServletRequest request, HttpServletResponse response) throws IOException{
	   try{
		model.dto.subject sub=new model.dto.subject();
	    sub.setSub_name(request.getParameter("sub_name"));
	    sub.setDescription(request.getParameter("description"));
	   if(new model.insert.insertSubject().insertSubjectRecord(sub)){
			response.getWriter().write("Success");
	    	return;
	 
	    }
	   }catch(Exception e){e.printStackTrace();}
		response.getWriter().write("Fial");
    	
 
	}

}

