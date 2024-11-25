	-- BankDB :
	CREATE DATABASE IF NOT EXISTS BankDB;
	USE BankDB;

	-- Accounts: AccountID  PRIMARY KEY, CustomerID , AccountType , Balance, CreatedDate , FOREIGN KEY (CustomerID) 

	-- Customers : CustomerID PRIMARY KEY, FirstName , LastName , Email , Phone , Address 

	-- TABLE Transactions:  TransactionID PRIMARY KEY, AccountID INT, TransactionType ,Amount ,TransactionDate, FOREIGN KEY (AccountID) 

	-- TABLE Branches :  BranchID  PRIMARY KEY, BranchName,Location

	--  Employees: EmployeeID PRIMARY KEY, BranchID , FirstName, LastName , Role , Salary , FOREIGN KEY (BranchID) 
-- Creating the 'customers' table with auto-increment on customerid
CREATE TABLE customers (
    customerid INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Creating the 'accounts' table with auto-increment on accountid
CREATE TABLE accounts (
    accountid INT AUTO_INCREMENT PRIMARY KEY,
    customerid INT,
    accounttype VARCHAR(50),
    balance DECIMAL(10, 2),
    createddate DATE,
    FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

-- Creating the 'transactions' table with auto-increment on transactionid
CREATE TABLE transactions (
    transactionid INT AUTO_INCREMENT PRIMARY KEY,
    accountid INT,
    transactiontype VARCHAR(50),
    amount DECIMAL(10, 2),
    transactiondate DATETIME,
    FOREIGN KEY (accountid) REFERENCES accounts(accountid)
);

-- Creating the 'branches' table with auto-increment on branchid
CREATE TABLE branches (
    branchid INT AUTO_INCREMENT PRIMARY KEY,
    branchname VARCHAR(100),
    location VARCHAR(255)
);

-- Creating the 'employees' table with auto-increment on employeeid
CREATE TABLE employees (
    employeeid INT AUTO_INCREMENT PRIMARY KEY,
    branchid INT,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    role VARCHAR(100),
    salary DECIMAL(10, 2),
    FOREIGN KEY (branchid) REFERENCES branches(branchid)
);




	INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St'), ('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak St'), ('Michael', 'Brown', 'michael.brown@example.com', '5678901234', '789 Pine St');

	INSERT INTO Accounts (CustomerID, AccountType, Balance, CreatedDate)
	VALUES
	(1, 'Savings', 5000.00, '2023-01-15'),
	(1, 'Checking', 2000.00, '2023-02-10'),
	(2, 'Savings', 10000.00, '2023-03-05'),
	(3, 'Savings', 7000.00, '2023-04-20');


	INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
	VALUES
	(1, 'Deposit', 1000.00, '2023-01-20 10:00:00'),
	(1, 'Withdrawal', 500.00, '2023-01-25 14:30:00'),
	(2, 'Deposit', 2000.00, '2023-02-15 09:15:00'),
	(3, 'Withdrawal', 1000.00, '2023-04-25 16:45:00');

	-- Insert sample data into branches table
INSERT INTO branches (branchname, location)
VALUES 
    ('Main Branch', 'New York'),
    ('Westside Branch', 'Los Angeles'),
    ('Eastside Branch', 'San Francisco');

-- Insert sample data into employees table
INSERT INTO employees (branchid, firstname, lastname, role, salary)
VALUES
    (1, 'Alice', 'Johnson', 'Manager', 80000.00),  -- Manages 'Main Branch'
    (2, 'Bob', 'Williams', 'Manager', 60000.00),  -- Manages 'Westside Branch'
    (3, 'Charlie', 'Davis', 'Manager', 75000.00);  -- Manages 'Eastside Branch'

-- Insert sample data into accounts table
-- Insert sample accounts with the customerid values that were created above
INSERT INTO accounts (customerid, accounttype, balance, createddate)
VALUES
    (1, 'Savings', 5000.00, '2023-01-15'),  -- Account for 'John Doe'
    (1, 'Checking', 7000.00, '2023-02-10'), -- Account for 'John Doe'
    (2, 'Savings', 10000.00, '2023-03-05'), -- Account for 'Jane Smith'
    (3, 'Savings', 20000.00, '2023-04-20'), -- Account for 'Michael Brown'
    (3, 'Checking', 15000.00, '2023-05-10'); -- Account for 'Michael Brown'

    -- Insert sample customers
INSERT INTO customers (firstname, lastname, email, phone, address)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St'),
    ('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak St'),
    ('Michael', 'Brown', 'michael.brown@example.com', '5678901234', '789 Pine St');


SELECT * FROM customers;

SELECT * FROM accounts;
select sum(balance) from accounts;

SELECT * FROM transactions;

SELECT * FROM branches;

SELECT * FROM employees;




-- Question: List all customers and their accounts with balances.
	SELECT c.customerid, c.firstname, c.lastname, a.accountid, a.balance
    FROM customers c
    JOIN accounts a 
    ON a.customerid = c.customerid;
    
-- Problem Statement: List all employees who manage branches where the total account balances exceed $20,000.

    SELECT e.employeeid, e.firstname, e.lastname, b.branchname, SUM(a.balance) AS total_balance
FROM employees e
JOIN branches b ON e.branchid = b.branchid
JOIN accounts a ON e.branchid = b.branchid
GROUP BY e.employeeid, e.firstname, e.lastname, b.branchname
HAVING total_balance > 20000;


SELECT e.employeeid, e.firstname, e.lastname, b.branchname, SUM(a.balance) AS total_balance
FROM employees e
JOIN branches b ON e.branchid = b.branchid
JOIN accounts a ON a.customerid IN (SELECT customerid FROM customers WHERE customerid = a.customerid) 
GROUP BY e.employeeid, e.firstname, e.lastname, b.branchname
HAVING total_balance > 20000;

SELECT e.employeeid, e.firstname, e.lastname, b.branchname, SUM(a.balance) AS total_balance
FROM employees e
JOIN branches b ON e.branchid = b.branchid
JOIN accounts a ON e.branchid = b.branchid  -- Correct relationship here
JOIN customers c ON a.customerid = c.customerid  -- Link accounts to customers via customerid
GROUP BY e.employeeid, e.firstname, e.lastname, b.branchname
HAVING total_balance > 20000;


-- Problem Statement: Identify accounts whose balance is higher than the average balance 
-- of accounts within their branch.
select * 
from accounts a 
where balance > (select avg(balance) from accounts where a.accounttype = a.accounttype);

select avg(balance) from accounts group by accounttype;

-- Problem Statement: Find customers who have at least one transaction of more than $1,000.
	SELECT distinct c.customerid, c.firstname, c.lastname, a.accountid, t.transactiontype, t.amount
    from customers c
    join accounts a on a.customerid = c.customerid
    join transactions t on t.accountid = a.accountid
    where t.amount > 1000;
    
    SELECT c.customerid, c.firstname, c.lastname, a.accountid, t.transactiontype, t.amount
    from customers c
    join accounts a on a.customerid = c.customerid
    join transactions t on t.accountid = a.accountid
    group by t.accountid
    having max(t.amount)>1000;
    
-- Problem Statement: Get the total deposits and total withdrawals for each account,
-- along with the account type.
	SELECT a.accountid, t.transactiontype, t.amount, a.accounttype
    from accounts a 
    join transactions t on t.accountid = a.accountid
    group by  a.accountid, a.accounttype, t.transactiontype;
    
    SELECT 
    a.accountid, a.accounttype, t.transactiontype, 
    SUM(t.amount) AS total_amount
	FROM accounts a
	JOIN transactions t ON t.accountid = a.accountid
	GROUP BY a.accountid, a.accounttype, t.transactiontype;

    SELECT 
    a.accountid, 
    a.accounttype, 
    SUM(CASE WHEN t.transactiontype = 'Deposit' THEN t.amount ELSE 0 END) AS total_deposit,
    SUM(CASE WHEN t.transactiontype = 'Withdrawal' THEN t.amount ELSE 0 END) AS total_withdrawal
	FROM accounts a
	JOIN transactions t ON t.accountid = a.accountid
	GROUP BY a.accountid, a.accounttype;


-- Problem Statement: Find pairs of customers who have accounts with the same 
-- account type and belong to the same branch.

	SELECT 
    c1.customerid AS customer1_id,
    c1.firstname AS customer1_firstname,
    c1.lastname AS customer1_lastname,
    c2.customerid AS customer2_id,
    c2.firstname AS customer2_firstname,
    c2.lastname AS customer2_lastname,
    a1.accounttype
FROM accounts a1
JOIN customers c1 ON a1.customerid = c1.customerid
JOIN accounts a2 ON a1.accounttype = a2.accounttype 
JOIN customers c2 ON a2.customerid = c2.customerid
WHERE c1.customerid < c2.customerid;


-- Problem Statement: Find customers who do not have any transactions recorded.

SELECT * 
FROM customers c
WHERE NOT EXISTS (
    SELECT *
    FROM accounts a
    WHERE a.customerid = c.customerid
    AND EXISTS (
        SELECT 1
        FROM transactions t
        WHERE t.accountid = a.accountid
    )
);


-- Problem Statement: Rank customers based on their total balance across all accounts.

	SELECT c.customerid, c.firstname, c.lastname, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customerid = a.customerid
GROUP BY c.customerid, c.firstname, c.lastname
ORDER BY total_balance DESC;

SELECT 
    c.customerid, 
    c.firstname, 
    c.lastname, 
    SUM(a.balance) AS total_balance,
    RANK() OVER (ORDER BY SUM(a.balance) DESC) AS rank1
FROM customers c
JOIN accounts a ON c.customerid = a.customerid
GROUP BY c.customerid, c.firstname, c.lastname;

-- Problem Statement: List employees whose salary is above the average salary of all employees in their branch.

SELECT e.employeeid, e.firstname, e.lastname, e.salary, e.branchid
FROM employees e
JOIN (
    SELECT branchid, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY branchid
) avg_salaries ON e.branchid = avg_salaries.branchid
WHERE e.salary >= avg_salaries.avg_salary;

SELECT e.employeeid, e.firstname, e.lastname, e.salary, e.branchid
FROM employees e
WHERE e.salary >= (
    SELECT AVG(salary)
    FROM employees
    WHERE branchid = e.branchid
);


-- Check average salary per branch
SELECT branchid, AVG(salary) AS avg_salary
FROM employees
GROUP BY branchid;



