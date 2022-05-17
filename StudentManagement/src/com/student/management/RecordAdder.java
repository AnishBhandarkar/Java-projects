package com.student.management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RecordAdder {
	public static boolean insertStudentToDB(Student student) {
		boolean flag = false;
		try {
			//JDBC Code
			Connection con = ConnectionProvider.createConnection();
			String query = "insert into Student(sname, sphno, scity) values (?, ?, ?)";
			
			//PreparedStatement
			PreparedStatement pstmt = con.prepareStatement(query);
			
			//Set the value of parameters
			pstmt.setString(1, student.getStudentName());
			pstmt.setString(2, student.getStudentPhno());
			pstmt.setString(3, student.getStudentCity());
			
			//Execute
			pstmt.executeUpdate();
			
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static boolean deleteStudentFromDB(int sid) {
		boolean flag = false;
		try {
			//JDBC Code
			Connection con = ConnectionProvider.createConnection();
			String query = "delete from Student where sid=?";
			
			//PreparedStatement
			PreparedStatement pstmt = con.prepareStatement(query);
			
			//Set the value of parameters
			pstmt.setInt(1, sid);
			
			//Execute
			pstmt.executeUpdate(); //Returns number of rows updated
			
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static boolean updateStudentNameFromDB(int sid, String sname) {
		boolean flag = false;
		try {
			//JDBC Code
			Connection con = ConnectionProvider.createConnection();
			String query = "update Student set sname= ? where sid=?";
			
			//PreparedStatement
			PreparedStatement pstmt = con.prepareStatement(query);
			
			//Set the value of parameters
			pstmt.setString(1, sname);
			pstmt.setInt(2, sid);
			
			//Execute
			pstmt.executeUpdate(); //Returns int
			
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static boolean updateStudentPhnoFromDB(int sid, String sphno) {
		boolean flag = false;
		try {
			Connection con = ConnectionProvider.createConnection();
			String query = "update Student set sphno= ? where sid=?";
			
			//PreparedStatement
			PreparedStatement pstmt = con.prepareStatement(query);
			
			//Set the value of parameters
			pstmt.setString(1, sphno);
			pstmt.setInt(2, sid);
			
			//Execute
			pstmt.executeUpdate(); //Returns int
			
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static boolean updateStudentCityFromDB(int sid, String scity) {
		boolean flag = false;
		try {
			Connection con = ConnectionProvider.createConnection();
			String query = "update Student set scity= ? where sid=?";
			
			//PreparedStatement
			PreparedStatement pstmt = con.prepareStatement(query);
			
			//Set the value of parameters
			pstmt.setString(1, scity);
			pstmt.setInt(2, sid);
			
			//Execute
			pstmt.executeUpdate(); //Returns int
			
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static void showAllStudentFromDB() {
		try {
			//JDBC Code
			Connection con = ConnectionProvider.createConnection();
			String query = "select * from student";
			
			//PreparedStatement
			PreparedStatement pstmt = con.prepareStatement(query);
			
			//Execute
			ResultSet set= pstmt.executeQuery();//returns Resultset
			
			//Checking whether set is empty or not
			if(!set.isBeforeFirst()) {
				System.out.println("No records are there...");
			}
			
			System.out.println("*****************************************");
			while(set.next()) {
				int id = set.getInt(1);
				String name = set.getString(2);
				String phno = set.getString(3);
				String city = set.getString(4);
				System.out.println("-----------------------------------------");
				System.out.println("ID : "+id);
				System.out.println("Name : "+name);
				System.out.println("Phone : "+phno);
				System.out.println("City : "+city);
				System.out.println("-----------------------------------------");
			}
			System.out.println("*****************************************");
			System.out.println();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void showStudentFromSameCity() {
		try {
			//JDBC Code
			Connection con = ConnectionProvider.createConnection();
			String query = "select sid, sname, scity from student where scity in(select scity from student group by "
					+ "scity having count(*)>1)";
			
			//PreparedStatement
			PreparedStatement pstmt = con.prepareStatement(query);
			
			//Execute
			ResultSet set= pstmt.executeQuery();//returns Resultset
			
			//Checking whether set is empty or not
			if(!set.isBeforeFirst()) {
				System.out.println("No records are there...");
			}
			
			System.out.println("*****************************************");
			while(set.next()) {
				int id = set.getInt(1);
				String name = set.getString(2);
				String city = set.getString(3);
				System.out.println("-----------------------------------------");
				System.out.println("ID : "+id);
				System.out.println("Name : "+name);
				System.out.println("City : "+city);
				System.out.println("-----------------------------------------");
			}
			System.out.println("*****************************************");
			System.out.println();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	

	
}
