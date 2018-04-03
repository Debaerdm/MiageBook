package dao;

import bean.LoginBean;
import dao.Provider.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginDao {

    public static boolean validate(LoginBean bean){
        /*boolean status = false;

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM MiageUsers WHERE login = ? AND password = ?");

            ps.setString(1, bean.getLogin());
            ps.setString(2, bean.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch(Exception e){
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, "[LOGIN DAO] ERROR DATA", e);
        }

        return status;*/
        return true;
    }
}
