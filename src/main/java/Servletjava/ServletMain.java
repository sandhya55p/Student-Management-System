package Servletjava;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;
@MultipartConfig
@WebServlet("/plain")
public class ServletMain extends HttpServlet {

	protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
throws IOException {

try {
	HttpSession session =
	        request.getSession(false);

	if(session == null ||
	   session.getAttribute("admin") == null){

	    response.sendRedirect("login.jsp");

	    return;
	}

ConnectionDb db = new ConnectionDb();

// 🔴 DELETE

String deleteId = request.getParameter("delete");

if (deleteId != null) {

   db.deleteData(Integer.parseInt(deleteId));

   response.sendRedirect("plain");

   return;
}

// 🔵 EDIT FETCH

String editId = request.getParameter("edit");

if(editId != null){

   ResultSet editRs =
           db.getSingleData(
           Integer.parseInt(editId));

   request.setAttribute("editRs", editRs);

   RequestDispatcher rd =
           request.getRequestDispatcher("edit.jsp");

   rd.forward(request, response);

   return;
}

// 🔽 FETCH DATA

int page = 1;

int total = 5;

if(request.getParameter("page") != null){

    page =
    Integer.parseInt(
    request.getParameter("page")
    );
}

int start =
(page - 1) * total;

ResultSet rs =
db.getPaginatedData(start, total);

int totalStudents =
db.getStudentCount();

int totalPages =
(int)Math.ceil(
(double)totalStudents / total
);

request.setAttribute(
"totalPages",
totalPages
);

request.setAttribute(
"currentPage",
page
);

request.setAttribute("rs", rs);
int totalStudents1 =
db.getStudentCount();

request.setAttribute(
"totalStudents",
totalStudents1);
request.setAttribute(
"activeStudents",
db.getActiveStudents()
);

request.setAttribute(
"inactiveStudents",
db.getInactiveStudents()
);

request.setAttribute(
"maleStudents",
db.getMaleStudents()
);

request.setAttribute(
"femaleStudents",
db.getFemaleStudents()
);
RequestDispatcher rd =
       request.getRequestDispatcher("index.jsp");

rd.forward(request, response);

} catch (Exception e) {

response.getWriter().println(e);
}
}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String course = request.getParameter("course");
            String phone =
            		request.getParameter("phone");

            		String address =
            		request.getParameter("address");
            		String gender =
            				request.getParameter("gender");

            				String status =
            				request.getParameter("status");
            Part filePart = request.getPart("image");

            String fileName = filePart.getSubmittedFileName();
            String uploadPath =
            		getServletContext().getRealPath("") + "images";

            		File uploadDir = new File(uploadPath);

            		if (!uploadDir.exists()) {
            		    uploadDir.mkdir();
            		}

            		filePart.write(uploadPath + File.separator + fileName);
            		
            ConnectionDb db = new ConnectionDb();
            db.insertData(
            		name,
            		email,
            		course,
            		phone,
            		address,
            		gender,
            		status,
            		fileName
            		);
            response.sendRedirect("plain"); // refresh page

        } catch (Exception e) {
            response.getWriter().println(e);
        }
    }
}