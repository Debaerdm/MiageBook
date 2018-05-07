package servlet;

import bean.LoginBean;
import dao.CommentaireDao;
import dao.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AjouterAmisServlet", urlPatterns = "/addfriendservice")
public class AjouterAmisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
                String newFriend = req.getParameter("ajouter");

                HttpSession session = req.getSession();

                LoginBean current_user = (LoginBean) session.getAttribute("currentSessionUser");

            if (LoginDao.addFriend(newFriend, current_user.getLogin())) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listeUtilisateurs.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<div class=\"alert alert-success alert-dismissible fade show\">\n" +
                        " <strong> Well done ! </strong> "+newFriend+" ajoute en ami(e).\n </div>");
                rd.include(req, resp);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listeUtilisateurs.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<div class=\"alert alert-danger alert-dismissible fade show\">\n" +
                        " <strong> Danger ! </strong> Impossible d'ajouter cet ami.\n </div>");
                rd.include(req, resp);
            }

        } catch (Exception e) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/listeUtilisateurs.jsp");
            PrintWriter out = resp.getWriter();
            out.println("<div class=\"alert alert-danger alert-dismissible fade show\">\n" +
                    " <strong> Danger ! </strong> Impossible d'ajouter cet ami.\n </div>");
            rd.include(req, resp);
        }
    }
}
