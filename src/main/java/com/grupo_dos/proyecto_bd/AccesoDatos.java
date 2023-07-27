
package com.grupo_dos.proyecto_bd;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class AccesoDatos {
    private Connection connection;

    public AccesoDatos() {

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String uname = "inventario";
            String upass = "DBFide1";
            connection = DriverManager.getConnection(url, uname, upass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Connection getConnection(){
        return connection;
    }

//    public ResultSet executeQuery(String sql) throws SQLException {
//        PreparedStatement statement = connection.prepareCall(sql);
//        ResultSet rs=statement.executeQuery();
//            while (rs.next()) {
//                System.out.println(rs.getString(2));
//                
//            }
//        return statement.executeQuery();
//    }
    
    public ResultSet executeQuery(String sql) throws SQLException {
        CallableStatement statement = connection.prepareCall(sql);

        // Parametro input
        //statement.setInt(1,1);

        // Parametro output
        statement.registerOutParameter(1, OracleTypes.CURSOR);

        statement.execute();

        // Resultados de output parameter
        ResultSet resultSet = ((OracleCallableStatement) statement).getCursor(1);
        
        return resultSet;
}
    
 
    
        public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
