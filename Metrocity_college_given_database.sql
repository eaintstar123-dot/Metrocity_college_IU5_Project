-- =====================================================
-- MetroCity College Record Management Database
-- =====================================================

DROP DATABASE IF EXISTS metrocity_college;
CREATE DATABASE metrocity_college;
USE metrocity_college;

-- =====================================================
-- Department Table
-- =====================================================

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO departments (department_name) VALUES
('Information Technology'),
('Business Management'),
('Engineering'),
('Accounting'),
('Hospitality');

-- =====================================================
-- Students Table
-- =====================================================

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male','Female'),
    date_of_birth DATE,
    email VARCHAR(100),
    phone VARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO students
(first_name,last_name,gender,date_of_birth,email,phone,department_id)
VALUES
('John','Smith','Male','2002-05-12','john.smith@email.com','9123456781',1),
('Emma','Brown','Female','2001-11-21','emma.brown@email.com','9123456782',2),
('Michael','Johnson','Male','2003-01-18','michael@email.com','9123456783',1),
('Sophia','Taylor','Female','2002-07-08','sophia@email.com','9123456784',3),
('Daniel','Wilson','Male','2001-09-11','daniel@email.com','9123456785',4),
('Olivia','Davis','Female','2003-02-25','olivia@email.com','9123456786',5),
('James','Thomas','Male','2002-03-15','james@email.com','9123456787',2),
('Charlotte','Moore','Female','2002-08-30','charlotte@email.com','9123456788',3),
('William','Martin','Male','2001-12-05','william@email.com','9123456789',1),
('Ava','Jackson','Female','2003-04-17','ava@email.com','9123456790',5);

-- =====================================================
-- Courses Table
-- =====================================================

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20),
    course_name VARCHAR(100),
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO courses
(course_code,course_name,credits,department_id)
VALUES
('IT101','Database Systems',4,1),
('IT102','Programming Fundamentals',4,1),
('BUS101','Business Management',3,2),
('ENG101','Engineering Mathematics',4,3),
('ACC101','Financial Accounting',3,4),
('HOS101','Hospitality Management',3,5),
('IT201','Web Development',4,1),
('BUS201','Marketing Principles',3,2);

-- =====================================================
-- Enrollment Table
-- =====================================================

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    academic_year INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

INSERT INTO enrollments
(student_id,course_id,semester,academic_year,enrollment_date)
VALUES
(1,1,'Semester 1',2026,'2026-01-10'),
(1,2,'Semester 1',2026,'2026-01-10'),
(2,3,'Semester 1',2026,'2026-01-11'),
(3,1,'Semester 1',2026,'2026-01-12'),
(3,7,'Semester 1',2026,'2026-01-12'),
(4,4,'Semester 1',2026,'2026-01-13'),
(5,5,'Semester 1',2026,'2026-01-13'),
(6,6,'Semester 1',2026,'2026-01-14'),
(7,3,'Semester 1',2026,'2026-01-14'),
(8,4,'Semester 1',2026,'2026-01-15'),
(9,2,'Semester 1',2026,'2026-01-16'),
(9,7,'Semester 1',2026,'2026-01-16'),
(10,6,'Semester 1',2026,'2026-01-17'),
(2,8,'Semester 2',2026,'2026-07-05'),
(7,8,'Semester 2',2026,'2026-07-05');

-- =====================================================
-- Exam Results Table
-- =====================================================

CREATE TABLE exam_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    exam_date DATE,
    score DECIMAL(5,2),
    grade CHAR(2),
    FOREIGN KEY (enrollment_id)
        REFERENCES enrollments(enrollment_id)
);

INSERT INTO exam_results
(enrollment_id,exam_date,score,grade)
VALUES
(1,'2026-05-15',88,'A'),
(2,'2026-05-16',82,'A'),
(3,'2026-05-15',76,'B'),
(4,'2026-05-15',91,'A'),
(5,'2026-05-16',85,'A'),
(6,'2026-05-18',73,'B'),
(7,'2026-05-19',68,'C'),
(8,'2026-05-20',79,'B'),
(9,'2026-05-21',81,'A'),
(10,'2026-05-22',87,'A'),
(11,'2026-05-23',72,'B'),
(12,'2026-05-24',94,'A'),
(13,'2026-05-25',77,'B'),
(14,'2026-11-20',84,'A'),
(15,'2026-11-20',75,'B');

-- =====================================================
-- Verify Data
-- =====================================================

SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
SELECT * FROM exam_results;