package servlet;

import bean.LoginBean;
import dao.LoginDao;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LoginBean currentUser = (LoginBean) (req.getAttribute("currentSessionUser"));

        if (LoginDao.disconnecter(currentUser.getLogin())) {

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
        }
    }
}
