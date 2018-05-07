package servlet;

import bean.LoginBean;
import dao.LoginDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SuppressionAmisServlet", urlPatterns = "/deletefriendservice")
public class SuppressionAmisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {


            String loginRemove = req.getParameter("suppr");
            System.out.println(loginRemove);

            HttpSession session = req.getSession();

            LoginBean current_user = (LoginBean) session.getAttribute("currentSessionUser");
            System.out.println(" current user " + current_user);
            LoginDao.supprAmis(loginRemove,current_user.getLogin());

            String scroll = req.getParameter("scroll");
            System.out.println("scroll : " + scroll);

            resp.sendRedirect("/profile.jsp#friends" );


        } catch (Exception ignored){}
    }
}
