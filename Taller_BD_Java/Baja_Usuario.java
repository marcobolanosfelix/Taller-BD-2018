package Taller_BD;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
public class Baja_Usuario extends JPanel implements ActionListener{
	
	private JLabel eti=new JLabel("ID: ");
	private JTextField text = new JTextField(15);
	private JButton eliminar;
	
	public Baja_Usuario(){
		Inicializacion();
		hazInterfaz();
		hazEscuchas();
	}
	public void Inicializacion(){
		eliminar=new JButton("Eliminar");
	}
	public void hazInterfaz(){
		setSize(800,700);
		setLayout(new FlowLayout());
		add(eti);
		add(text);
		add(eliminar);
	}
	public void hazEscuchas(){
		eliminar.addActionListener(this);
	}
	public void actionPerformed(ActionEvent Evt) {
		if(Evt.getSource()==eliminar){
			bajaUsuario();
			return;
		}
	}
	
	public void bajaUsuario() {
		Conexion c= new Conexion();
		try{
			PreparedStatement sentencia= c.getConnection().prepareStatement("Delete Usuario where id= ?");
			if(!ifExists("Select 1 from Usuario where id= ?",Integer.parseInt(text.getText()) , c))
			{
				JOptionPane.showMessageDialog(null, "Este id no existe en la base de datos.");
				return;
			}
			JOptionPane.showMessageDialog(null, "El usuario con el id "+text.getText()+
					" se eliminó de la base de datos.");
			sentencia.setString(1, text.getText());
			System.out.println(text.getText());
			sentencia.execute();
			
			c.close();
			}catch(SQLException e){
				if(e.getErrorCode()==547)
					System.out.println("Error de integridad de base de datos.");
				    System.out.println("Error al eliminar al usuario");
				    
			}catch(IllegalArgumentException e) {
				JOptionPane.showMessageDialog(null, "Unicamente puede ingresar"
						+ " datos de tipo entero en el campo.");
			}
		}
	
	public boolean ifExists(String sqlSt, int id, Conexion c) throws SQLException {
		try {
		PreparedStatement state= c.getConnection().prepareStatement(sqlSt);
		state.setString(1, Integer.toString(id));
		ResultSet r=state.executeQuery();
		return r.next();
		}catch(SQLException e) {
			System.out.println("Error en la conexión");
			return false;
		}
		
	}
	
}
