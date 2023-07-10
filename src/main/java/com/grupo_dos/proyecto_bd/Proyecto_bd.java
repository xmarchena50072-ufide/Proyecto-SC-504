package com.grupo_dos.proyecto_bd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author fidelitas
 */
public class Proyecto_bd {

    public static void main(String[] args) {
//        try {
//            
//            Class.forName("oracle.jdbc.OracleDriver");
//            String url="jdbc:oracle:thin:@localhost:1521:orcl";
//            String uname="inventario";
//            String upass="DBFide1";
//            Connection conn= DriverManager.getConnection(url,uname,upass);
//            String sql="SELECT * FROM CATEGORIAS";
//            PreparedStatement pst= conn.prepareStatement(sql);
//            ResultSet rs=pst.executeReadQuery();
//            while (rs.next()) {
//                System.out.println(rs.getString(2));
//                
//            }
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e);
//        } finally {
//        }

        AccesoDatos dataAccessLayer = new AccesoDatos();

        InterfazGrafica userInterface = new InterfazGrafica(dataAccessLayer);

        userInterface.launch();
    }
}
