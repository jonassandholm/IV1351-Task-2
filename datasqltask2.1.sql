-- 1. Departments
INSERT INTO department (department_name, department_manager_id) VALUES
('Computer Science', NULL),
('Mathematics', NULL);

-- 2. Job Titles
INSERT INTO job_title (job_title_id, job_name) VALUES
('PROF', 'Professor'),
('ASSIST', 'Assistant'),
('LECT', 'Lecturer');

-- 3. Persons
INSERT INTO person (personal_number, first_name, last_name, phone_number, adress) VALUES
('199001011234', 'Niharika', 'Gauraha', '0701234567', 'Street 1'),
('199202022345', 'Björn', 'Berg', '0702345678', 'Street 2'),
('198805033456', 'Carina', 'Carlsson', '0703456789', 'Street 3');

-- 4. Employees
INSERT INTO employee (skill_set, job_title, person_id, department_id, manager_id) VALUES
('CS Research', 'PROF', 1, 1, NULL),
('Math Research', 'PROF', 2, 2, NULL),
('Lab Assist', 'ASSIST', 3, 1, 1);

-- 5. Course Layouts
INSERT INTO course_layout (course_code, course_name, min_students, max_students, hp) VALUES
('IX1500', 'Intro CS', 10, 200, 7.5),
('IV1351', 'Algorithms', 10, 150, 7.5),
('ID2214', 'Databases', 10, 100, 7.5),
('IV1350', 'Networks', 10, 120, 7.5);

-- 6. Teaching Activities med olika faktorer
INSERT INTO teaching_activity (activity_name, factor) VALUES
('Lecture', 1.2),          -- Lärartid för föreläsning vägs mer
('Tutorial', 1.0),         -- Standardfaktor
('Lab', 1.5),              -- Labbar tar mer tid per timme
('Seminar', 1.1),          -- Seminarier tar lite mer än 1
('Other Overhead', 0.8),   -- Övrigt arbete vägs lite mindre
('Admin', 0.9),            -- Administrativt arbete vägs lite mindre
('Exam', 1.3);             -- Tentor vägs lite mer

-- 7. Course Instances
INSERT INTO course_instance (instance_id, num_students, study_period, study_year, course_id) VALUES
('2025-50413', '150', 'P1', '2025', 1),
('2025-50273', '120', 'P2', '2025', 2),
('2025-50341', '100', 'P2', '2025', 3),
('2025-60104', '80', 'P3', '2025', 4);

-- 8. Planned Activities
INSERT INTO planned_activity (instance_id, teaching_activity_id, planned_hours) VALUES
('2025-50413', 1, 159), -- Lecture
('2025-50413', 5, 100), -- Other Overhead
('2025-50413', 6, 141), -- Admin
('2025-50413', 7, 73),  -- Exam

('2025-50273', 4, 64),  -- Seminar
('2025-50273', 5, 100),
('2025-50273', 6, 43),
('2025-50273', 7, 61),

('2025-50341', 1, 44),  -- Lecture
('2025-50341', 2, 36),  -- Tutorial
('2025-50341', 5, 40),
('2025-50341', 7, 20),

('2025-60104', 2, 25),  -- Tutorial
('2025-60104', 5, 100),
('2025-60104', 7, 74);

-- 9. Employee Activities (allocated hours)
-- Här kan du lägga flera lärare om du vill. Just nu är alla timmar kopplade till Niharika (employee_id=1)
INSERT INTO employee_activity (employee_id, instance_id, teaching_activity_id, allocated_hours) VALUES
(1, '2025-50413', 1, 159),
(2, '2025-50413', 5, 100),
(1, '2025-50413', 6, 141),
(3, '2025-50413', 7, 73),

(1, '2025-50273', 4, 64),
(1, '2025-50273', 5, 100),
(3, '2025-50273', 6, 43),
(3, '2025-50273', 7, 61),

(2, '2025-50341', 1, 44),
(2, '2025-50341', 2, 36),
(1, '2025-50341', 5, 40),
(3, '2025-50341', 7, 20),

(3, '2025-60104', 2, 25),
(3, '2025-60104', 5, 100),
(1, '2025-60104', 7, 74);