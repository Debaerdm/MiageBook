package servlet;

import bean.LoginBean;
import dao.LoginDao;
import org.mindrot.jbcrypt.BCrypt;

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            LoginBean loginBean = new LoginBean();

            String hashed = BCrypt.hashpw(req.getParameter("prenom"), BCrypt.gensalt());

            loginBean.setLogin(req.getParameter("login"));
            loginBean.setPassword(hashed);
            loginBean.setNom(req.getParameter("nom"));
            loginBean.setPrenom(req.getParameter("prenom"));
            loginBean.setEmail(req.getParameter("email"));
            loginBean.setConnecter(0);

            if (LoginDao.inscription(loginBean)) {
                resp.sendRedirect("/login.jsp");
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/inscription.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<div class=\"alert alert-danger fade in\">\n" +
                        " <strong> Danger ! </strong> Erreur.\n </div>");
                rd.include(req, resp);
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }

    }
}
