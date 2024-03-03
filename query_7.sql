-- Знайти оцінки студентів у окремій групі з певного предмета.

SELECT st.full_name, m.mark 
FROM students AS st 
JOIN marks AS m ON st.id = m.student_fk 
JOIN subjects AS sb ON m.subject_fk = sb.id 
WHERE st.group_fk = '?' -- номер групи
AND sb.subject_name = '?'; -- назва предмету
