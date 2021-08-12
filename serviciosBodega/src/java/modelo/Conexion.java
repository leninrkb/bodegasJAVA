
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leninrkb
 */
public class Conexion {

    Connection conn; 
    /*private String user = "u1vt1vj4bcokl9xk";
    private String password = "GTUS2Pdzz0ZIPoAHYUpT";
    private String dbname = "/bylqlybowffqcjek1usj";
    private String host = "jdbc:mysql://bylqlybowffqcjek1usj-mysql.services.clever-cloud.com:3306"+dbname;*/
    
    private String user = "root";
    private String password = "";
    private String dbname = "/bodega";
    private String host = "jdbc:mysql://localhost"+dbname;

    public Conexion(){

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection(host,user,password);
 
        } catch (SQLException e) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConexion() {
        return conn;
    } 
}
