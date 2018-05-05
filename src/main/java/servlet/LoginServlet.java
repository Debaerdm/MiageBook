package servlet;

import bean.LoginBean;
import dao.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = "/loginservice")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            LoginBean bean;

            if ((bean = LoginDao.validate(req.getParameter("login"), req.getParameter("password"))) != null) {
                if (LoginDao.connecter(bean.getLogin())) {
                    HttpSession session = req.getSession(true);
                    session.setAttribute("currentSessionUser", bean);
                    session.setMaxInactiveInterval(30 * 60);

                    resp.sendRedirect("/myindex.jsp");
                } else {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                    PrintWriter out = resp.getWriter();
                    out.println("<div class=\"alert alert-danger fade in\">\n" +
                            " <strong> Danger ! </strong> Login ou mot de passe incorrect.\n </div>");
                    rd.include(req, resp);
                }
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<div class=\"alert alert-danger fade in\">\n" +
                        " <strong> Danger ! </strong> Login ou mot de passe incorrect.\n </div>");
                rd.include(req, resp);
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }
}
