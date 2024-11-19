// Employee class
class Employee {
    constructor(name, id, skill, doj, department) {
        this.name = name;
        this.id = id;
        this.skill = skill;
        this.doj = new Date(doj); // Store Date of Joining as Date object
        this.department = department;
    }

    // Method to calculate the experience
    getExperience() {
        const currentDate = new Date();
        const diffTime = currentDate - this.doj;
        const experienceInYears = Math.floor(diffTime / (1000 * 60 * 60 * 24 * 365));
        return experienceInYears;
    }
}

// Array to hold all employees
let employees = [];

// Function to add an employee
function addEmployee() {
    const name = document.getElementById("name").value;
    const id = document.getElementById("id").value;
    const skill = document.getElementById("skill").value;
    const doj = document.getElementById("doj").value;
    const department = document.getElementById("department").value;

    const newEmployee = new Employee(name, id, skill, doj, department);
    employees.push(newEmployee);
    displayEmployees();
    alert("Employee added successfully!");
}

// Function to remove an employee by ID
function removeEmployee() {
    const id = document.getElementById("remove-id").value;
    const index = employees.findIndex(employee => employee.id == id);
    
    if (index !== -1) {
        employees.splice(index, 1);
        displayEmployees();
        alert("Employee removed successfully!");
    } else {
        alert("Employee not found!");
    }
}

// Function to search an employee by ID
function searchEmployee() {
    const id = document.getElementById("search-id").value;
    const employee = employees.find(employee => employee.id == id);
    
    const resultDiv = document.getElementById("search-result");
    if (employee) {
        const experience = employee.getExperience();
        resultDiv.innerHTML = `
            <p>Name: ${employee.name}</p>
            <p>ID: ${employee.id}</p>
            <p>Skill: ${employee.skill}</p>
            <p>DOJ: ${employee.doj.toDateString()}</p>
            <p>Department: ${employee.department}</p>
            <p>Experience: ${experience} years</p>
        `;
    } else {
        resultDiv.innerHTML = "Employee not found!";
    }
}

// Function to display all employees
function displayEmployees() {
    const list = document.getElementById("employee-list");
    list.innerHTML = ""; // Clear previous list
    
    employees.forEach(employee => {
        const listItem = document.createElement("li");
        listItem.textContent = `${employee.name} (ID: ${employee.id}, Department: ${employee.department})`;
        list.appendChild(listItem);
    });
}
