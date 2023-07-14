package com.grupo_dos.proyecto_bd;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InterfazGrafica {
    private AccesoDatos dataAccessLayer;
    private JFrame frame;
    private JTabbedPane tabbedPane;

    public InterfazGrafica(AccesoDatos dataAccessLayer) {
        this.dataAccessLayer = dataAccessLayer;

        frame = new JFrame("INVENTARIO Application");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.setLayout(new BorderLayout());

        tabbedPane = new JTabbedPane();

        JPanel sqlPanel = createPanel();
        tabbedPane.addTab("Create", sqlPanel);

        JPanel vistasPanel = readPanel();
        tabbedPane.addTab("Read", vistasPanel);

        JPanel proceduresPanel = updatePanel();
        tabbedPane.addTab("Update", proceduresPanel);

        JPanel functionsPanel = deletePanel();
        tabbedPane.addTab("Delete", functionsPanel);

        frame.add(tabbedPane, BorderLayout.CENTER);
    }

    public void launch() {
        frame.setVisible(true);
    }

    private JPanel createPanel() {
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());

        JTextField personalNombreTextField = new JTextField();
        JButton createPersonalButton = new JButton("Crear PERSONAL");
        JTextArea resultTextArea = new JTextArea();
        resultTextArea.setEditable(false);

        createPersonalButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String sql = "{CALL procedure_create_personal('" + personalNombreTextField.getText() + "',?)}";
                fetchData(sql, panel);
            }
        });

        JPanel inputPanel = new JPanel(new BorderLayout());
        inputPanel.add(personalNombreTextField, BorderLayout.CENTER);
        inputPanel.add(createPersonalButton, BorderLayout.EAST);

        panel.add(inputPanel, BorderLayout.NORTH);
        panel.add(new JScrollPane(resultTextArea), BorderLayout.CENTER);

        return panel;
    }

private JPanel readPanel() {
    JPanel panel = new JPanel();
    panel.setLayout(new BorderLayout());

    JButton view1Button = new JButton("Detalles de Compra");
    JButton view2Button = new JButton("View 2");

    JTextArea resultTextArea = new JTextArea();
    resultTextArea.setEditable(false);

    JPanel buttonPanel = new JPanel();
    buttonPanel.add(view1Button);
    buttonPanel.add(view2Button);

    JPanel resultPanel = new JPanel(new BorderLayout());
    resultPanel.add(new JScrollPane(resultTextArea), BorderLayout.CENTER);

    panel.add(buttonPanel, BorderLayout.NORTH);
    panel.add(resultPanel, BorderLayout.CENTER);


    view1Button.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
            String sql = "{CALL procedure_read_detalle_compra(?)}";
            fetchData(sql, panel);
        }
    });

    view2Button.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
            String sql = "{CALL procedure_read_personal(?)}";
            fetchData(sql, panel);
        }
    });


    return panel;
}

private JPanel updatePanel() {
    JPanel panel = new JPanel();
    panel.setLayout(new BorderLayout());

    JTextField personalIDPersonalTextField = new JTextField();
    JTextField personalNombreTextField = new JTextField();
    JTextField personalTelefonoTextField = new JTextField();
    JTextField personalCorreoTextField = new JTextField();
    JTextField personalIdDepartamentoTextField = new JTextField();

    JButton updatePersonalButton = new JButton("Actualizar personal");

    JTextArea resultTextArea = new JTextArea();
    resultTextArea.setEditable(false);

    JPanel inputPanel = new JPanel(new GridLayout(5, 2));
    inputPanel.add(new JLabel("ID:"));
    inputPanel.add(personalIDPersonalTextField);
    inputPanel.add(new JLabel("Nombre:"));
    inputPanel.add(personalNombreTextField);
    inputPanel.add(new JLabel("Teléfono:"));
    inputPanel.add(personalTelefonoTextField);
    inputPanel.add(new JLabel("Correo:"));
    inputPanel.add(personalCorreoTextField);
    inputPanel.add(new JLabel("Departamento:"));
    inputPanel.add(personalIdDepartamentoTextField);

    JPanel buttonPanel = new JPanel();
    buttonPanel.add(updatePersonalButton);

    JPanel resultPanel = new JPanel(new BorderLayout());
    resultPanel.add(new JScrollPane(resultTextArea), BorderLayout.CENTER);

    panel.add(inputPanel, BorderLayout.NORTH);
    panel.add(buttonPanel, BorderLayout.CENTER);
    panel.add(resultPanel, BorderLayout.SOUTH);

    updatePersonalButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
            String sql = "{CALL procedure_update_personal(" + personalIDPersonalTextField.getText() + ", '" + personalNombreTextField.getText() + "', '" + personalTelefonoTextField.getText() + "', '" + personalCorreoTextField.getText() + "', " + personalIdDepartamentoTextField.getText() + ", ?)}";
            fetchData(sql, panel);
        }
    });

    return panel;
}


private JPanel deletePanel() {
    JPanel panel = new JPanel();
    panel.setLayout(new BorderLayout());

    JTextField personalIdTextField = new JTextField();
    JButton deletePersonalButton = new JButton("Eliminar Personal");
    JTextArea resultTextArea = new JTextArea();
    resultTextArea.setEditable(false);

    deletePersonalButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
            String sql = "{CALL procedure_delete_personal(" + personalIdTextField.getText() + ", ?)}";
            fetchData(sql, panel);
        }
    });

    JPanel inputPanel = new JPanel(new BorderLayout());
    inputPanel.add(new JLabel("ID Personal:"), BorderLayout.WEST);
    inputPanel.add(personalIdTextField, BorderLayout.CENTER);
    inputPanel.add(deletePersonalButton, BorderLayout.EAST);

    panel.add(inputPanel, BorderLayout.NORTH);
    panel.add(new JScrollPane(resultTextArea), BorderLayout.CENTER);

    return panel;
}


private void fetchData(String sql, JPanel resultPanel) {
    try {
        ResultSet resultSet = dataAccessLayer.executeQuery(sql);

        int columnCount = resultSet.getMetaData().getColumnCount();
        String[] columnNames = new String[columnCount];
        for (int i = 1; i <= columnCount; i++) {
            columnNames[i - 1] = resultSet.getMetaData().getColumnName(i);
        }

        DefaultTableModel tableModel = new DefaultTableModel(columnNames, 0);


        while (resultSet.next()) {
            Object[] rowData = new Object[columnCount];
            for (int i = 1; i <= columnCount; i++) {
                rowData[i - 1] = resultSet.getString(i);
            }
            tableModel.addRow(rowData);
        }


        JTable table = new JTable(tableModel);


        JScrollPane scrollPane = new JScrollPane(table);


        scrollPane.setAlignmentX(Component.LEFT_ALIGNMENT);
        scrollPane.setAlignmentY(Component.TOP_ALIGNMENT);

 
        resultPanel.removeAll();
        resultPanel.add(scrollPane);


        resultPanel.revalidate();
        resultPanel.repaint();

 
        resultSet.close();
        
        //Cierra Connection
        //dataAccessLayer.closeConnection();
    } catch (SQLException e) {
        e.printStackTrace();
    }
  }

}