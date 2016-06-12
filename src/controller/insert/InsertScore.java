package controller.insert;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Convertor;

/**
 * Servlet implementation class InsertScore
 */
@WebServlet("/admin/insertScore.hrd")
public class InsertScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertScore() {
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
	public  void  doProcess (HttpServletRequest request, HttpServletResponse response) throws IOException {
		   try{
			   
			model.dto.ScoreDTO score=new model.dto.ScoreDTO();
			
			System.out.println(request.getParameter("score").split(","));
			System.out.println(request.getParameter("stu_id").split(","));
			String arrScore[]= request.getParameter("score").split(",");
			String arrStuId[]= request.getParameter("stu_id").split(",");
			
			score.setScoreDate(Convertor.stringToDate(request.getParameter("score_date")));
			score.setSubId(Integer.parseInt(request.getParameter("sub_id")));
			int class_id = Integer.parseInt(request.getParameter("class_id"));
			if(model.insert.InsertScore.process(arrScore, arrStuId, score, class_id)){
				response.getWriter().write("Success");
		    	return;
		   
		    }
			
		   }catch(Exception e){e.printStackTrace();}
		   		response.getWriter().write("DateDuplicated");		     
		  }
		

	
	
}
