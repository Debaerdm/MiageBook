package servlet;

import dao.LoginDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SuppressionAmisServlet", urlPatterns = "/deletefriendservice")
public class SuppressionAmisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String loginRemove = req.getParameter("suppr");
            LoginDao.supprAmis("","");

            String scroll = req.getParameter("scroll");
            System.out.println("scroll : " + scroll);

            resp.sendRedirect("/profile.jsp#friends" );


        } catch (Exception ignored){}
    }
}
