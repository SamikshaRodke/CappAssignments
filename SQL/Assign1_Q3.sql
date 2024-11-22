
CREATE TABLE departments (
    DEPARTMENT_ID DECIMAL(4,0) NOT NULL,
    DEPARTMENT_NAME VARCHAR(30) NOT NULL,
    MANAGER_ID DECIMAL(6,0) NOT NULL,
    LOCATION_ID DECIMAL(4,0),
    PRIMARY KEY (DEPARTMENT_ID, MANAGER_ID)
);

INSERT INTO departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES 
(10, 'IT', 2001, 100),
(20, 'HR', 2002, 200),
(30, 'Finance', 2003, 300);

CREATE TABLE employees (
    employee_id DECIMAL(6,0) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    commission DECIMAL(10,2),
    department_id DECIMAL(4,0) NOT NULL,
    manager_id DECIMAL(6,0),
    PRIMARY KEY (employee_id),  
    FOREIGN KEY (department_id, manager_id) REFERENCES departments(DEPARTMENT_ID, MANAGER_ID)
);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission, department_id, manager_id)
VALUES 
(1001, 'John', 'Doe', 'johndoe@email.com', '123-456-7890', '2024-11-21', 'IT_PROG', 55000.00, 5000.00, 10, 2001);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission, department_id, manager_id)
VALUES 
(1002, 'Jane', 'Smith', 'janesmith@email.com', '987-654-3210', '2024-11-22', 'HR_REP', 48000.00, 4000.00, 20, 2002);


SELECT * FROM employees;



