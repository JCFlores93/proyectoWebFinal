package connectionDB;
import java.io.FileInputStream;
import java.sql.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

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
	    
	    public static void uploadDocument(int id ,FileInputStream fileInputStream) throws SQLException{
	    	String updateSQL = "UPDATE datos_personales_empleado SET documentFile = ? WHERE id_emp =?";
	    	PreparedStatement pstmt = null;
	    	
				 pstmt = conexion.prepareStatement(updateSQL);
				 pstmt.setBinaryStream(1,fileInputStream);
			     pstmt.setInt(2,id);
			     pstmt.executeUpdate();
	    	
	    }
	    
	    public static void download(int id) throws SQLException{
	    	String selectSQL = "SELECT  documentFile FROM datos_personales_empleado WHERE id_emp =?";
	    	PreparedStatement pstmt = null;
	    	
				 pstmt = conexion.prepareStatement(selectSQL);
			     pstmt.setInt(1,id);
			     ResultSet rs = pstmt.executeQuery();
			     File file = new File("D:\"" + id + ".pdf");
		            FileOutputStream output = null;
					try {
						output = new FileOutputStream(file);
					} catch (FileNotFoundException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
		 
		            System.out.println("Writing to file " + file.getAbsolutePath());
		          try{
		            while (rs.next()) {
		                InputStream input = rs.getBinaryStream("resume");
		                byte[] buffer = new byte[1024];
		                while (input.read(buffer) > 0) {
		                    output.write(buffer);
		                }
		            }
		        } catch (SQLException | IOException e) {
		            System.out.println(e.getMessage());
		        } finally {
		            try {
		                if (rs != null) {
		                    rs.close();
		                }
		            } catch (SQLException e) {
		                System.out.println(e.getMessage());
		            }
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
