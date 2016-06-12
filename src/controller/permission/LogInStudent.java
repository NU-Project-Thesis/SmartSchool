package controller.permission;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dto.Student;

/**
 * Servlet Filter implementation class LogInStudent
 */
@WebFilter("/*")
public class LogInStudent implements Filter {

    /**
     * Default constructor. 
     */
    public LogInStudent() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String s = ((HttpServletRequest) request).getContextPath();

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession();
		Student dto = (Student) session.getAttribute("stu");
		
		System.out.println(req.getRequestURI());
		if (dto == null && !req.getRequestURI().contains("student") && !req.getRequestURI().contains("admin") && !req.getRequestURI().contains("image")) {
			res.sendRedirect(s + "/student/index.jsp");
			return;
		}else{ 
		
		// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
