package dao.Provider;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

import static dao.Provider.Provider.*;

public class ConnectionProvider {

    private static Connection con = null;

    static{
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
        } catch(Exception ex) {
            Logger.getLogger(ConnectionProvider.class.getName()).log(Level.SEVERE, "[CONNECTION] ERROR", ex);
        }
    }

    public static Connection getCon(){
        return con;
    }
}
