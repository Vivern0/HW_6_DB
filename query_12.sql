-- Оцінки студентів у певній групі з певного предмета на останньому занятті.

SELECT st.full_name, m.mark 
FROM students AS st 
JOIN marks AS m ON m.student_fk = st.id 
JOIN subjects AS sb ON sb.id = m.subject_fk 
JOIN groups AS g ON g.id = st.group_fk 
WHERE sb.subject_name = 'предмет' 
AND g.group_name = 'група' 
AND m.date = (SELECT MAX(date) FROM marks AS m2 WHERE m2.subject_fk = sb.id);
