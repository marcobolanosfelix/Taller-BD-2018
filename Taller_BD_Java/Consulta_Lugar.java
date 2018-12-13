package Taller_BD;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class Consulta_Lugar extends JPanel {
	JScrollPane antetabla;
	JPanel panelEmail;
	DefaultTableModel modelo = new DefaultTableModel();
	
	public Consulta_Lugar() {
		setSize(800, 700);
		setLayout(null);
		creaVistaDatos();
	}
	
	
	public void creaVistaDatos() {
		modelo.addColumn("ID: ");
		modelo.addColumn("Nombre: ");
		modelo.addColumn("Longitud: ");
		modelo.addColumn("Latitud: ");
		modelo.addColumn("Descripcion: ");
		modelo.addColumn("Categoria_ID: ");
		JTable cola = new JTable(modelo);
		antetabla=new JScrollPane(cola);
		cola.setBounds(50, 10, 700, 50);
		antetabla.setBounds(10, 10, 750, 650);
		add(antetabla, BorderLayout.CENTER); // Se puede eliminar.
		actualiza();
	}
	
	public void actualiza() {
		ResultSet resultadoConsulta;
		Conexion con = new Conexion();//Creo una conexion a la base de datos
		try {
			Statement sentencia=con.con.createStatement();
			
			resultadoConsulta=sentencia.executeQuery("select * from Lugar");
			while (resultadoConsulta.next()) {
				 Vector<String> datos=new Vector<String>();
				 datos.add(resultadoConsulta.getString(1));
				 datos.add(resultadoConsulta.getString(2));
				 datos.add(resultadoConsulta.getString(3));
				 datos.add(resultadoConsulta.getString(4));
				 datos.add(resultadoConsulta.getString(5));
				 datos.add(resultadoConsulta.getString(6));
				 modelo.addRow(datos);
			}
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);//Por si hay un error cacho la excepcion
		}
	}

}
