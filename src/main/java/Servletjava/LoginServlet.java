package Servletjava;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet  extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
throws ServletException, IOException {

try {

String email =
      request.getParameter("email");

String password =
      request.getParameter("password");

ConnectionDb db = new ConnectionDb();

boolean status =
      db.checkLogin(email, password);

if(status){

  // SESSION CREATE

  HttpSession session =
          request.getSession();

  session.setAttribute("admin", email);

  response.sendRedirect("plain");

}
else{

  response.getWriter().println(

      "<h2>Invalid Email or Password</h2>"
  );
}

} catch (Exception e) {

response.getWriter().println(e);
}
}
}
