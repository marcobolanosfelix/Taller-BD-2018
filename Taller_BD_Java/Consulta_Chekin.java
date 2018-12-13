package Taller_BD;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.Vector;

public class Consulta_Chekin extends JPanel {
	JScrollPane antetabla;
	JPanel panelEmail;
	DefaultTableModel modelo = new DefaultTableModel();
	
	public Consulta_Chekin() {
		setSize(800, 700);
		setLayout(null);
		creaVistaDatos();
	}
	
	public void creaVistaDatos() {
		modelo.addColumn("Lugar: ");
		modelo.addColumn("Nombre de Usuario ");
		modelo.addColumn("Comentario ");
		modelo.addColumn("Fecha ");
		modelo.addColumn("Hora ");
		modelo.addColumn("Check-in ID ");
		modelo.addColumn("Valoración");
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
			resultadoConsulta=sentencia.executeQuery("select * from Checkin");
			while (resultadoConsulta.next()) {
				 PreparedStatement lugar= con.getConnection().prepareStatement("Select nombre from Lugar "
				 		+ "where id= ?");
				 PreparedStatement Usuario= con.getConnection().prepareStatement("Select nombre_usuario "
				 		+ "from Usuario where id= ?");
				 lugar.setString(1, resultadoConsulta.getString(1));	
				 Usuario.setString(1, resultadoConsulta.getString(2));
				 ResultSet rl=lugar.executeQuery();
				 ResultSet ru=Usuario.executeQuery();
				 rl.next();
				 ru.next();
				 Vector<String> datos=new Vector<String>();
				 datos.add(rl.getString(1));
				 datos.add(ru.getString(1));
				 datos.add(resultadoConsulta.getString(3));
				 datos.add(resultadoConsulta.getString(4));
				 datos.add(resultadoConsulta.getString(5));
				 datos.add(resultadoConsulta.getString(6));
				 datos.add(resultadoConsulta.getString(7));
				 modelo.addRow(datos);
			}
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);//Por si hay un error cacho la excepcion
		}
	}

}
