package controller.update;

import java.io.File;
import java.io.IOException;
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

import utils.Convertor;

/**
 * Servlet implementation class UpdateStudentProfile
 */
@WebServlet("/UpdateStudentProfile.hrd")
public class UpdateStudentProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStudentProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			model.dto.Student stu = new model.dto.Student();
			model.update.updateStudent dao = new model.update.updateStudent();
			int stu_id = ((model.dto.Student)request.getSession().getAttribute("stu")).getStu_id();
			stu.setStu_id(stu_id);
			String saveFolder = request.getSession().getServletContext().getRealPath("image/student");
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
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (!item.isFormField()) {
					System.out.println("not form field");
					if (item.getName() == "" || item.getName() == null)
						continue;

					fileName = new File(item.getName()).getName().substring(item.getName().lastIndexOf("."),
							item.getName().length());

					// in-case of image is not change skip
					if (fileName == "")
						continue;
					itemu = item;
					haspic = true;
					
				} else {
					// get value from form
					String value = item.getString();
					// get name of control of form.
					String name = item.getFieldName();

					if (name.equals("stu_id")) {
						stu.setStu_id(Integer.parseInt(value));
						System.out.println(stu.getStu_id());
					}

					if (name.equals("first_name")) {
						stu.setFirst_name(value);
					}

					if (name.equals("last_name"))
						stu.setLast_name(value);

					if (name.equals("email"))
						stu.setEmail(value);
					if (name.equals("gender"))
						stu.setGender(value.charAt(0));

					if (name.equals("dob")) {
						stu.setDob(sd.parse(value));
					}
					if (name.equals("password")) {
						stu.setPassword(value);
					}
					if (name.equals("address")) {
						stu.setAddress(value);
					}
					if (name.equals("phone")) {
						stu.setPhone(value);
					}
					if (name.equals("race")) {
						stu.setRace(value);
					}
					if (name.equals("social_id")) {
						stu.setSocial_id(value);
					}
					if (name.equals("father_name")) {
						stu.setFather_name(value);
					}
					if (name.equals("father_phone")) {
						stu.setFather_phone(value);
					}
					if (name.equals("mother_name")) {
						stu.setMother_name(value);
					}
					if (name.equals("mother_phone")) {
						stu.setMother_phone(value);
					}
					if (name.equals("hide_img")) {
						stu.setPhoto(value);
						hide_img = value;
					}

				}
			}
			
			
			/*
			 * if (!haspic) stu.setPhoto(hide_img);
			 */
			if (haspic) {
				String filePath = saveFolder + File.separator + stu_id + fileName.toLowerCase();
				uploadedFile = new File(filePath);
				System.out.println(filePath);
				itemu.write(uploadedFile);
				stu.setPhoto(stu_id + fileName.toLowerCase());
			}
			System.out.println("haspic: " + haspic);
			System.err.println("Updating+" + stu.getPhoto());
			if (dao.updateStudentRecord(stu)) {
				response.getWriter().write("Success");
			} else
				response.getWriter().write("Fail");
		} catch (FileUploadException ex) {
			throw new ServletException(ex);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new ServletException(ex);
		}
	}

}
