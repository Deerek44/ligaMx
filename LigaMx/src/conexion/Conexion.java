
package conexion;
import java.sql.*;

public class Conexion {
    Connection conectar=null;
    public Connection obtener(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conectar=DriverManager.getConnection("jdbc:mysql://localhost/ligamx","root","root");
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return conectar;
    }
    
}
