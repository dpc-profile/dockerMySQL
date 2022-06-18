-- https://youtu.be/HXV3zeQKqGY?t=7716 #FreeCodeCamp Database course
USE girafa;

SELECT student.student_id, student.name, student.major
FROM student
WHERE student_id > 3 OR major = 'Biology'
-- WHERE name IN ('Claire', 'Kate', 'Mike')
ORDER BY name
LIMIT 5;