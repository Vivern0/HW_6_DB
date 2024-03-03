-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.

SELECT s.full_name, AVG(m.mark) AS avg_mark
FROM students as s
JOIN marks as m ON s.id = m.student_fk
GROUP BY s.id
ORDER BY avg_mark DESC
LIMIT 5;
