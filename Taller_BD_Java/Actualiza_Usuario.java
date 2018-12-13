package Taller_BD;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class Actualiza_Usuario extends JPanel implements ActionListener{
	private JLabel[] eti=new JLabel[6];
	private JTextField[] text = new JTextField[6];
	private JButton Actualizar,limpiar,checar;
	public Actualiza_Usuario(){
		Inicializacion();
		hazInterfaz();
		hazEscuchas();
	}
	public void Inicializacion(){
		eti[0]=new JLabel("ID: ");
		eti[1]=new JLabel("Email: ");
		eti[2]=new JLabel("Nombre: ");
		eti[3]=new JLabel("Nombre de Usuario: ");
		eti[4]=new JLabel("Contraseña: ");
		eti[5]=new JLabel("Ciudad de residencia: ");
		text[0]=new JTextField(15);
		for(int i=1; i<text.length;i++){
			text[i]=new JTextField(15);
			text[i].setEnabled(false);
		}
		Actualizar=new JButton("Actualizar");
		checar=new JButton("Checar");
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
		checar.setBounds(570, 10, 80, 30);
		Actualizar.setBounds(390, 280, 110, 40);
		limpiar.setBounds(190, 280, 110, 40);
		add(checar);
		add(Actualizar);
		add(limpiar);
	}
	public void hazEscuchas(){
		checar.addActionListener(this);
		Actualizar.addActionListener(this);
		limpiar.addActionListener(this);
	}
	public void actionPerformed(ActionEvent Evt) {
		if(Evt.getSource()==checar){
			return;
		}
		if(Evt.getSource()==Actualizar){
			return;
		}
	}
}
