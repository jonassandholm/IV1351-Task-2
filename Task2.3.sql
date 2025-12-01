select l.course_code,
l.hp,
i.instance_id,
CONCAT(person.first_name,' ', person.last_name) as Name,
SUM(CASE WHEN t.activity_name = 'Lecture' THEN t.factor * ea.allocated_hours ELSE 0 END) as Lecture,
SUM(CASE WHEN t.activity_name = 'Other Overhead' THEN t.factor * ea.allocated_hours ELSE 0 END) as OtherOverhead,
SUM(CASE WHEN t.activity_name = 'Admin' THEN t.factor * ea.allocated_hours ELSE 0 END) as Admin,
SUM(CASE WHEN t.activity_name = 'Exam' THEN t.factor * ea.allocated_hours ELSE 0 END) as Exam,
SUM(CASE WHEN t.activity_name = 'Seminar' THEN t.factor * ea.allocated_hours ELSE 0 END) as Seminar,
SUM(CASE WHEN t.activity_name = 'Tutorial' THEN t.factor * ea.allocated_hours ELSE 0 END) as Tutorial,
SUM(CASE WHEN t.activity_name = 'Lab' THEN t.factor * ea.allocated_hours ELSE 0 END) as Lab,
SUM(t.factor * ea.allocated_hours) as Total
FROM course_layout as l 
LEFT JOIN course_instance as i ON l.course_id = i.course_id 
LEFT JOIN planned_activity as p ON p.instance_id = i.instance_id
LEFT JOIN teaching_activity as t ON t.teaching_activity_id = p.teaching_activity_id
LEFT JOIN employee_activity as ea ON ea.teaching_activity_id = p.teaching_activity_id AND ea.instance_id = p.instance_id
LEFT JOIN employee as e ON e.employee_id = ea.employee_id
LEFT JOIN person ON person.person_id = e.person_id
WHERE i.study_year = '2025'
GROUP BY 
l.course_code,
l.hp,
i.instance_id,
i.num_students,
i.study_period,
person.first_name,
person.last_name
ORDER BY person.first_name;
