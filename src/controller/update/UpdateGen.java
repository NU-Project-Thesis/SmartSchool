package controller.update;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Convertor;

/**
 * Servlet implementation class UpdateGen
 */
@WebServlet("/admin/updateGen.hrd")
public class UpdateGen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
   
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
	}
	/**
	 * Create method doProcess type of boolean  
	 * @param getparamater from view such as gen_id,gen_name,gen_stardate,gen_enddate,gen_status 
	    then throw parameter into ModelUpdate and call method updateGenerationRecord for excuteQuery Update Record in DB. 
     * @param request
	 * @param respons 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ParseException
	 * @return  "true" if Update successful, else  return "false" unsuccessful.
	 * @throws IOException 
	 */
	public  void doProcess (HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ParseException, IOException{
	
		model.dto.generation gen=new model.dto.generation();
	    gen.setGen_id(Integer.parseInt(request.getParameter("gen_id")));
	    gen.setGen_name(request.getParameter("gen_name"));
	    gen.setStart_date(Convertor.stringToDate(request.getParameter("start_date")));
	    gen.setEnd_date(Convertor.stringToDate(request.getParameter("end_date")));
	    System.out.println(gen.getEnd_date());
	    if(new model.update.updateGeneration().updateGenerationRecord(gen)){
	    	response.getWriter().write("Success");return;
	    }
	    response.getWriter().write("Fail");
	    
	  }

}
