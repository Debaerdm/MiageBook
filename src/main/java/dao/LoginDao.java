package dao;

import bean.LoginBean;
import dao.Provider.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public static boolean validate(LoginBean bean){
        boolean status = false;

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM utilisateur WHERE login = ? AND password = ?");

            ps.setString(1, bean.getLogin());
            ps.setString(2, bean.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch(Exception e){
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, "[LOGIN DAO] VALIDATION ERROR DATA", e);
        }

        return status;
    }

    public static boolean inscription(LoginBean bean){
        boolean status = false;

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("insert into utilisateur values(?,?,?,?,?)");

            ps.setString(1, bean.getLogin());
            ps.setString(2, bean.getPassword());
            ps.setString(3, bean.getNom());
            ps.setString(4, bean.getPrenom());
            ps.setString(5, bean.getEmail());

            status = (ps.executeUpdate() > 0);
        } catch (Exception e) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, "[LOGIN DAO] INSCRIPTION ERROR DATA", e);
        }

        return status;
    }
}
