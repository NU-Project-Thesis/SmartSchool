package controller.permission;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import groovy.ui.SystemOutputInterceptor;
import model.dto.StaffDTO;

/**
 * Servlet implementation class UserLoginProcess
 */
@WebServlet("/hrd-admin/userLoginProcess.hrd")
public class UserLoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		model.dto.StaffDTO dto = new StaffDTO();
		dto.setEmail(email);
		dto.setPassword(password);
		try {
			model.dto.StaffDTO dto_new = new model.select.SelectLogin().procesStaf(dto); 
			if(dto_new!=null){
				if(dto_new.getStatus()!="drop"){
					request.getSession().setAttribute("user", dto_new);
					System.out.println("Success");
					response.getWriter().write("Success");
					return;
				}else{
					response.getWriter().write("Drop");
					System.out.println("Drop");
					return;
				}
				
			}
		} catch (ClassNotFoundException | NoSuchAlgorithmException | SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Fail");
		response.getWriter().write("Fail");
	}

}
