package pack.cap.module6.inter;

//enter 5 sub marks, total, find %  

import java.util.Scanner;
public class OneDimentionalArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 Scanner sc = new Scanner(System.in);
	        
	        int[] marks = new int[5];
	        int total = 0;
	        float percentage;

	        System.out.println("Enter marks for 5 subjects:");
	        for (int i = 0; i < 5; i++) {
	            System.out.print("Subject " + (i + 1) + ": ");
	            marks[i] = sc.nextInt();
	            total += marks[i];
	        }

	        percentage = (float) total / 5; 

	        System.out.println("\nTotal Marks: " + total);
	        System.out.println("Percentage: " + percentage + "%");

	        sc.close();
	}

}
