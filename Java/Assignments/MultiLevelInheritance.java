package pack.cap.module5.module4;

class Vehicle {
    String make, model;
    int year;

    Vehicle(String make, String model, int year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }

    void displayDetails() {
        System.out.println("Make: " + make + ", Model: " + model + ", Year: " + year);
    }
}

class Car extends Vehicle {
    String fuelType;
    int doors;

    Car(String make, String model, int year, String fuelType, int doors) {
        super(make, model, year);
        this.fuelType = fuelType;
        this.doors = doors;
    }

    void displayCarDetails() {
        displayDetails();
        System.out.println("Fuel Type: " + fuelType + ", Doors: " + doors);
    }
}

class ElectricCar extends Car {
    int batteryCapacity;

    ElectricCar(String make, String model, int year, String fuelType, int doors, int batteryCapacity) {
        super(make, model, year, fuelType, doors);
        this.batteryCapacity = batteryCapacity;
    }

    void displayElectricCarDetails() {
        displayCarDetails();
        System.out.println("Battery Capacity: " + batteryCapacity + " kWh");
    }
}


public class MultiLevelInheritance {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ElectricCar electricCar = new ElectricCar("Tesla", "Model S", 2022, "Electric", 4, 100);
        electricCar.displayElectricCarDetails();
  
	}

}
