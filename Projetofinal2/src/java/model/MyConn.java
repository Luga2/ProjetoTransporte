package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConn {
        public static Connection getConnection() throws ClassNotFoundException, SQLException {
            //Criando objeto para conectar com Banco
            Connection conn;
            
            //Informando onde está o driver de conexão
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver);
            
            //Inserindo parâmetros de conexão
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/turismo",
                    "root",
                    ""
            );
            
            System.out.println("Conexão bem sucedida!");
            
            return conn;
        }
}