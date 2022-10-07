
package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;

    public static Connection createConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notestaker", "root", "pass");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;

    }
}
