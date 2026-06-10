package Servletjava;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);

            if(session == null ||
               session.getAttribute("admin") == null){

                response.sendRedirect("login.jsp");

                return;
            }

            int id =
                Integer.parseInt(
                    request.getParameter("id")
                );

            ConnectionDb db = new ConnectionDb();

            ResultSet rs =
                    db.getSingleData(id);

            request.setAttribute("profile", rs);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "profile.jsp");

            rd.forward(request, response);

        } catch (Exception e) {

            response.getWriter().println(e);
        }
    }
}