-- Середній бал, який певний викладач ставить певному студентові.

SELECT AVG(m.mark) AS avg_mark
FROM students AS st 
JOIN marks AS m ON m.student_fk = st.id 
JOIN subjects AS sb ON sb.id = m.subject_fk 
JOIN lecturers AS l ON l.id = sb.lecturer_fk 
WHERE l.full_name = '?' -- імя викладача
AND st.full_name = '?'; -- імя студента
