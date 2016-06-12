package controller.insert;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Convertor;

/**
 * Servlet implementation class InsertGen
 */
@WebServlet("/admin/insertGen.hrd")
public class InsertGen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGen() {
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
				} catch (Exception e) {e.printStackTrace();}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
	
		// TODO Auto-generated method stub
				try {
					doProcess(request, response);
				} catch (Exception e) {e.printStackTrace();}

	}
	/**
	   * Create method doProcess type of boolean  
	   * @param getParamater from view such as gen_name, gen_startdate , gen_enddate id is auto number _
	     then throw into ModelInsert call method insertGenerationRecvord excuteQuery insert into DB. 
       * @return  "true" if delete successful, else  return "false" unsuccessful.
	 * @throws IOException 
	*/
	public  void doProcess (HttpServletRequest request, HttpServletResponse response) throws IOException {
   try{
	model.dto.generation gen=new model.dto.generation();
    gen.setGen_name(request.getParameter("gen_name"));    
    gen.setStart_date(Convertor.stringToDate(request.getParameter("start_date")));
    gen.setEnd_date(Convertor.stringToDate(request.getParameter("end_date")));
    if(new model.insert.insertGeneration().insertGenerationRecord(gen)){
    	response.getWriter().write("Success");
    	return;
    }
   }catch(Exception e){e.printStackTrace();}
   response.getWriter().write("Fail");
    
  }
}
