package servlet;

import bean.LoginBean;
import dao.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class InscriptionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login").trim();

        if (LoginDao.exist(login)) {
            //throw new Exception();
        }

        /*String greetings = "Hello " + userName;

        response.setContentType("text/plain");
        response.getWriter().write(greetings);*/
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            LoginBean loginBean = new LoginBean();

            loginBean.setLogin(req.getParameter("login"));
            loginBean.setPassword(req.getParameter("password"));
            loginBean.setNom(req.getParameter("nom"));
            loginBean.setPrenom(req.getParameter("prenom"));
            loginBean.setEmail(req.getParameter("email"));

            if (LoginDao.inscription(loginBean)) {
                resp.sendRedirect("/login.jsp");
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/inscription.jsp");
                rd.include(req, resp);
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }

    }
}
