-- Знайти середній бал, який ставить певний викладач зі своїх предметів.

SELECT l.full_name AS lecturer_name, AVG(m.mark) AS avg_mark 
FROM lecturers AS l
JOIN subjects AS s ON s.lecturer_fk = l.id 
JOIN marks AS m ON m.subject_fk = s.id 
GROUP BY l.id;
