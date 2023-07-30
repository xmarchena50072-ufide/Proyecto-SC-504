package com.grupo_dos.proyecto_bd;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginVentana {
    private AccesoDatos dataAccessLayer;
    private JFrame frame;
    private JTextField usernameTextField;
    private JPasswordField passwordField;

    public LoginVentana(AccesoDatos dataAccessLayer) {
        this.dataAccessLayer = dataAccessLayer;

        frame = new JFrame("Login");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 150);
        frame.setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.Y_AXIS));

        JLabel usernameLabel = new JLabel("Username:");
        usernameTextField = new JTextField(20);

        JLabel passwordLabel = new JLabel("Password:");
        passwordField = new JPasswordField(20);

        JButton loginButton = new JButton("Login");
        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String username = usernameTextField.getText();
                char[] passwordChars = passwordField.getPassword();
                String password = new String(passwordChars);
                
                String sql = "{CALL verifica_login_prc('" + username + "', '" + password + "', ?)}";

                
                String loginSuccess = dataAccessLayer.verificaLogin(sql);

                if (loginSuccess.equals("true")) {
                    frame.dispose();

                    InterfazGrafica interfazGrafica = new InterfazGrafica(dataAccessLayer);
                    interfazGrafica.launch();
                } else {

                    JOptionPane.showMessageDialog(frame, "Invalido username o password.", "Login Fallido", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        JPanel panel = new JPanel();
        panel.add(usernameLabel);
        panel.add(usernameTextField);
        panel.add(passwordLabel);
        panel.add(passwordField);
        panel.add(loginButton);

        frame.add(panel);
    }

    public void launch() {
        frame.setVisible(true);
    }

}
