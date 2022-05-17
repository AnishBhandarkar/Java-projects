package com.student.management;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionProvider {
	static Connection conn;
	
	public static Connection createConnection() {
		try {
			//Step 1: Load the driver
			Class.forName("com.mysql.cj.jdbc.Driver"); //It is name of jdbc driver 
			
			//Step 2: Create connection
			String user = "root";
			String password = "8#danish?63M";
			String url = "jdbc:mysql://localhost:3306/student_management";
			conn = DriverManager.getConnection(url, user, password);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}
}
