package project_atm;

import java.util.Scanner;

public class Atm {
	public static void main(String[] args) {
		int pin = 9876;
		int entPin, option, trial=3;
		System.out.println("**** WELCOME TO ATM ****");
		try (Scanner sc = new Scanner(System.in)) {
			while(true) {
				if(trial==0) {
					System.out.println("**** RUN OUT OF ATTEMPTS ****");
					System.exit(0);
				}
				System.out.print("ENTER YOUR PIN : ");
				entPin = sc.nextInt();
				System.out.println();
				if(entPin != pin) {
					System.out.println("**** WRONG PIN ****");
					System.out.println("**** TRY AGAIN ****");
					trial--;
					
				}
				if(entPin == pin) {
					break;
				}		
			}
			
			Bank bank = new Bank();
			while(true) {
				System.out.println("\n**** SELECT A OPTION ****");
				System.out.println("1.WITHDRAW");
				System.out.println("2.DEPOSIT");
				System.out.println("3.CHECK BALANCE");
				System.out.println("4.HELP LINE");
				System.out.println("5.TRANSACTION HISTORY");
				System.out.println("6.EXIT");
				System.out.print("YOUR OPTION : ");
				option = sc.nextInt();
				
				switch(option) {
					case 1:bank.withdraw();
					break;
					case 2:bank.deposit();
					break;
					case 3:bank.checkBalance();
					break;
					case 4:bank.helpLine();
					break;
					case 5:bank.transactionHistory();
					break;
					case 6:
						System.out.println("**** THANK YOU FOR USING ATM ****");
						System.exit(0);
					break;
					default:System.out.println("**** INVALID OPTION ****\n");
				}
			}
		}
		
	}

}
