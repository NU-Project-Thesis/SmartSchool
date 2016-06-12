package controller.update;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.update.UpdateStaff;

/**
 * Servlet implementation class UpdateSubject
 */
@WebServlet("/admin/updateImgStaff.hrd")
public class UpdateImgStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateImgStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			doProccess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*model.dto.StaffDTO staff = new model.dto.StaffDTO();
		int staff_id = ((model.dto.StaffDTO) request.getSession().getAttribute("user")).getId();
		staff.setId(staff_id);
		staff.setFirstName(request.getParameter("first_name"));
		staff.setLastName(request.getParameter("last_name"));
		staff.setGender(request.getParameter("gender").charAt(0));
		staff.setPhone(request.getParameter("phone"));

		try {
			new model.update.UpdateStaff();
			if (UpdateStaff.updateProfile(staff)) {
				response.getWriter().write("Success");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		try {
			response.getWriter().write("Fail");
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
		try {
			doProccess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void  doProccess(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		model.dto.StaffDTO staff = new model.dto.StaffDTO();
		int staff_id = ((model.dto.StaffDTO) request.getSession().getAttribute("user")).getId();
		staff.setId(staff_id);
		System.out.println(staff_id);
		String saveFolder = request.getSession().getServletContext().getRealPath("image/staff");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024 * 2);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletContext c = request.getServletContext();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1024 * 1024 * 2);
		// Parse the request
		List items = upload.parseRequest(request);
		boolean haspic = false;
		Iterator iter = items.iterator();
		File uploadedFile = null;
		FileItem itemu = null;
		String fileName = null;
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();

			if (!item.isFormField()) {
				if (item.getName() == "" || item.getName() == null)
					continue;
				fileName = new File(item.getName()).getName().substring(item.getName().lastIndexOf("."),
						item.getName().length());

				String filePath = saveFolder + File.separator + staff_id + fileName.toLowerCase();
				uploadedFile = new File(filePath);
				System.out.println(uploadedFile);
				// saves the file to upload directory
				item.write(uploadedFile);
				staff.setPhoto(staff_id + fileName.toLowerCase());
				haspic = true;
			}
		}

		System.out.println(staff.getPhoto());
		
		if (model.update.UpdateStaff.updateImage(staff)) {
			response.getWriter().write("Success");
			return;
		} else
			response.getWriter().write("Fail");


	}
}
