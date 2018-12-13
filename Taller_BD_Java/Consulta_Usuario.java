package Taller_BD;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.xml.soap.Text;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.Vector;

public class Consulta_Usuario extends JPanel {
	String email;
	JLabel etqEmail;
	JButton btnEmail;
	JTextField txtEmail;
	JScrollPane antetabla;
	JPanel panelEmail;
	DefaultTableModel modelo = new DefaultTableModel();
	
	public Consulta_Usuario() {
		setSize(800, 700);
		setLayout(null);
		creaVistaDatos();
	}
	
	public void email() {
		panelEmail = new JPanel();
		panelEmail.setLayout(new FlowLayout());
		etqEmail = new JLabel("Correo electrónico: ");
		panelEmail.add(etqEmail);
		txtEmail = new JTextField();
		panelEmail.add(txtEmail);
		btnEmail = new JButton("Buscar");
		panelEmail.add(btnEmail);
		add(panelEmail, BorderLayout.NORTH);
	}
	
	public void creaVistaDatos() {
		modelo.addColumn("ID: ");
		modelo.addColumn("Email: ");
		modelo.addColumn("Nombre: ");
		modelo.addColumn("Nombre de usuario: ");
		modelo.addColumn("Contraseña: ");
		modelo.addColumn("Ciudad de residencia: ");
		JTable cola = new JTable(modelo);
		antetabla=new JScrollPane(cola);
		cola.setBounds(50, 10, 700, 50);
		antetabla.setBounds(10, 10, 750, 650);
		add(antetabla, BorderLayout.CENTER);
		actualiza();
	}
	
	public void actualiza() {
		ResultSet resultadoConsulta;
		Conexion con = new Conexion();//Creo una conexion a la base de datos
		try {
			PreparedStatement sentencia=con.getConnection().prepareStatement("select * from Usuario");
			//sentencia.setString(1, text.getText());
			resultadoConsulta=sentencia.executeQuery();
			
			while (resultadoConsulta.next()) {
				
			PreparedStatement nombLug=con.getConnection().prepareStatement("select nombre from Ciudad where id= ?");
			nombLug.setString(1, resultadoConsulta.getString(6));
			ResultSet rTemp = nombLug.executeQuery();
			rTemp.next();
			System.out.println();
				 Vector<String> datos=new Vector<String>();
				 datos.add(resultadoConsulta.getString(1));
				 datos.add(resultadoConsulta.getString(2));
				 datos.add(resultadoConsulta.getString(3));
				 datos.add(resultadoConsulta.getString(4));
				 datos.add(resultadoConsulta.getString(5));	 
				 datos.add(rTemp.getString(1));
				 modelo.addRow(datos);
			}
			System.out.println("No jala");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			JOptionPane.showMessageDialog(null,e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);//Por si hay un error cacho la excepcion
		}
		
	}

}
