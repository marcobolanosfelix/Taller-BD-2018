package Taller_BD;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class Alta_Lugar extends JPanel implements ActionListener{
	private JLabel[] eti=new JLabel[5];
	private JTextField[] text = new JTextField[5];
	private JButton guardar,limpiar;
	public Alta_Lugar(){
		Inicializacion();
		hazInterfaz();
		hazEscuchas();
	}
	public void Inicializacion(){
		eti[0]=new JLabel("Nombre: ");
		eti[1]=new JLabel("Latitud: ");
		eti[2]=new JLabel("Longitud: ");
		eti[3]=new JLabel("Descripcion: ");
		eti[4]=new JLabel("Id categoria: ");
		
		for(int i=0; i<text.length;i++)
			text[i]=new JTextField(15);
		guardar=new JButton("Guardar");
		limpiar=new JButton("Limpiar");
	}
	public void hazInterfaz(){
		setSize(800,700);
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
			return;
		}
	}
}
