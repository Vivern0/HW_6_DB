-- Знайти які курси читає певний викладач.

SELECT s.subject_name AS subjects
FROM lecturers AS l 
JOIN subjects AS s ON s.lecturer_fk = l.id 
WHERE l.full_name = 'імя_викладача';