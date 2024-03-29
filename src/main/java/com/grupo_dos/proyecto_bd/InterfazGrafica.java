package com.grupo_dos.proyecto_bd;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class InterfazGrafica {

    private AccesoDatos dataAccessLayer;
    private JFrame frame;
    private JTabbedPane tabbedPane;
    private String rol;

    public InterfazGrafica(AccesoDatos dataAccessLayer, String rol) {
        this.dataAccessLayer = dataAccessLayer;
        this.rol = rol;

        frame = new JFrame("INVENTARIO Application");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.setLayout(new BorderLayout());

        tabbedPane = new JTabbedPane();

        // Basado en el rol de usuario
        if (rol.equals("CRUD")) {
            crudTabs();
        } else if (rol.equals("READ")) {
            readTabs();
        } else {
            // Otros permisos o caso default
            //addDefaultTabs();
        }

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

                try {
                    CallableStatement statement = dataAccessLayer.getConnection().prepareCall(sql);
                    //Configura los parametros del procedimiento
                    statement.setInt(personalIDPersonalTextField.getText(), 1);
                    statement.setInt(personalNombreTextField.getText(), 2);
                    statement.setInt(personalTelefonoTextField.getText(), 3);
                    statement.setInt(personalCorreoTextField.getText(), 4);
                    statement.setInt(personalIdDepartamentoTextField.getText(), 5);

                    statement.execute();

                    JOptionPane.showMessageDialog(null, "El Personal se actualizo satisfactoriamente");

                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
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
            System.out.println(sql);
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
            String errorMessage = "Error";

            if (e.getMessage() != null && !e.getMessage().isEmpty()) {
                if (e.getMessage().contains("unique constraint")) {
                    errorMessage = "Los datos ingresados ya existen en la base de datos.";
                } else if (e.getMessage().contains("numeric or value error")) {
                    errorMessage = "Error en los datos ingresados, caracteres no se pueden convertir a número";
                }
                // Otros errores
            }

            JOptionPane.showMessageDialog(null, errorMessage, "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void crudTabs() {
//        JPanel createPanel = createPanel();
//        tabbedPane.addTab("Create", createPanel);
//
//        JPanel readPanel = readPanel();
//        tabbedPane.addTab("Read", readPanel);
//
//        JPanel updatePanel = updatePanel();
//        tabbedPane.addTab("Update", updatePanel);
//
//        JPanel deletePanel = deletePanel();
//        tabbedPane.addTab("Delete", deletePanel);

        JTabbedPane createSubTabs = createSubTabsForCreate();
        tabbedPane.addTab("Create", createSubTabs);

        JTabbedPane readSubTabs = createSubTabsForRead();
        tabbedPane.addTab("Read", readSubTabs);

        JTabbedPane updateSubTabs = createSubTabsForUpdate();
        tabbedPane.addTab("Update", updateSubTabs);

        JTabbedPane deleteSubTabs = createSubTabsForDelete();
        tabbedPane.addTab("Delete", deleteSubTabs);

    }

    private void readTabs() {
        JTabbedPane readSubTabs = createSubTabsForRead();
        tabbedPane.addTab("Read", readSubTabs);
    }

    private JTabbedPane createSubTabsForCreate() {
        JTabbedPane subTabbedPane = new JTabbedPane();

        String sql = "{CALL INVENTARIO_MGMT_UI_PKG.obtener_nombres_tablas_prc(?)}";
        fetchTables(sql, subTabbedPane, "Create");

        return subTabbedPane;
    }

    private JTabbedPane createSubTabsForRead() {
        JTabbedPane subTabbedPane = new JTabbedPane();

        String sql = "{CALL INVENTARIO_MGMT_UI_PKG.obtener_nombres_tablas_prc(?)}";
        fetchTables(sql, subTabbedPane, "Read");

        return subTabbedPane;
    }

    private JTabbedPane createSubTabsForUpdate() {
        JTabbedPane subTabbedPane = new JTabbedPane();

        String sql = "{CALL INVENTARIO_MGMT_UI_PKG.obtener_nombres_tablas_prc(?)}";
        fetchTables(sql, subTabbedPane, "Update");

        return subTabbedPane;
    }

    private JTabbedPane createSubTabsForDelete() {
        JTabbedPane subTabbedPane = new JTabbedPane();

        String sql = "{CALL INVENTARIO_MGMT_UI_PKG.obtener_nombres_tablas_prc(?)}";
        fetchTables(sql, subTabbedPane, "Delete");

        return subTabbedPane;
    }

    private void fetchTables(String sql, JTabbedPane subTabbedPane, String crud) {
        try {
            System.out.println(sql);
            ResultSet resultSet = dataAccessLayer.executeQuery(sql);
            while (resultSet.next()) {
                String tableName = resultSet.getString("nombre_tabla");
                JPanel subPanel = new JPanel();

                //Pasa tableName a metodo que llamar a procedure 
                if (crud.equals("Create")) {
                    createForms(tableName, subPanel);
                } else if (crud.equals("Read")) {
                    readForms(tableName, subPanel);
                } else if (crud.equals("Update")) {
                    updateForms(tableName, subPanel);
                } else if (crud.equals("Delete")) {
                    deleteForms(tableName, subPanel);
                }

                //subPanel.add(new JLabel("Tabla: " + tableName));
                subTabbedPane.addTab(tableName, subPanel);
            }

            // Cierra recursos
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e);
        }
    }

    private void createForms(String tableName, JPanel subPanel) {
        try {
            ResultSet resultSet = dataAccessLayer.executeQuery("{CALL INVENTARIO_MGMT_UI_PKG.obtener_info_columnas_prc('" + tableName + "', ?)}");
            Map<String, JComponent> inputComponentsMap = new LinkedHashMap<>();

            while (resultSet.next()) {
                String columnName = resultSet.getString("nombre_columna");
                String dataType = resultSet.getString("tipo_dato");
                int dataLength = resultSet.getInt("longitud_dato");

                JLabel label = new JLabel(columnName + ":");
                JComponent inputComponent = createInputComponent(dataType, dataLength); // Crea input basado en el tipo de dato
                //JButton button = new JButton("Submit");

                JPanel columnPanel = new JPanel(new BorderLayout());
                columnPanel.add(label, BorderLayout.NORTH);
                columnPanel.add(inputComponent, BorderLayout.CENTER);
                //columnPanel.add(button, BorderLayout.SOUTH);

                subPanel.add(columnPanel);

                inputComponentsMap.put(columnName, inputComponent);
            }
            JButton button = new JButton("Submit");
            button.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    try {
                        StringBuilder sqlBuilder = new StringBuilder("{CALL INVENTARIO_MGMT_CREAR_PKG.crear_");
                        sqlBuilder.append(tableName.toLowerCase()).append("(");

                        boolean first = true;
                        for (String columnName : inputComponentsMap.keySet()) {
                            if (!first) {
                                sqlBuilder.append(", ");
                            }
                            JComponent inputComponent = inputComponentsMap.get(columnName);
                            Object value = null;

                            if (inputComponent instanceof JTextField) {
                                String textValue = ((JTextField) inputComponent).getText();
                                // Escape para VARCHAR2 o otros string inputs
                                value = "'" + textValue.replace("'", "''") + "'";
                            } else if (inputComponent instanceof JFormattedTextField) {
                                JFormattedTextField formattedTextField = (JFormattedTextField) inputComponent;
                                Object fieldValue = formattedTextField.getValue();

                                if (fieldValue != null) {
                                    if (fieldValue instanceof Date) {
                                        //En caso de fecha
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yy");
                                        value = "TO_DATE('" + dateFormat.format((Date) fieldValue) + "', 'DD-MON-YY')";
                                    } else if (fieldValue instanceof Timestamp) {
                                        //En caso de timestamp
                                        SimpleDateFormat timestampFormat = new SimpleDateFormat("dd-MMM-yy hh.mm.ss.SSS a");
                                        value = "TO_TIMESTAMP('" + timestampFormat.format((Timestamp) fieldValue) + "', 'DD-MON-YY HH.MI.SS.FF6 AM')";
                                    }
                                }
                            }

                            sqlBuilder.append(value);
                            first = false;
                        }
                        sqlBuilder.append(", ?)}");

                        fetchData(sqlBuilder.toString(), subPanel);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            });

            subPanel.add(button);

            // Cierra recursos
            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private JComponent createInputComponent(String dataType, int dataLength) {
        JComponent inputComponent = null;

        if (dataType.equalsIgnoreCase("DATE")) {
            // Oracle DATE
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yy");
            JFormattedTextField dateField = new JFormattedTextField(dateFormat);
            dateField.setColumns(30);
            inputComponent = dateField;
        } else if (dataType.equalsIgnoreCase("TIMESTAMP")) {
            //Oracle TIMESTAMP
            SimpleDateFormat timestampFormat = new SimpleDateFormat("dd-MMM-yy hh.mm.ss.SSS a");
            JFormattedTextField timestampField = new JFormattedTextField(timestampFormat);
            timestampField.setColumns(30);
            inputComponent = timestampField;
        } else if (dataType.equalsIgnoreCase("NUMBER")) {
            inputComponent = new JTextField(30);
        } else if (dataType.toUpperCase().startsWith("VARCHAR2")) {
            inputComponent = new JTextField(30);
        } else {
            inputComponent = new JTextField(30);
        }

        return inputComponent;
    }

    private void readForms(String tableName, JPanel subPanel) {
        try {
            JButton generarReporteButton = new JButton("Generar Reporte");
            generarReporteButton.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    try {
                        StringBuilder sqlBuilder = new StringBuilder("{CALL INVENTARIO_MGMT_OBTENER_PKG.obtener_");
                        sqlBuilder.append(tableName).append("(");

                        boolean first = true;
                        sqlBuilder.append("?)");

                        fetchData(sqlBuilder.toString(), subPanel);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            });

            subPanel.add(generarReporteButton);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateForms(String tableName, JPanel subPanel) {
        try {
            ResultSet resultSet = dataAccessLayer.executeQuery("{CALL INVENTARIO_MGMT_UI_PKG.obtener_info_columnas_prc('" + tableName + "', ?)}");
            Map<String, JComponent> inputComponentsMap = new LinkedHashMap<>();

            while (resultSet.next()) {
                String columnName = resultSet.getString("nombre_columna");
                String dataType = resultSet.getString("tipo_dato");
                int dataLength = resultSet.getInt("longitud_dato");

                JLabel label = new JLabel(columnName + ":");
                JComponent inputComponent = createInputComponent(dataType, dataLength); // Crea input basado en el tipo de dato
                //JButton button = new JButton("Submit");

                JPanel columnPanel = new JPanel(new BorderLayout());
                columnPanel.add(label, BorderLayout.NORTH);
                columnPanel.add(inputComponent, BorderLayout.CENTER);
                //columnPanel.add(button, BorderLayout.SOUTH);

                subPanel.add(columnPanel);

                inputComponentsMap.put(columnName, inputComponent);
            }
            JButton button = new JButton("Submit");
            button.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    try {
                        StringBuilder sqlBuilder = new StringBuilder("{CALL INVENTARIO_MGMT_ACTUALIZAR_PKG.actualizar_");
                        sqlBuilder.append(tableName.toLowerCase()).append("(");

                        boolean first = true;
                        for (String columnName : inputComponentsMap.keySet()) {
                            if (!first) {
                                sqlBuilder.append(", ");
                            }
                            JComponent inputComponent = inputComponentsMap.get(columnName);
                            Object value = null;

                            if (inputComponent instanceof JTextField) {
                                String textValue = ((JTextField) inputComponent).getText();
                                // Escape para VARCHAR2 or otros string inputs
                                value = "'" + textValue.replace("'", "''") + "'";
                            } else if (inputComponent instanceof JFormattedTextField) {
                                JFormattedTextField formattedTextField = (JFormattedTextField) inputComponent;
                                Object fieldValue = formattedTextField.getValue();

                                if (fieldValue != null) {
                                    if (fieldValue instanceof Date) {
                                        //En caso de fecha
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yy");
                                        value = "TO_DATE('" + dateFormat.format((Date) fieldValue) + "', 'DD-MON-YY')";
                                    } else if (fieldValue instanceof Timestamp) {
                                        //En caso de timestamp
                                        SimpleDateFormat timestampFormat = new SimpleDateFormat("dd-MMM-yy hh.mm.ss.SSS a");
                                        value = "TO_TIMESTAMP('" + timestampFormat.format((Timestamp) fieldValue) + "', 'DD-MON-YY HH.MI.SS.FF6 AM')";
                                    }
                                }
                            }

                            sqlBuilder.append(value);
                            first = false;
                        }
                        sqlBuilder.append(", ?)}");

                        fetchData(sqlBuilder.toString(), subPanel);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            });

            subPanel.add(button);

            // Cierra recursos
            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteForms(String tableName, JPanel subPanel) {
        try {
            ResultSet resultSet = dataAccessLayer.executeQuery("{CALL INVENTARIO_MGMT_UI_PKG.obtener_info_columnas_prc('" + tableName + "', ?)}");
            Map<String, JComponent> inputComponentsMap = new LinkedHashMap<>();

            while (resultSet.next()) {
                String columnName = resultSet.getString("nombre_columna");
                String dataType = resultSet.getString("tipo_dato");
                int dataLength = resultSet.getInt("longitud_dato");

                JLabel label = new JLabel(columnName + ":");
                JComponent inputComponent = createInputComponent(dataType, dataLength); // Crea input basado en el tipo de dato
                //JButton button = new JButton("Submit");

                JPanel columnPanel = new JPanel(new BorderLayout());
                columnPanel.add(label, BorderLayout.NORTH);
                columnPanel.add(inputComponent, BorderLayout.CENTER);
                //columnPanel.add(button, BorderLayout.SOUTH);

                subPanel.add(columnPanel);

                inputComponentsMap.put(columnName, inputComponent);
            }
            JButton button = new JButton("Eliminar");
            button.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    try {
                        StringBuilder sqlBuilder = new StringBuilder("{CALL INVENTARIO_MGMT_ELIMINAR_PKG.eliminar_");
                        sqlBuilder.append(tableName.toLowerCase()).append("(");

                        boolean first = true;
                        for (String columnName : inputComponentsMap.keySet()) {
                            //Solo para ID primary
                            if (tableName.toLowerCase().startsWith(columnName.toLowerCase().replace("id_", ""))) {
                                if (!first) {
                                    sqlBuilder.append(", ");
                                }
                                JComponent inputComponent = inputComponentsMap.get(columnName);
                                Object value = null;

                                if (inputComponent instanceof JTextField) {
                                    String textValue = ((JTextField) inputComponent).getText();
                                    // Escape para VARCHAR2 or otros string inputs
                                    value = "'" + textValue.replace("'", "''") + "'";
                                } else if (inputComponent instanceof JFormattedTextField) {
                                    JFormattedTextField formattedTextField = (JFormattedTextField) inputComponent;
                                    Object fieldValue = formattedTextField.getValue();

                                    if (fieldValue != null) {
                                        if (fieldValue instanceof Date) {
                                            //En caso de fecha
                                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yy");
                                            value = "TO_DATE('" + dateFormat.format((Date) fieldValue) + "', 'DD-MON-YY')";
                                        } else if (fieldValue instanceof Timestamp) {
                                            //En caso de timestamp
                                            SimpleDateFormat timestampFormat = new SimpleDateFormat("dd-MMM-yy hh.mm.ss.SSS a");
                                            value = "TO_TIMESTAMP('" + timestampFormat.format((Timestamp) fieldValue) + "', 'DD-MON-YY HH.MI.SS.FF6 AM')";
                                        }
                                    }
                                }

                                sqlBuilder.append(value);
                                first = false;
                            }
                        }
                        sqlBuilder.append(", ?)}");

                        fetchData(sqlBuilder.toString(), subPanel);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            });

            subPanel.add(button);

            // Cierra recursos
            resultSet.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
