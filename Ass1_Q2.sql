CREATE TABLE job_history (
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (employee_id, start_date), 
    FOREIGN KEY (job_id) REFERENCES jobs (JOB_ID) 
   
);

CREATE TABLE jobs(
       JOB_ID VARCHAR(10) NOT NULL PRIMARY KEY,
        JOB_TITLE VARCHAR(10) NOT NULL,
    MIN_SALARY DECIMAL(6,0) ,
    MAX_SALARY DECIMAL(6,0) 
);




INSERT INTO jobs(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
VALUES 
( 'IT_PROG','ANALYST', 50000, 100000),
('HR_REP','CONSULTENT', 20444, 39999),
( 'FI_MGR','MANAGER' ,300000,700000);

INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
VALUES 
(101, '2020-01-01', '2022-01-01', 'IT_PROG', 10),
(102, '2019-06-01', '2021-06-01', 'HR_REP', 20),
(103, '2021-01-15', '2023-01-15', 'FI_MGR', 30);


select * from job_history;
