package Servletjava;


import java.io.IOException;
import java.io.File;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id =
                Integer.parseInt(request.getParameter("id"));

            String name =
                request.getParameter("name");

            String email =
                request.getParameter("email");

            String course =
                request.getParameter("course");
            String phone =
            		request.getParameter("phone");

            		String address =
            		request.getParameter("address");
            		String gender =
            				request.getParameter("gender");

            				String status =
            				request.getParameter("status");
            Part filePart = request.getPart("image");

            String fileName =
                    filePart.getSubmittedFileName();
            String uploadPath =
            		getServletContext().getRealPath("") + "images";

            		File uploadDir = new File(uploadPath);

            		if(!uploadDir.exists()){

            		    uploadDir.mkdir();
            		}

            		if(fileName != null && !fileName.isEmpty()){

            		    filePart.write(uploadPath +
            		            File.separator + fileName);
            		}
            ConnectionDb db = new ConnectionDb();

            db.updateData(
            		id,
            		name,
            		email,
            		course,
            		phone,
            		address,
            		gender,
            		status,
            		fileName
            		);
            response.sendRedirect("plain");

        } catch (Exception e) {

            response.getWriter().println(e);
        }
    }
}