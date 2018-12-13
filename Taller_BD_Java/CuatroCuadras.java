package Taller_BD;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.*;

public class CuatroCuadras extends JFrame implements ActionListener {
	JMenuBar barra;
	JMenuItem itemActualizarUsuario, itemActualizarLugar; 
	JMenu tablasMenu, infoMenu,Usuario,Consultar,Lugar,informacion;
	JDialog pantInformacion;
	
	public CuatroCuadras() {
		super("Cuatro Cuadras");
		hazInterfaz();
		hazEscuchas();
		
	}
	public void hazInterfaz() {
		setSize(800, 700);
		setLocationRelativeTo(null);
		barra = new JMenuBar();
		tablasMenu = new JMenu("Registros...");
		informacion=new JMenu("Informacion");
		informacion.add(new JMenuItem("Ayuda"));
		Usuario = new JMenu("1. Usuarios   ");
		Usuario.add(new JMenuItem("Altas"));
		Usuario.addSeparator();
		Usuario.add(new JMenuItem("Bajas"));
		Usuario.addSeparator();
		Usuario.add(new JMenuItem("Actualizar"));
		Consultar =new JMenu("3. Consultar  ");
		Consultar.add(new JMenuItem("Usuarios"));
		Consultar.addSeparator();
		Consultar.add(new JMenuItem("Checkin"));
		Consultar.addSeparator();
		Consultar.add(new JMenuItem("Lugar"));
		Lugar = new JMenu("2. Lugar   ");
		Lugar.add(new JMenuItem("Altas"));
		Lugar.addSeparator();
		Lugar.add(new JMenuItem("Bajas"));
		Lugar.addSeparator();
		Lugar.add(new JMenuItem("Actualizar"));
		tablasMenu.add(Usuario);
		tablasMenu.addSeparator();
		tablasMenu.add(Lugar);
		tablasMenu.addSeparator();
		tablasMenu.add(Consultar);
		barra.add(tablasMenu);
		barra.add(informacion);
		setJMenuBar(barra);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void hazEscuchas(){
		Consultar.getItem(0).addActionListener(this);
		Consultar.getItem(4).addActionListener(this);
		Consultar.getItem(2).addActionListener(this);
		Usuario.getItem(2).addActionListener(this);
		Lugar.getItem(0).addActionListener(this);
		Usuario.getItem(4).addActionListener(this);
		Lugar.getItem(2).addActionListener(this);
		Lugar.getItem(4).addActionListener(this);
		informacion.getItem(0).addActionListener(this);
		Usuario.getItem(0).addActionListener(this);
	}
	public void actionPerformed(ActionEvent evt) {
		if(evt.getSource() == Consultar.getItem(2)){
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Consulta_Chekin a = new Consulta_Chekin();
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}if(evt.getSource() == Consultar.getItem(4)){
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Consulta_Lugar a = new Consulta_Lugar();
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
		if(evt.getSource() == Consultar.getItem(0)){
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Consulta_Usuario a = new Consulta_Usuario();
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
		if(evt.getSource() == informacion.getItem(0)){
			hazInterfazInformacion();
		}
		if(evt.getSource() == Usuario.getItem(0)) {
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Alta_Usuario a=new Alta_Usuario();//Creo la pantalla de altas
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
		if(evt.getSource() == Usuario.getItem(2)){
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Baja_Usuario a=new Baja_Usuario();//Creo la pantalla de altas
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
		if(evt.getSource() == Usuario.getItem(4)){
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Actualiza_Usuario a=new Actualiza_Usuario();//Creo la pantalla de altas
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
		if(evt.getSource() == Lugar.getItem(0)) {
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Alta_Lugar a=new Alta_Lugar();//Creo la pantalla de altas
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
		if(evt.getSource() == Lugar.getItem(2)) {
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Baja_Lugar a=new Baja_Lugar();//Creo la pantalla de altas
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
		if(evt.getSource() == Lugar.getItem(4)) {
			getContentPane().removeAll();//Remuevo el jpanel que tenia
			Actualiza_Lugar a=new Actualiza_Lugar();//Creo la pantalla de altas
			add(a);//La muestro
			a.updateUI();//Actualizo pantalla
		}
	}
	public void hazInterfazInformacion() {
		pantInformacion=new JDialog();
		pantInformacion.setSize(400, 350);
		pantInformacion.setLocationRelativeTo(null);
		JPanel infoTitulo = new JPanel();
		JLabel etqTitulo = new JLabel("Información", SwingConstants.CENTER);
		infoTitulo.add(etqTitulo);
		etqTitulo.setFont(new Font("Century Gothic", 3, 25));
		pantInformacion.add(etqTitulo, BorderLayout.NORTH);
		
		String parrafo = "Autores: \n"
				+ " * Bolaños Félix Marco Antonio. \n"
				+ " * Lachica Lugo Kevin Eduardo. \n"
				+ " * Osuna Quintana Jorge \n\n"
				+ "Materia: \n Taller de Base de Datos. \n\n"
				+ "Maestro: \n Pedro Villa Casas. \n\n"
				+ "Horario: 13:00 - 14:00";
		JTextArea texto = new JTextArea(parrafo);
		texto.setEditable(false);
		texto.setFont(new Font("Century Gothic", 0, 15));
		pantInformacion.add(texto, BorderLayout.CENTER);
		pantInformacion.setModal(true);
		pantInformacion.setVisible(true);
	}
	public static void main(String[] args) {
		new CuatroCuadras();
	}
}
