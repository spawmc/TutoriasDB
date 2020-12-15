import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import java.awt.BorderLayout;
import java.awt.TextField;
import java.awt.FlowLayout;
import java.awt.event.*;

public class PanelConsulta extends JFrame {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private JTable tabla = null;
    DefaultTableModel modelo = null;
    JScrollPane desplazamiento = null;

    private JavaConnection conn = new JavaConnection();

    public PanelConsulta() {
        super("SQLConnection");
        setLayout(new BorderLayout());

        JPanel panelNorte = _crearPanelNorte();
        add(panelNorte, BorderLayout.NORTH);

        JPanel panelCentral = _crearPanelCentral();
        add(panelCentral, BorderLayout.CENTER);

        // Parametros de la ventan
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }

    /**
     * Componentes necesarios para el complemento del JPanel
     */
    private TextField NoPersonal = null;
    private TextField nombre = null;
    private TextField apellidoP = null;
    private TextField apellidoM = null;
    private TextField email = null;
    private JButton insertar = null;
    private JButton cancelar = null;

    /**
     * Constructor con todos los componentes del JPanel
     * @return JPanel
     */
    private JPanel _crearPanelNorte() {
        JPanel p = new JPanel(new BorderLayout());
        JLabel insert = new JLabel("Ingresar tutor");
        JPanel gridL = _crearBoxLayout();

        insertar = new JButton("Insertar");
        insertar.addActionListener(new escuchaIngresar());
        cancelar = new JButton("Cancelar");
        cancelar.addActionListener(new escuchaCancelar());

        JPanel butt = new JPanel();
        butt.setLayout(new FlowLayout());
        butt.add(insertar);
        butt.add(cancelar);

        add(insert, BorderLayout.NORTH);
        add(gridL, BorderLayout.CENTER);
        add(butt, BorderLayout.SOUTH);
        return p;
    }

    /**
     * Componentes en un layout tipo Box
     */
    private JPanel _crearBoxLayout() {
        JPanel p = new JPanel();
        p.setLayout(new BoxLayout(p, BoxLayout.X_AXIS));

        NoPersonal = new TextField(30);
        nombre = new TextField(30);
        apellidoP = new TextField(30);
        apellidoM = new TextField(30);
        email = new TextField(30);
        NoPersonal.setText("NoPersonal");
        nombre.setText("Nombre");
        apellidoP.setText("Apellido paterno");
        apellidoM.setText("Apellido materno");
        email.setText("Email");

        p.add(NoPersonal);
        p.add(nombre);
        p.add(apellidoP);
        p.add(apellidoM);
        p.add(email);

        return p;
    }

    /**
     * Panel central con la tabla resultado
     * @return JPanel
     */
    private JPanel _crearPanelCentral() {
        JPanel p = new JPanel(new BorderLayout());
        // Nombre de las columnas
        String[] columnas = { "nombre", "apellidoP", "apellidoM" };

        tabla = new JTable();
        modelo = new DefaultTableModel();
        desplazamiento = new JScrollPane(tabla);
        String nombre, apellidoP, apellidoM;

        modelo.setColumnIdentifiers(columnas);

        desplazamiento.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        desplazamiento.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);

        tabla.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);
        tabla.setFillsViewportHeight(true);

        tabla.setModel(modelo);

        this.getContentPane().add(desplazamiento, BorderLayout.NORTH);

        this.pack();

        //

        ResultSet resultado;
        resultado = conn.getQuery("SELECT * FROM nombreCompletoAlumno"); //Consulta
        // Se ingresan los datos a la tabla
        try {
            while (resultado.next()) {
                nombre = resultado.getString("nombre");
                apellidoP = resultado.getString("apellidoP");
                apellidoM = resultado.getString("apellidoM");

                modelo.addRow(new Object[] { nombre, apellidoP, apellidoM });
            }
        } catch (SQLException e) {
            System.out.println("Error al ejecutar consulta");
            e.printStackTrace();
        }

        add(tabla);

        return p;
    }

    /**
     * Clase para evento del boton Ingresar
     */
    public class escuchaIngresar implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            String SnP = NoPersonal.getText();
            int nP = Integer.parseInt(SnP);
            String nom = nombre.getText();
            String aP = apellidoP.getText();
            String aM = apellidoM.getText();
            String eM = email.getText();

            conn.insertTutor(nP, nom, aP, aM, eM);
            conn.runStatementInsert();

            NoPersonal.setText("NoPersonal");
            nombre.setText("Nombre");
            apellidoP.setText("Apellido paterno");
            apellidoM.setText("Apellido materno");
            email.setText("Email");
            JOptionPane.showMessageDialog(null, "Registro guardado con exito", "", JOptionPane.INFORMATION_MESSAGE);
        }

    }

    /**
     * Clase para evento del boton cancelar
     */
    public class escuchaCancelar implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            NoPersonal.setText("NoPersonal");
            nombre.setText("Nombre");
            apellidoP.setText("Apellido paterno");
            apellidoM.setText("Apellido materno");
            email.setText("Email");
        }

    }

}
