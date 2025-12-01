select l.course_code,
l.hp,
i.instance_id,
i.num_students,
i.study_period,
SUM(CASE WHEN t.activity_name = 'Lecture' THEN t.factor * p.planned_hours ELSE 0 END) as Lecture,
SUM(CASE WHEN t.activity_name = 'Other Overhead' THEN t.factor * p.planned_hours ELSE 0 END) as OtherOverhead,
SUM(CASE WHEN t.activity_name = 'Admin' THEN t.factor * p.planned_hours ELSE 0 END) as Admin,
SUM(CASE WHEN t.activity_name = 'Exam' THEN t.factor * p.planned_hours ELSE 0 END) as Exam,
SUM(CASE WHEN t.activity_name = 'Seminar' THEN t.factor * p.planned_hours ELSE 0 END) as Seminar,
SUM(CASE WHEN t.activity_name = 'Tutorial' THEN t.factor * p.planned_hours ELSE 0 END) as Tutorial,
SUM(CASE WHEN t.activity_name = 'Lab' THEN t.factor * p.planned_hours ELSE 0 END) as Lab,
SUM(t.factor * p.planned_hours) as Total
FROM course_layout as l 
LEFT JOIN course_instance as i ON l.course_id = i.course_id 
LEFT JOIN planned_activity as p ON p.instance_id = i.instance_id
LEFT JOIN teaching_activity as t ON t.teaching_activity_id = p.teaching_activity_id
GROUP BY 
l.course_code,
l.hp,
i.instance_id,
i.num_students,
i.study_period;
