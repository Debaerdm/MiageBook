package servlet;

import bean.LoginBean;
import dao.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            LoginBean loginBean = new LoginBean();

            loginBean.setLogin(req.getParameter("login"));
            loginBean.setPassword(req.getParameter("password"));

            if (LoginDao.validate(loginBean)) {
                HttpSession session = req.getSession(true);
                session.setAttribute("currentSessionUser",loginBean);
                session.setMaxInactiveInterval(30*60);

                resp.sendRedirect("myindex.jsp");
            } else {
                //resp.sendRedirect("invalidLogin.jsp");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("login.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<font color=red>Either user name or password is wrong.</font>");
                rd.include(req, resp);
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }
}
