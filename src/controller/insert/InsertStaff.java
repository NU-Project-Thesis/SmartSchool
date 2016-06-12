package controller.insert;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class insertStaff
 */
@WebServlet("/admin/insertStaff.hrd")
public class InsertStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStaff() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
				try {
					doProcess(request, response);
				} catch (Exception e) {e.printStackTrace();}
	
	
	}
	
	public  void doProcess (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		/* try { */
		model.dto.StaffDTO staff= new model.dto.StaffDTO();
		model.insert.InsertStaff dao = new model.insert.InsertStaff();
		String saveFolder = request.getSession().getServletContext().getRealPath("image/staff");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024 * 2);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletContext c = request.getServletContext();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1024 * 1024 * 2);

		try {
			// Parse the request
			List items = upload.parseRequest(request);
			boolean haspic = false;
			Iterator iter = items.iterator();
			File uploadedFile = null;
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();

				if (!item.isFormField()) {
					if (item.getName() == "" || item.getName() == null)
						continue;

					String fileName = new File(item.getName()).getName().substring(item.getName().lastIndexOf("."),
							item.getName().length());

					int iu = new model.select.SelectlistStaff().getLastID();
					String filePath = saveFolder + File.separator + iu + fileName.toLowerCase();
					uploadedFile = new File(filePath);
					System.out.println(uploadedFile);
					// saves the file to upload directory
					item.write(uploadedFile);
					staff.setPhoto(iu + fileName.toLowerCase());
					haspic = true;
					// response.getWriter().print("save success.");
					System.err.println("Save success");
				} else {
					// get value from form
					String value = item.getString();
					// get name of control of form.
					String name = item.getFieldName();
					if (name.equals("first_name"))
						staff.setFirstName(value);

					if (name.equals("last_name"))
						staff.setLastName(value);

					if (name.equals("gender"))
						staff.setGender(value.charAt(0));

					if (name.equals("position")) {
						staff.setPosition(value);
					}
					if (name.equals("email")) {
						staff.setEmail(value);
					}
					if (name.equals("password")) {
						staff.setPassword(value);
					}
					if (name.equals("phone")) {
						staff.setPhone(value);
					}
				}
			}

			if (haspic != true)
				staff.setPhoto("default-profile.png");
			if (dao.insertProcess(staff)) {
				response.getWriter().write("Success");
			} else
				response.getWriter().write("Fail");
		} catch (FileUploadException ex) {
			throw new ServletException(ex);
		} catch (Exception ex) {
			throw new ServletException(ex);
		}

	}
	
}