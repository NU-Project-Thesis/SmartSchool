package controller.insert;

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
 * Servlet implementation class InsertClass
 */
@WebServlet("/admin/insertRoom.hrd")
public class InsertRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try{
		doProcess(request, response);
		
		}catch(Exception e){e.printStackTrace();}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		try{
			doProcess(request, response);
		}catch(Exception e){e.printStackTrace();}
	}
	/**
	   * Create method doProcess type of boolean  
	   * @param getparamater from view such as room_name, cous_id, id is auto number _
	     then throw parameter into ModelInsert and call method  insertClassRecord for excuteQuery insert into DataBase. 
       * @return  "true" if insert successful, else  return "false" unsuccessful.
	 * @throws IOException 
	 */
	public void  doProcess (HttpServletRequest request, HttpServletResponse response) throws IOException{
	  try{
		model.dto.room room=new model.dto.room();
	    room.setClass_name(request.getParameter("class_name"));
	    room.setCou_id(Integer.parseInt(request.getParameter("cou_id")));
		if(new model.insert.insertClass().insertClassRecord(room)){
			response.getWriter().write("Success");
	    	return;
	   
	    }
	  }catch(Exception e){e.printStackTrace();}
	  response.getWriter().write("Fail");
	   
	}

}
