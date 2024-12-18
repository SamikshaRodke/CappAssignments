package pack.cap.module9.collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class IteratorAssignment {

    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        
        ArrayList<Integer> numbers = new ArrayList<>();

        System.out.println("How many numbers do you want to add?");
        int count = scanner.nextInt(); 

        System.out.println("Enter " + count + " numbers:");

        
        for (int i = 0; i < count; i++) {
            int number = scanner.nextInt();
            numbers.add(number); 
        }

        
        scanner.close();

        
        Iterator<Integer> iterator = numbers.iterator();

       
        System.out.println("You entered:");
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}
