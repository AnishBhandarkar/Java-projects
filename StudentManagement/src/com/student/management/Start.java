package com.student.management;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Start {
	public static void main(String[] args) throws NumberFormatException, IOException {
		System.out.println("Welcome to Student Management Application");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int choice;
		while(true) {
			System.out.println("*****************************************");
			System.out.println("PRESS 1 to ADD student");
			System.out.println("PRESS 2 to DELETE student");
			System.out.println("PRESS 3 to DISPLAY student");
			System.out.println("PRESS 4 to UPDATE student");
			System.out.println("PRESS 5 to display students of same city");
			System.out.println("PRESS 6 to EXIT");
			System.out.println("*****************************************");
			System.out.println();
			System.out.print("Enter your choice :");
			choice = Integer.parseInt(br.readLine());
			
			if(choice == 1) {
				//ADD Student...
				System.out.print("Enter Student name :");
				String name = br.readLine();
				
				System.out.print("Enter Student phone number :");
				String phno = br.readLine();
				
				System.out.print("Enter Student city :");
				String city = br.readLine();
				
				//Create Student Object to store student
				Student student = new Student(name, phno, city);
				boolean result = RecordAdder.insertStudentToDB(student);
				if(result) {
					System.out.println("Record added succesfully!!!");
				}
				else {
					System.out.println("Something went wrong...");
				}
				System.out.println(student);
				
			}
			else if(choice == 2) {
				//Delete Student...
				System.out.print("Enter Student id to delete :");
				int sid = Integer.parseInt(br.readLine());
				boolean result = RecordAdder.deleteStudentFromDB(sid);
				if(result) {
					System.out.println("Record deleted succesfully!!!");
				}
				else {
					System.out.println("Something went wrong...");
				}
				
			}
			else if(choice == 3) {
				//Display Student...
				RecordAdder.showAllStudentFromDB();
			}
			else if(choice == 4) {
				System.out.print("Enter the id for which record to be updated : ");
				int sid = Integer.parseInt(br.readLine());
				
				System.out.print("Enter the number of fields to be updated : ");
				int noOfFields = Integer.parseInt(br.readLine());
				
				if(noOfFields > 3) {
					System.out.println("There are only 3 fields...");
					continue;
				}
				
				while(noOfFields > 0) {
					System.out.println("*****************************************");
					System.out.println("1. Student Name");
					System.out.println("2. Student phone");
					System.out.println("3. Student City");
					
					System.out.print("Select the field to be updated : ");
					int fieldUpdate = Integer.parseInt(br.readLine());
					
					switch(fieldUpdate) {
					case 1:
						System.out.print("Enter Student name : ");
						String sname = br.readLine();
						boolean result = RecordAdder.updateStudentNameFromDB(sid, sname);
						if(result) {
							System.out.println("StudentName updted succesfully!!!");
						}
						else {
							System.out.println("Something went wrong...");
						}
						break;
						
					case 2:
						System.out.print("Enter Student Phone : ");
						String sphno = br.readLine();
						boolean result1 = RecordAdder.updateStudentPhnoFromDB(sid, sphno);
						if(result1) {
							System.out.println("StudentPhone updted succesfully!!!");
						}
						else {
							System.out.println("Something went wrong...");
						}
						break;
					
					case 3:
						System.out.print("Enter Student City : ");
						String scity = br.readLine();
						boolean result2 = RecordAdder.updateStudentCityFromDB(sid, scity);
						if(result2) {
							System.out.println("StudentCity updted succesfully!!!");
						}
						else {
							System.out.println("Something went wrong...");
						}
						break;
					
					default:
						System.out.println("No such field exist...");
					
					}
					noOfFields--;
				
				}
			}
			else if(choice == 5){
				RecordAdder.showStudentFromSameCity();
			}
			else if(choice == 6){
				break;
			}
			
		}
		System.out.println("Thank you for using the application !!!");
	}

}
