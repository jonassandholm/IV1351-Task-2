CREATE TABLE course_layout (
 course_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 course_code  VARCHAR(50) NOT NULL,
 course_name VARCHAR(50) NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL,
 hp INT NOT NULL
);

ALTER TABLE course_layout ADD CONSTRAINT PK_course_layout PRIMARY KEY (course_id);


CREATE TABLE department (
 department_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 department_name  VARCHAR(200) NOT NULL,
 department_manager_id INT
);

ALTER TABLE department ADD CONSTRAINT PK_department PRIMARY KEY (department_id);


CREATE TABLE employee (
 employee_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_set VARCHAR(200) NOT NULL,
 job_title VARCHAR(50) NOT NULL,
 person_id INT NOT NULL,
 department_id INT NOT NULL,
 manager_id INT
);

ALTER TABLE employee ADD CONSTRAINT PK_employee PRIMARY KEY (employee_id);


CREATE TABLE job_title (
 job_title_id VARCHAR(50) NOT NULL,
 job_name VARCHAR(50)
);

ALTER TABLE job_title ADD CONSTRAINT PK_job_title PRIMARY KEY (job_title_id);


CREATE TABLE person (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 personal_number  VARCHAR(12) NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 phone_number VARCHAR(10) NOT NULL,
 adress VARCHAR(200) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_id);


CREATE TABLE salary_history (
 salary_history_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 salary INT,
 fiscial_year DATE,
 employee_id INT
);

ALTER TABLE salary_history ADD CONSTRAINT PK_salary_history PRIMARY KEY (salary_history_id);


CREATE TABLE teaching_activity (
 teaching_activity_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 activity_name  VARCHAR(100) NOT NULL,
 factor NUMERIC(10) NOT NULL
);

ALTER TABLE teaching_activity ADD CONSTRAINT PK_teaching_activity PRIMARY KEY (teaching_activity_id);


CREATE TABLE course_instance (
 instance_id VARCHAR(50) NOT NULL,
 num_students VARCHAR(10) NOT NULL,
 study_period VARCHAR(50) NOT NULL,
 study_year VARCHAR(50) NOT NULL,
 course_id INT NOT NULL
);

ALTER TABLE course_instance ADD CONSTRAINT PK_course_instance PRIMARY KEY (instance_id);


CREATE TABLE planned_activity (
 instance_id VARCHAR(50) NOT NULL,
 teaching_activity_id INT NOT NULL,
 planned_hours INT NOT NULL
);

ALTER TABLE planned_activity ADD CONSTRAINT PK_planned_activity PRIMARY KEY (instance_id,teaching_activity_id);


CREATE TABLE employee_activity (
 employee_id INT NOT NULL,
 instance_id VARCHAR(50) NOT NULL,
 teaching_activity_id INT NOT NULL,
 allocated_hours INT
);

ALTER TABLE employee_activity ADD CONSTRAINT PK_employee_activity PRIMARY KEY (employee_id,instance_id,teaching_activity_id);


ALTER TABLE department ADD CONSTRAINT FK_department_0 FOREIGN KEY (department_manager_id) REFERENCES employee (employee_id);


ALTER TABLE employee ADD CONSTRAINT FK_employee_0 FOREIGN KEY (job_title) REFERENCES job_title (job_title_id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_1 FOREIGN KEY (person_id) REFERENCES person (person_id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_2 FOREIGN KEY (department_id) REFERENCES department (department_id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_3 FOREIGN KEY (manager_id) REFERENCES employee (employee_id);


ALTER TABLE salary_history ADD CONSTRAINT FK_salary_history_0 FOREIGN KEY (employee_id) REFERENCES employee (employee_id);


ALTER TABLE course_instance ADD CONSTRAINT FK_course_instance_0 FOREIGN KEY (course_id) REFERENCES course_layout (course_id);


ALTER TABLE planned_activity ADD CONSTRAINT FK_planned_activity_0 FOREIGN KEY (instance_id) REFERENCES course_instance (instance_id);
ALTER TABLE planned_activity ADD CONSTRAINT FK_planned_activity_1 FOREIGN KEY (teaching_activity_id) REFERENCES teaching_activity (teaching_activity_id);


ALTER TABLE employee_activity ADD CONSTRAINT FK_employee_activity_0 FOREIGN KEY (employee_id) REFERENCES employee (employee_id);
ALTER TABLE employee_activity ADD CONSTRAINT FK_employee_activity_1 FOREIGN KEY (instance_id,teaching_activity_id) REFERENCES planned_activity (instance_id,teaching_activity_id);


