package dao;

import bean.LoginBean;
import dao.Provider.ConnectionProvider;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginDao {

    public static boolean exist(String login) {
        boolean exist = false;

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM utilisateur WHERE login = ?");

            ps.setString(1, login);

            ResultSet rs = ps.executeQuery();
            exist = rs.next();
        } catch (Exception ignored) {}

        return exist;
    }

    public static LoginBean validate(String login, String password){
        LoginBean bean = null;

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM utilisateur WHERE login = ?");

            ps.setString(1, login);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {

                if(password.equals(rs.getString(2))){
               // if(BCrypt.checkpw(password, rs.getString(2))) {

                    bean = new LoginBean();

                    bean.setLogin(rs.getString(1));
                    bean.setNom(rs.getString(3));
                    bean.setPrenom(rs.getString(4));
                    bean.setEmail(rs.getString(5));
                }
            }
        } catch(Exception e){
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, "[LOGIN DAO] VALIDATION ERROR DATA", e);
        }

        return bean;
    }

    public static LoginBean basicInformation(String login) {
        LoginBean loginBean = null;

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("SELECT login, nom, prenom FROM utilisateur WHERE login = ?");
            ps.setString(1, login);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {


                loginBean = new LoginBean();

                loginBean.setLogin(rs.getString(1));
                loginBean.setNom(rs.getString(2));
                loginBean.setPrenom(rs.getString(3));
            }
        } catch(Exception e){
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, "[LOGIN DAO] VALIDATION ERROR DATA", e);
        }

        return loginBean;
    }

    public static boolean inscription(LoginBean bean){
        boolean status = false;

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("insert into utilisateur values(?,?,?,?,?,?)");

            ps.setString(1, bean.getLogin());
            ps.setString(2, bean.getPassword());
            ps.setString(3, bean.getNom());
            ps.setString(4, bean.getPrenom());
            ps.setString(5, bean.getEmail());
            ps.setInt(6, bean.getConnecter());

            status = (ps.executeUpdate() > 0);
        } catch (Exception e) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, "[LOGIN DAO] INSCRIPTION ERROR DATA", e);
        }

        return status;
    }

    public static List<LoginBean> getAllUsers() {
        List<LoginBean> beanList = new ArrayList<>();

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("SELECT login, nom, prenom, connecter FROM utilisateur");

            ResultSet rs = ps.executeQuery();

            AddLoginBean(beanList, rs);
        } catch (Exception ignored) {}

        return beanList;
    }

    public static List<LoginBean> getAllFriends(String login){

        System.out.println("dao : getAllFriends");

        List<LoginBean> beanListFriends = new ArrayList<>();

        Connection con = ConnectionProvider.getCon();
        try {

            System.out.println("" +
                    "SELECT login, nom, prenom, connecter from Utilisateur where login in " +
                    "(select User2 from Amis where User1 = '" +login + "') or login in " +
                    "(select User1 from Amis where User2 = '" +login + "');");


            PreparedStatement ps = con.prepareStatement("" +
                    "SELECT login, nom, prenom, connecter from Utilisateur where login in " +
                    "(select User2 from Amis where User1 = '" +login + "') or login in " +
                    "(select User1 from Amis where User2 = '" +login + "');");

            //ps.setString(1,login);

            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                AddLoginBean(beanListFriends, rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beanListFriends;
    }


    private static void AddLoginBean(List<LoginBean> beanList, ResultSet rs) throws SQLException {
        while (rs.next()) {
            LoginBean loginBean = new LoginBean();
            loginBean.setLogin(rs.getString(1));
            loginBean.setNom(rs.getString(2));
            loginBean.setPrenom(rs.getString(3));
            loginBean.setConnecter(rs.getInt(4));

            beanList.add(loginBean);
        }
    }

    public static boolean supprAmis(String login){
        boolean status = false;

        try{
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("DELETE from Amis where User1='Debaerdm' AND User2 = ?");
            ps.setString(1, login);

            status = (ps.executeUpdate() > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    public static boolean connecter(String login) {
        return isStatus(login, "update utilisateur set connecter = 1 where login = ?");
    }

    public static boolean disconnecter(String login) {
        return isStatus(login, "update utilisateur set connecter = 0 where login = ?");
    }

    private static boolean isStatus(String login, String s) {
        boolean status = false;
        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement(s);

            ps.setString(1, login);

            status = (ps.executeUpdate() > 0);
        } catch (Exception ignored) {}

        return status;
    }
}
