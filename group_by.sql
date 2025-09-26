CREATE DATABASE group_by;
USE group_by;

CREATE TABLE employee(
	-- id INT AUTO_INCREMENT PRIMARY KEY,
    -- name VARCHAR(40),
    -- department VARCHAR(50),
    -- salary INT NOT NULL
);

INSERT INTO employee(name, department, salary) VALUES
("Akash Dodeja", "Engineering", 23000),
("Meera Nair", "Engineering", 24500),
("Ravi Menon", "Engineering", 25200),
("Kiran Patel", "Engineering", 24000),
("Asha Verma", "Engineering", 23800),
("Neha Singh", "Engineering", 25000),
("Suresh Iyer", "Engineering", 24200),
("Vikram Rao", "Engineering", 23500),
("Pooja Desai", "Engineering", 24800),
("Rahul Bhat", "Engineering", 24100),

("Anil Kapoor", "HR", 18000),
("Sunita Jain", "HR", 19000),
("Vishal Malhotra", "HR", 18500),
("Priya Mehta", "HR", 19500),
("Amit Sinha", "HR", 20000),

("Kavita Roy", "Sales", 21000),
("Manish Gupta", "Sales", 22000),
("Rohit Sharma", "Sales", 21500),
("Sneha Kulkarni", "Sales", 22500),
("Gaurav Chawla", "Sales", 21800),

("Isha Reddy", "Marketing", 23000),
("Kunal Joshi", "Marketing", 24000),
("Ramesh Das", "Marketing", 23500),
("Tanya Agarwal", "Marketing", 24500),
("Harish Puri", "Marketing", 23800),

("Deepa Nair", "Finance", 26000),
("Sanjay Ghosh", "Finance", 27000),
("Aarti Kulkarni", "Finance", 26500),
("Nikhil Jain", "Finance", 27500),
("Farhan Khan", "Finance", 26800),

("Sonia D'Souza", "Support", 18500),
("Aditya Rao", "Support", 19000),
("Chitra Menon", "Support", 19500),
("Rajat Kapoor", "Support", 20000),
("Parul Mehra", "Support", 20500),

("Lokesh Yadav", "Engineering", 24500),
("Bhavna Shah", "Engineering", 25200),
("Irfan Khan", "Engineering", 24800),
("Shalini Mishra", "Engineering", 25500),
("Rohan Das", "Engineering", 24000),

("Mahesh Patil", "HR", 19500),
("Siddhi Chawla", "HR", 20000),
("Vivek Iyer", "HR", 18500),
("Ananya Sen", "HR", 19000),
("Prashant Reddy", "HR", 19800),

("Kapil Dev", "Sales", 22000),
("Nandini Roy", "Sales", 23000),
("Abhishek Jain", "Sales", 22500),
("Shruti Malhotra", "Sales", 23500),
("Rajeev Saxena", "Sales", 21800);

SELECT department, COUNT(*) AS total_employees FROM employee
GROUP BY(department); 

SELECT department, AVG(salary) AS avg_salary FROM employee GROUP BY(department);

ALTER TABLE employee ADD COLUMN job_title VARCHAR(50) UNIQUE;

ALTER TABLE employee MODIFY COLUMN job_title VARCHAR(50);

ALTER TABLE employee DROP INDEX job_title;

INSERT INTO employee (job_title) VALUES
("Electrical"),
("Civil"),
("Mechanical"),
("Computer Science"),
("Electronics"),
("Chemical"),
("Biomedical"),
("Aerospace"),
("Automobile"),
("Industrial"),
("Environmental"),
("Petroleum"),
("Marine"),
("Metallurgical"),
("Software Engineer"),
("Data Analyst"),
("Network Engineer"),
("Database Administrator"),
("Cloud Engineer"),
("AI Engineer"),
("Machine Learning Engineer"),
("Robotics Engineer"),
("Systems Analyst"),
("DevOps Engineer"),
("UI/UX Designer"),
("Frontend Developer"),
("Backend Developer"),
("Full Stack Developer"),
("Security Analyst"),
("Game Developer"),
("Mobile App Developer"),
("QA Engineer"),
("Project Manager"),
("Product Manager"),
("Business Analyst"),
("Technical Writer"),
("Research Scientist"),
("Hardware Engineer"),
("Site Engineer"),
("Structural Engineer"),
("Electrical"),
("Civil"),
("Mechanical"),
("Electronics"),
("Chemical"),
("Software Engineer"),
("Data Analyst"),
("Network Engineer"),
("Cloud Engineer"),
("AI Engineer");

DELETE FROM employee WHERE id > 50;
SELECT * FROM employee;

CREATE TABLE job_titles(
	employee_id INT,
    job_title VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

INSERT INTO job_titles (employee_id, job_title) VALUES
(1, "Electrical"),
(2, "Civil"),
(3, "Mechanical"),
(4, "Computer Science"),
(5, "Electronics"),
(6, "Chemical"),
(7, "Biomedical"),
(8, "Aerospace"),
(9, "Automobile"),
(10, "Industrial"),
(11, "Environmental"),
(12, "Petroleum"),
(13, "Marine"),
(14, "Metallurgical"),
(15, "Software Engineer"),
(16, "Data Analyst"),
(17, "Network Engineer"),
(18, "Database Administrator"),
(19, "Cloud Engineer"),
(20, "AI Engineer"),
(21, "Machine Learning Engineer"),
(22, "Robotics Engineer"),
(23, "Systems Analyst"),
(24, "DevOps Engineer"),
(25, "UI/UX Designer"),
(26, "Frontend Developer"),
(27, "Backend Developer"),
(28, "Full Stack Developer"),
(29, "Security Analyst"),
(30, "Game Developer"),
(31, "Mobile App Developer"),
(32, "QA Engineer"),
(33, "Project Manager"),
(34, "Product Manager"),
(35, "Business Analyst"),
(36, "Technical Writer"),
(37, "Research Scientist"),
(38, "Hardware Engineer"),
(39, "Site Engineer"),
(40, "Structural Engineer"),
(41, "Electrical"),
(42, "Civil"),
(43, "Mechanical"),
(44, "Electronics"),
(45, "Chemical"),
(46, "Software Engineer"),
(47, "Data Analyst"),
(48, "Network Engineer"),
(49, "Cloud Engineer"),
(50, "AI Engineer");

CREATE TABLE employee_with_titles AS
SELECT employee.id, employee.name, employee.department, employee.salary, 
job_titles.job_title 
FROM employee INNER JOIN job_titles ON
employee.id = job_titles.employee_id;

SELECT department, job_title, COUNT(*) AS count
FROM employee_with_titles
GROUP BY department, job_title;

SELECT department, COUNT(*) AS employee_count FROM employee_with_titles
GROUP BY(department) HAVING COUNT(*) > 6;

SELECT department, AVG(salary) AS avg_salary
FROM employee_with_titles
GROUP BY department
HAVING AVG(salary) > 15000;

SELECT department, SUM(salary) as total
FROM employee_with_titles
GROUP BY department
WITH ROLLUP;

SELECT * FROM employee_with_titles;
