-- Знайти студента із найвищим середнім балом з певного предмета.

SELECT st.full_name, AVG(m.mark) AS avg_mark
FROM students AS st
JOIN marks AS m ON st.id = m.student_fk
JOIN subjects AS sb ON m.subject_fk = sb.id
WHERE sb.subject_name = 'назва_певного_предмету' 
GROUP BY st.id
ORDER BY avg_mark DESC
LIMIT 1;
