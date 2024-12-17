/*
 * You are tasked with processing employee salary data using Java 8 Stream operations. The data is provided as an array, and the following operations need to be performed:
Filter Employees: Find the employees whose salary is less than 40000.
Get Employees Earning More Than 75000: Identify the employees whose salary is greater than 75000.
Provide Increment for Employees: Give a 10% salary increment to those employees whose salary is around 35000 (let's assume a range of 33000 to 37000).
Calculate Average Salary: Calculate the average salary of all employees.
Calculate Company Yearly Turnover: Multiply the average salary by the number of employees to estimate the company's yearly turnover.
Arrange Data in Descending Order: Sort the employees' salaries in descending order.*/

package pack.cap.module7.inter;
import java.util.*;
class Employee {
    String name;
    double salary;
    Employee(String name, double salary) {
        this.name = name;
        this.salary = salary;
    }
    @Override
    public String toString() {
        return name + " - " + salary;
    }
}
public class StreamAssignment {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 Employee[] employees = {
		            new Employee("Lisa", 35000),
		            new Employee("Rose", 80000),
		            new Employee("Joon", 25000),
		            new Employee("JM", 90000),
		            new Employee("AgustD", 37000),
		            new Employee("Maria", 45000),
		            new Employee("V", 32000)
		        };

		        // 1. less than 40000
		        System.out.println("Employees with salary less than 40000:");
		        Arrays.stream(employees).filter(e -> e.salary < 40000).forEach(System.out::println);

		        // 2. more than 75000
		        System.out.println("\nEmployees earning more than 75000:");
		        Arrays.stream(employees).filter(e -> e.salary > 75000).forEach(System.out::println);

		        // 3. 10% increment - between 33000 and 37000
		        System.out.println("\nEmployees after 10% increment (33000-37000):");
		        Arrays.stream(employees)
		              .filter(e -> e.salary >= 33000 && e.salary <= 37000)
		              .forEach(e -> { e.salary =e.salary+ e.salary* 0.10; System.out.println(e); });

		        // 4. Average Salary
		        double avgSalary = Arrays.stream(employees).mapToDouble(e -> e.salary).average().orElse(0);
		        System.out.println("\nAverage Salary: " + avgSalary);
		        
//		        double avgSalary = Arrays.stream(employees)
//                        .map(e -> e.salary)  // Map to stream of salaries
//                        .reduce(0.0, Double::sum)  // Sum salaries
//                        / employees.length;  // Divide by number of employees


		        // 5. Turnover
		        System.out.println("Company Yearly Turnover: " + avgSalary * employees.length);

		        // 6. sort
		        System.out.println("\nEmployees sorted by salary in descending order:");
		        Arrays.stream(employees).sorted((e1, e2) -> Double.compare(e2.salary, e1.salary)).forEach(System.out::println);
	}

}
