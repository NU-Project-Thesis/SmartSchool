package controller.insert;

import java.io.File;
import java.io.IOException;
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

import model.select.selectStudent;
import utils.Convertor;

/**
 * Servlet implementation class InsertStudent
 */
@WebServlet("/admin/insertStudent.hrd")
public class InsertStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertStudent() {
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
	 * @param getParamater
	 *            from view_course such as cus_name, cus_startdate , cus_enddate
	 *            , cus_id, cus_finish id is auto number _ then throw into
	 *            ModelInsert call method insertCourseRecvord excuteQuery insert
	 *            into DB.
	 * @return "true" if insert successful, else return "false" unsuccessful.
	 * @throws Exception
	 **/
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* try { */
		model.dto.Student stu = new model.dto.Student();
		model.insert.insertStudent dao = new model.insert.insertStudent();
		String saveFolder = request.getSession().getServletContext().getRealPath("image/student");
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

					int iu = new selectStudent().getLastID();
					String filePath = saveFolder + File.separator + iu + fileName.toLowerCase();
					uploadedFile = new File(filePath);
					System.out.println(uploadedFile);
					// saves the file to upload directory
					item.write(uploadedFile);
					stu.setPhoto(iu + fileName.toLowerCase());
					haspic = true;
					// response.getWriter().print("save success.");
					System.err.println("Save success");
				} else {
					// get value from form
					String value = item.getString();
					// get name of control of form.
					String name = item.getFieldName();
					if (name.equals("first_name"))
						stu.setFirst_name(value);

					if (name.equals("last_name"))
						stu.setLast_name(value);

					if (name.equals("email"))
						stu.setEmail(value);
					if (name.equals("gender"))
						stu.setGender(value.charAt(0));

					if (name.equals("dob")) {
						stu.setDob(Convertor.stringToDate(value));
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

				}
			}

			if (haspic != true)
				stu.setPhoto("default-profile.png");
			if (dao.insertStudentRecord(stu)) {
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
