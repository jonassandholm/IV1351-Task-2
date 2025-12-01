SELECT 
e.employee_id,
CONCAT(p.first_name, ' ', p.last_name) AS Name,
ca.study_period as Period,
COUNT(DISTINCT ca.instance_id) AS "NO of courses"
FROM employee as e
LEFT JOIN person as p ON p.person_id = e.person_id
LEFT JOIN employee_activity as ea ON ea.employee_id = e.employee_id
LEFT JOIN planned_activity as pa ON pa.instance_id = ea.instance_id AND pa.teaching_activity_id = ea.teaching_activity_id
LEFT JOIN course_instance as ca ON ca.instance_id = ea.instance_id
WHERE ca.study_period = 'P2'
GROUP BY 
p.first_name,
e.employee_id,
p.first_name,
p.last_name,
ca.study_period
ORDER BY
e.employee_id;

