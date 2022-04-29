package project_atm;

import java.util.*;
import java.awt.Desktop;
import java.io.*;
import java.net.URI;

public class Bank {
	private double balanceAmount = 0;
	void withdraw() {
		if(balanceAmount == 0){
			System.out.println("**** ZERO BALANCE IN YOUR ACCOUNT ****\n");
		}
		else {
			System.out.print("ENTER THE WITHDRAWL AMOUNT :₹");
			try (Scanner sc = new Scanner(System.in)) {
				double withdrawalAmount = sc.nextDouble();
				if(withdrawalAmount > balanceAmount) {
					System.out.println("**** NOT ENOUGH BALANCE IN YOUR ACCOUNT ****\n");
				}
				else {
					balanceAmount -= withdrawalAmount;
					System.out.println("**** TRANSACTION SUCCESSFUL ****\n");
					Date date = new Date();
					String strDate = date.toString();
					try {
						FileWriter fw = new FileWriter("Transactionrecords.txt", true);
						@SuppressWarnings("unused")
						BufferedWriter br = new BufferedWriter(fw);
						fw.write(strDate);
						fw.write("    ");
						fw.write((int) withdrawalAmount);
						fw.write("\n");
						fw.close();
					}
					catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	void deposit() {
		System.out.print("ENTER THE AMOUNT TO BE DEPOSITED :₹");
		try (Scanner sc = new Scanner(System.in)) {
			double depositAmount = sc.nextDouble();
			balanceAmount += depositAmount;
		}
		System.out.println("**** DEPOSITION SUCCESSFUL ****\n");
	}
	
	void checkBalance() {
		System.out.println("**** THE CURRENT BALANCE IS ₹"+balanceAmount+" ****\n");
	}
	
	void helpLine() {
		try {
			Desktop desk = Desktop.getDesktop();
			desk.browse(new URI("https://www.bankbazaar.com/personal-loan-customer-care.html"));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void transactionHistory() {
		try {
			FileReader fr = new FileReader("Transactionrecords.txt");
			try (BufferedReader br = new BufferedReader(fr)) {
				String line = br.readLine();
				while(line != null) {
					System.out.println("Details are: "+line);
					line = br.readLine();
				}
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
