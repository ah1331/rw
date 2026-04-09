CREATE TABLE students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

INSERT INTO students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'Ansh', 'Patel', 'ansh@gmail.com', '2003-05-14', '2022-06-01'),
(2, 'Riya', 'Shah', 'riya@gmail.com', '2002-11-20', '2021-06-01'),
(3, 'Kunal', 'Mehta', 'kunal@gmail.com', '2003-02-10', '2022-06-01'),
(4, 'Sneha', 'Desai', 'sneha@gmail.com', '2001-09-25', '2020-06-01'),
(5, 'Yash', 'Trivedi', 'yash@gmail.com', '2002-07-18', '2021-06-01');

CREATE TABLE courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT
);

INSERT INTO courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 4),
(102, 'Data Structures', 2, 3),
(103, 'Operating Systems', 2, 4),
(104, 'Database Management', 1, 3);

CREATE TABLE instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT
);

INSERT INTO instructors (InstructorID, FirstName, LastName, Email, DepartmentID) VALUES
(1, 'Dr. Raj', 'Sharma', 'raj.sharma@gmail.com', 1),
(2, 'Dr. Priya', 'Mehta', 'priya.mehta@gmail.com', 2),
(3, 'Dr. Amit', 'Patel', 'amit.patel@gmail.com', 1);

CREATE TABLE enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID)
);

INSERT INTO enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-06-10'),
(2, 2, 102, '2022-06-12'),
(3, 3, 101, '2022-06-15'),
(4, 1, 102, '2022-06-18');

CREATE TABLE departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Mechanical Engineering');

SELECT * FROM students;
UPDATE students SET FirstName = 'Updated' WHERE StudentID = 1;
DELETE FROM students WHERE StudentID = 5;

SELECT * FROM enrollments WHERE EnrollmentDate > '2022-12-31';

SELECT *
FROM courses c
JOIN departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

SELECT c.CourseName, COUNT(e.StudentID) AS total_students
FROM enrollments e
JOIN courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName
HAVING COUNT(e.StudentID) > 5;

SELECT s.StudentID, s.FirstName
FROM students s
JOIN enrollments e ON s.StudentID = e.StudentID
JOIN courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName
HAVING COUNT(DISTINCT c.CourseName) = 2;

SELECT DISTINCT s.StudentID, s.FirstName
FROM students s
JOIN enrollments e ON s.StudentID = e.StudentID
JOIN courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

SELECT AVG(Credits) AS avg_credits
FROM courses;

SELECT MAX(Salary)
FROM instructors i
JOIN departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

SELECT d.DepartmentName, COUNT(e.StudentID) AS total_students
FROM enrollments e
JOIN courses c ON e.CourseID = c.CourseID
JOIN departments d ON c.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

SELECT s.FirstName, c.CourseName
FROM enrollments e
JOIN students s ON e.StudentID = s.StudentID
JOIN courses c ON e.CourseID = c.CourseID;

SELECT s.FirstName, c.CourseName
FROM students s
LEFT JOIN enrollments e ON s.StudentID = e.StudentID
LEFT JOIN courses c ON e.CourseID = c.CourseID;

SELECT *
FROM students
WHERE StudentID IN (
    SELECT StudentID
    FROM enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

SELECT EXTRACT(YEAR FROM EnrollmentDate) AS year
FROM enrollments;

SELECT FirstName || ' ' || LastName AS FullName
FROM instructors;

SELECT CourseID,
       COUNT(StudentID) OVER (ORDER BY CourseID) AS running_total
FROM enrollments;

SELECT StudentID,
       CASE 
           WHEN AGE(EnrollmentDate) > INTERVAL '4 years' THEN 'Senior'
           ELSE 'Junior'
       END AS status
FROM enrollments;