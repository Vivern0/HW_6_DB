-- Знайти середній бал у групах з певного предмета.

SELECT g.group_name, AVG(m.mark) AS avg_mark
FROM groups AS g 
JOIN students AS st ON st.group_fk = g.id 
JOIN marks AS m ON m.student_fk = st.id 
JOIN subjects AS sb ON sb.id = m.subject_fk 
WHERE sb.subject_name = '?' -- назва певного предмету
GROUP BY g.id;
