package BaseDatos;

/*
 Esta clase permite interactual  con una base de datos MySQL
 Requiere la libreria: mysql-connector-java-5.0.8-bin.jar
 */
import java.sql.*;

public class Conexion {

    private Connection conexion;
    private Statement comando;

    /** Conecta con un servidor de MySQL**/
    @SuppressWarnings("empty-statement")
    public boolean Conectar(String host, String BD, String User, String Password) throws Exception {
        boolean con;
        try {
            DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
            
            this.conexion = DriverManager.getConnection("jdbc:mysql://" + host+"/"+BD ,  User , Password);
            this.comando = conexion.createStatement();

            con = true;
        } catch (SQLException exc) {
            System.out.println("Error "+exc.toString());
            con = false;
        };

        return con;
    }

    /**Ejecuta una consulta SQL con SELECT**/
    public ResultSet ejecutarConsulta(String instruccionQL) throws SQLException {
        ResultSet resultado = this.comando.executeQuery(instruccionQL);
        return resultado;
    }

    /**Ejecuta una comando DML como INSERt, UPDATE o DELETE o tambien DDL como CREATE, DROP, ALTER**/
    public int ejecutarActualizacion(String instruccionDML) throws SQLException {
        int i;
        i = this.comando.executeUpdate(instruccionDML);
        System.out.println(instruccionDML + " Ejecutada");
        return i;
    }

}
