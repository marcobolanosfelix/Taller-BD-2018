package Taller_BD;
import java.sql.*;
public class Conexion {
	Connection con = null;
	public Conexion()  {
	 open();
	}
	
	public void open()
	{ 
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		   String connect="jdbc:sqlserver://localhost:1433;databasename=Cuatro_Cuadras;integratedSecurity=true;";
			try {
				con= DriverManager.getConnection(connect);
				System.out.println("Se conectó");
			} catch (SQLException e) {
				System.out.println("no me puedo conectar a la base de datos.");
				// TODO Auto-generated catch block
				e.getMessage();
			}
			
		
	}
	
	public void close() {
		try {
			con.close();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public Connection getConnection(){
		return con;
	}
	
}


/**/
