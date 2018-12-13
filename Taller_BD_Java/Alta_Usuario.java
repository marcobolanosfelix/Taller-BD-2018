package Taller_BD;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
public class Alta_Usuario extends JPanel implements ActionListener{
	private JLabel[] eti=new JLabel[5];
	private JTextField[] text = new JTextField[5];
	private JButton guardar,limpiar;
	
	public Alta_Usuario(){
		Inicializacion();
		hazInterfaz();
		hazEscuchas();
	}
	
	public void Inicializacion(){
		eti[0]=new JLabel("Email: ");
		eti[1]=new JLabel("Nombre: ");
		eti[2]=new JLabel("Nombre de usuario: ");
		eti[3]=new JLabel("Contraseña: ");
		eti[4]=new JLabel("Ciudad de residencia: ");
		
		for(int i=0; i<text.length;i++)
			text[i]=new JTextField(15);
		guardar=new JButton("Guardar");
		limpiar=new JButton("Limpiar");
	}
	
	public void hazInterfaz(){
		setSize(700,600);
		setLayout(null);
		int x=180,y=10;
		for(int i=0; i<eti.length; i++){
			eti[i].setBounds(x, y, 200, 30);
		    y+=40;
		    add(eti[i]);
		}
		for(int i=0; i<text.length; i++){
			y=eti[i].getY();
			text[i].setBounds(360, y, 200, 30);
			add(text[i]);
		}
		guardar.setBounds(390, 280, 110, 40);
		limpiar.setBounds(190, 280, 110, 40);
		add(guardar);
		add(limpiar);
	}
	
	public void hazEscuchas(){
		guardar.addActionListener(this);
		limpiar.addActionListener(this);
	}
	
	public void actionPerformed(ActionEvent Evt) {
		if(Evt.getSource()==guardar){
			altaUsuario();
			return;
		}
			
	}
	
	public void altaUsuario(){
		
		Conexion c= new Conexion();
		try{
			PreparedStatement sentencia= c.getConnection().prepareStatement("insert into Usuario"
					+ " values(?,?,?,?,?)");
			sentencia.setString(1, text[0].getText());
			sentencia.setString(2, text[1].getText());
			sentencia.setString(3, text[2].getText());
			sentencia.setString(4, text[3].getText());
			sentencia.setString(5, text[4].getText());
			sentencia.execute();
			c.getConnection().close();
		}catch(SQLException e){
			if(e.getErrorCode()==2627) {
				System.out.println("Error de integridad de la base de datos");
				JOptionPane.showMessageDialog(null, "Error de integridad de la base de datos."
						+ " Ingresa un correo o nombre de usuario distinto.");
			}
			
		if(e.getErrorCode()==547) 
			JOptionPane.showMessageDialog(null, "Error de integridad de la base de datos."
					+ " Ingrese un id de ciudad valido.");

		}
	}
}
