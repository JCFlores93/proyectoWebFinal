package connectionDB;
import java.sql.*;

public class BaseDeDatos {
	BaseDeDatos(){
		
	}
	  static Connection conexion = null;
	    
	   
	    
	    //CONECTAR A LA BASE DE DATOS DE LUZ VERDE
	    public static void conectar() {
	    	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	    	 final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_sgcrh";
	    	 final String USER = "root";
	    	 final String PASS = "";
	    	try {
	    		
	    		
				Class.forName(JDBC_DRIVER);
				
				conexion=DriverManager.getConnection(DB_URL + "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",USER,PASS);
			} catch (SQLException ex) {
				// TODO: handle exception
				System.out.println("SQL Exception :"+ex.toString());
			}catch(ClassNotFoundException cE){
				System.out.println("Class Not Found Exception :"+cE.toString());
			}
			if(conexion!=null){System.out.println("conexion exitosa");}else{System.out.println("falló la conexión");}
	    }

	    //DESCONECTAR LA BASE DE DATOS DE LUZ VERDE
	    public static void desconectar() {
	        try {
	            conexion.close();
	        } catch (Exception e) {
	        }
	    }

	    //PARA ELIMINAR E INSERTAR
	    public static void ejectuarInstruccion(String instruccion) {
	        try {
	            Statement sentencia = conexion.createStatement();
	            System.out.println("instruccion " + instruccion);
	            sentencia.executeUpdate(instruccion);
	        } catch (Exception ex) {
	            System.out.println("Error al ejecutar la instruccion SQL");
	        }
	    }

	    //PARA LA INSTRUCCION SELECT
	    public static ResultSet consultar(String instruccion) {
	        ResultSet resultado;
	        try {
	        	System.out.println(instruccion);
	            Statement sentencia = conexion.createStatement();
	            resultado = sentencia.executeQuery(instruccion);
	        } catch (Exception ex) {
	            System.out.println("Error al ejecutar la instruccion SQL");
	            return null;
	        }

	        return resultado;
	    }
}
