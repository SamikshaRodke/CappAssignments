package pack.cap.module6.inter;

import java.util.Scanner;

public class OneDArrDemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter the number of employees : ");
		int numEmp = sc.nextInt();
		
		double[] salaries = new double[numEmp];
		
		for(int i = 0 ; i<numEmp ;i++) {
			System.out.println("Enter the salary for Employee ID "+(i+1)+": ");
			salaries[i] = sc.nextDouble();
		}
			// Process each employee's salary
	        for (int i = 0; i < salaries.length; i++) {
	            System.out.println("\nEmployee ID: " + (i + 1));
	            double currentSalary = salaries[i];
	            System.out.println("Current Salary: " + currentSalary);

	            // Salary Increment
	            if (currentSalary >= 30000) {
	                currentSalary += currentSalary * 0.10;
	                System.out.println("10% Salary Increment applied.");
	            }

	            // Bonus
	            if (salaries[i] == 20000) {
	                currentSalary += 2000;
	                System.out.println("Bonus of 2000 applied.");
	            }

	            // Salary Improvement Advice
	            if (salaries[i] < 15000) {
	                System.out.println("Advice: Improve your work to get a higher salary.");
	            }

	            // Additional Allowances
	            double hra = currentSalary * 0.10; // House Rent Allowance
	            double ta = currentSalary * 0.05;  // Travel Allowance
	            double da = currentSalary * 0.08;  // Dearness Allowance

	            currentSalary += hra + ta + da;

	            System.out.println("House Rent Allowance (HRA): " + hra);
	            System.out.println("Travel Allowance (TA): " + ta);
	            System.out.println("Dearness Allowance (DA): " + da);
	            System.out.println("Final Salary: " + currentSalary);
	            System.out.println("-------------------------------");
	        }

	        sc.close();
	    }

}
