package servlet;

import bean.LoginBean;
import bean.StatusBean;
import dao.LoginDao;
import dao.StatusDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import static dao.Provider.Provider.DATE_FORMAT;

@WebServlet(name = "StatusServlet", urlPatterns = "/statusservice")
public class StatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {




            StatusBean statusBean = new StatusBean();
                LoginBean loginBean = new LoginBean();
                loginBean.setLogin(req.getParameter("login"));
                statusBean.setLoginBean(loginBean);
                statusBean.setTitre(req.getParameter("titre"));
                statusBean.setTexte(req.getParameter("texte"));
                statusBean.setDate(LocalDateTime.now());

                if (StatusDao.addStatus(statusBean)) {
                    resp.sendRedirect("/publierStatus.jsp");
                } else {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher(req.getContextPath());
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
