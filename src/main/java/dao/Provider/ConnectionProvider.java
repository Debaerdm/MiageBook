package dao.Provider;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import static dao.Provider.Provider.*;

public class ConnectionProvider {

    private static Connection con = null;

    static{
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(CONNECTION_URL);
        } catch(SQLException ex) {
            Logger.getLogger(ConnectionProvider.class.getName()).log(Level.SEVERE, "[CONNECTION] ERROR", ex);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getCon(){
        return con;
    }
}
