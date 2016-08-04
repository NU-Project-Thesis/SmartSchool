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

import model.dto.StaffDTO;

/**
 * Servlet Filter implementation class LogInUser
 */
@WebFilter("/admin/*")
public class LogInUser implements Filter {

	/**
	 * Default constructor.
	 */
	public LogInUser() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String s = ((HttpServletRequest) request).getContextPath();

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession();
		StaffDTO user = (StaffDTO) session.getAttribute("user");

		System.out.println(req.getRequestURI());
		
		if (req.getRequestURI().contains("/admin/reportCertificate.pdf")) {
			// go to the page that user request
			chain.doFilter(request, response);
			return;
		}
		
		if(user == null && !req.getRequestURI().contains("hrd-admin")) {
			res.sendRedirect(s + "/hrd-admin/index.jsp");
			return;
		}
		// go to the page that user request
		chain.doFilter(request, response);

	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
