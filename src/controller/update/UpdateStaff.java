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
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UpdateStaff
 */
@WebServlet("/admin/updateStaff.hrd")
public class UpdateStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * Create method doProcess type of boolean
	 * 
	 * @param getparamater
	 *            from view such as
	 *            stf_id,stf_firstname,stf_lastname,stf_gender,stf_position,
	 *            stf_email,stf_phone,stf_password,stf_status,stf_photo then
	 *            throw parameter into ModelUpdate and call method
	 *            updateClassRecord for excuteQuery Update Record in DB.
	 * @param request
	 * @param respons
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ParseException
	 * @return "true" if Update successful, else return "false" Unsuccessful.
	 * @throws IOException
	 */
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		model.dto.StaffDTO staff = new model.dto.StaffDTO();
		String saveFolder = request.getSession().getServletContext().getRealPath("image/staff");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024 * 2);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletContext c = request.getServletContext();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1024 * 1024 * 2);
		String hide_img = "";
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
				// in-case of image is not change skip
				if (fileName == "")
					continue;
				itemu = item;

				haspic = true;
				// response.getWriter().print("save success.");
				System.err.println("Save success");
			} else {
				// get value from form
				String value = item.getString();
				// get name of control of form.
				String name = item.getFieldName();
				
				if (name.equals("id"))
					staff.setId(Integer.parseInt(value));
				
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
				if (name.equals("hide_img")) {
					staff.setPhoto(value);
					hide_img = value;
				}
			}
		}

		/*
		 * if (haspic != true) staff.setPhoto(hide_img);
		 */
		if (haspic) {
			String filePath = saveFolder + File.separator + staff.getId() + fileName.toLowerCase();
			uploadedFile = new File(filePath);
			System.out.println(uploadedFile);
			// saves the file to upload directory
			itemu.write(uploadedFile);
			staff.setPhoto(staff.getId() + fileName.toLowerCase());
		}

		if (model.update.UpdateStaff.updateProcess(staff)) {
			response.getWriter().write("Success");
			return;
		} else
			response.getWriter().write("Fail");

	}
}
