-- Знайти список курсів, які відвідує студент.

SELECT DISTINCT sb.subject_name 
FROM students AS st
JOIN marks AS m ON m.student_fk = st.id 
JOIN subjects AS sb ON sb.id = m.subject_fk 
WHERE st.full_name = '?'; -- імя студента
