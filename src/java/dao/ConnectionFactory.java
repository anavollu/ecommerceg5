package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    public Connection getConnection() {
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                System.out.println("Driver não encontrado!"+e);
            }
            return DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-02.cleardb.net/heroku_1cca26230913629?reconnect=true", "b198d38552d2ca", "396c62d9");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}