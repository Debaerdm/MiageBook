package servlet;

import bean.CommentaireBean;
import bean.LoginBean;
import dao.CommentaireDao;
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

@WebServlet(name = "CommentaireServlet", urlPatterns = "/commentaireservice")
public class CommentaireServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
            HttpSession session = req.getSession();

            LoginBean current_user = (LoginBean) session.getAttribute("currentSessionUser");

            String texte = req.getParameter("text-commentaire");
            long id = Long.parseLong(req.getParameter("idStatus"));

            CommentaireBean commentaireBean = new CommentaireBean();
            commentaireBean.setId_Status(id);
            commentaireBean.setLoginBean(current_user);
            commentaireBean.setTexte(texte);
            commentaireBean.setDate(LocalDateTime.now());

            resp.sendRedirect("/myindex.jsp");

            if (CommentaireDao.addCommentaire(commentaireBean)) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/myindex.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<div class=\"alert alert-success alert-dismissible fade show\">\n" +
                        " <strong> Well done ! </strong> Commentaire publier.\n </div>");
                rd.include(req, resp);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/myindex.jsp");
                PrintWriter out = resp.getWriter();
                out.println("<div class=\"alert alert-danger alert-dismissible fade show\">\n" +
                        " <strong> Danger ! </strong> Impossible d'ajouter ce commentaire.\n </div>");
                rd.include(req, resp);
            }

        } catch (Exception e) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/myindex.jsp");
            PrintWriter out = resp.getWriter();
            out.println("<div class=\"alert alert-danger alert-dismissible fade show\">\n" +
                    " <strong> Danger ! </strong> Impossible d'ajouter ce commentaire.\n </div>");
            rd.include(req, resp);
        }
    }
}
