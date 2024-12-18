package pack.cap.module9.collection;

import java.util.ArrayList;
import java.util.Vector;

public class VectorVsArrayList {

    public static void main(String[] args) {
        Vector<String> v = new Vector<String>();
        ArrayList<String> al = new ArrayList<String>();

        System.out.println("Adding elements to Vector and ArrayList");
        v.add("Apple");
        v.add("Banana");
        v.add("Cherry");
        al.add("Apple");
        al.add("Banana");
        al.add("Cherry");

        System.out.println("Vector contents: " + v);
        System.out.println("ArrayList contents: " + al);

        System.out.println("\nRemove Banana from Vector and ArrayList");
        v.remove("Banana");
        al.remove("Banana");

        System.out.println("Vector contents after removal: " + v);
        System.out.println("ArrayList contents after removal: " + al);

        // Add more elements to exceed initial capacity
        System.out.println("\nAdding more elements to Vector and ArrayList");
        v.add("Date");
        v.add("Elderberry");
        v.add("Fig");
        v.add("Grapes");

        al.add("Date");
        al.add("Elderberry");
        al.add("Fig");
        al.add("Grapes");

        System.out.println("Vector contents after adding more elements: " + v);
        System.out.println("ArrayList contents after adding more elements: " + al);

        // Display size and capacity
        System.out.println("\nVector size: " + v.size() + ", capacity: " + v.capacity());
        System.out.println("ArrayList size: " + al.size());

        // Perform random access
        System.out.println("\nRandom access from Vector: " + v.get(2));
        System.out.println("Random access from ArrayList: " + al.get(2));

        // Update an element
        System.out.println("\nUpdating an element in Vector and ArrayList");
        v.set(2, "Coconut");
        al.set(2, "Coconut");

        // Display updated collection
        System.out.println("Updated Vector contents: " + v);
        System.out.println("Updated ArrayList contents: " + al);
    }
}
