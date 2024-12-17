package pack.cap.module8.io;
//use bufferreader  ..take data like name, phone no, salary, etc, and pass the data to one of the file

import java.io.*;

public class BufferReaderAssignment {

    public static void main(String[] args) {
        String filePath = "C:\\Users\\srodke\\OneDrive - Capgemini\\Desktop\\java\\userData.txt";

        
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
             BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) { 
            
            System.out.println("Enter your details :");

            System.out.print("Enter Name: ");
            String name = br.readLine();

            System.out.print("Enter Phone Number: ");
            String phoneNumber = br.readLine();

            System.out.print("Enter Salary: ");
            String salary = br.readLine();

            
            bw.write("Name: " + name);
            bw.newLine();
            bw.write("Phone Number: " + phoneNumber);
            bw.newLine();
            bw.write("Salary: " + salary);
            bw.newLine();
            bw.write("-------------------------");
            bw.newLine();

            System.out.println("User details saved successfully to file: " + filePath);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
