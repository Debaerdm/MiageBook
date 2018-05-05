package servlet;

import dao.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogoutServlet", urlPatterns = "/logoutservice")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");

        if (LoginDao.disconnecter(login)) {

            resp.setContentType("text/html");
            Cookie[] cookies = req.getCookies();

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("JSESSIONID")) {
                        break;
                    }
                }
            }
            //invalidate the session if exists
            HttpSession session = req.getSession(false);
            if (!session.isNew()) {
                session.invalidate();
            }
            resp.sendRedirect("/login.jsp");
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/myindex.jsp");
            PrintWriter out = resp.getWriter();
            out.println("<div class=\"alert alert-danger fade in\">\n" +
                    " <strong> Danger ! </strong> Erreur.\n </div>");
            rd.include(req, resp);
        }
    }
}
